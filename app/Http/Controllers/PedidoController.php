<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use DB;
use App\Pedido;
use App\DetallePedido;
use App\Producto;
use App\Cliente;
use App\Lote;
use Illuminate\Http\Request;

class PedidoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('pedido.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $productos = Producto::select('producto.id', 'costo', DB::raw('CONCAT(producto.nombre, " [ ", categoria_producto.nombre, " ]") as producto')) //'producto.nombre', 'categoria_producto.nombre as categoria', 
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->orderBy('producto.nombre')
        ->get();
        return view('pedido.create', compact('productos'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            // insertamos un cliente si no existe
            $cliente = new Cliente;
            if ($request->has('cliente_id')) {
                $cliente->id = $request->cliente_id;
            }
            else {
                $cliente = Cliente::where('ci', $request->cliente_ci)->first();
                if (!$cliente) {
                    $cliente->nombre = $request->cliente_nombre;
                    $cliente->ci = $request->cliente_ci;
                    $cliente->save();
                }
            }
            // insertamos la pedido
            $requestData = $request->all();
            
            if (auth('api')->user()) {
                $requestData = array_add($requestData, 'tipo', 'movil');
            } else {
                $requestData = array_add($requestData, 'tipo', 'tienda');
            }

            // seteamos el cliente_id porque podia estar vacio o simplemente remplaza con el mismo valor que tenia
            array_set($requestData, 'cliente_id', $cliente->id);
            $requestData = array_add($requestData, 'fecha', date("Y-m-d"));
            $requestData = array_add($requestData, 'estado', 'espera');
            $pedido = Pedido::create($requestData);

            $requestData = $request->all();
            if (auth('api')->user()) {
                foreach ($request->cantidad as $key => $row) {
                    foreach ($row as $producto_id => $value) {
                        $detalle_pedido = new DetallePedido;
                        $detalle_pedido->descripcion = $request->descripcion[$key][$producto_id];
                        $detalle_pedido->cantidad = $request->cantidad[$key][$producto_id];
                        $detalle_pedido->subtotal = $request->subtotal[$key][$producto_id];
                        $detalle_pedido->pedido_id = $pedido->id;
                        $detalle_pedido->producto_id = $producto_id;
                        $detalle_pedido->save();
                    }
                }
            } else {
                foreach ($request->cantidad as $key => $value) {
                    // insertamos el detalle de pedido por cada producto vendido
                    $detalle_pedido = new DetallePedido;
                    $detalle_pedido->descripcion = $request->descripcion[$key];
                    $detalle_pedido->cantidad = $request->cantidad[$key];
                    $detalle_pedido->subtotal = $request->subtotal[$key];
                    $detalle_pedido->pedido_id = $pedido->id;
                    $detalle_pedido->producto_id = $key;
                    $detalle_pedido->save();
                }
            }
            DB::commit();
            return auth('api')->user() ? response()->json(['message' => 'Pedido guardado correctamente!!']) : redirect('pedido/'.$pedido->id);
        } catch (Exception $e) {
            DB::rollBack();
            return auth('api')->user() ? response()->json(['message' => 'Error']) : redirect('pedido/create');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $pedido = Pedido::select('id', 'cliente_id', 'fecha', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total', 'descuento', 'total_importe', 'forma_de_pago', 'estado', 'tipo')
        ->where('id', $id)
        ->first();//findOrFail
        if ($pedido) {
            $pedido->detalle_pedido;
            foreach ($pedido->detalle_pedido as $key => $value) {
                $value->nombre = Producto::where('id', $value->producto_id)->value('nombre');
            }
            
            return auth('api')->user() ? response()->json($pedido) : view('pedido.show', compact('pedido'));
        }
        return auth('api')->user() ? response()->json(['message' => 'Error'], 401) : redirect('pedido');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $pedido = Pedido::findOrFail($id);
        $productos = Producto::select('producto.id', 'costo', DB::raw('CONCAT(producto.nombre, " [ ", categoria_producto.nombre, " ]") as producto')) //'producto.nombre', 'categoria_producto.nombre as categoria', 
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->orderBy('producto.nombre')
        ->get();

        return view('pedido.edit', compact('pedido', 'productos'));
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $requestData = $request->all();
            $pedido = Pedido::findOrFail($id);
            $pedido->update($requestData);

            DetallePedido::where('pedido_id', '=', $id)->delete();

            foreach ($request->cantidad as $key => $value) {
                // insertamos el detalle de pedido por cada producto vendido
                $detalle_pedido = new DetallePedido;
                $detalle_pedido->descripcion = $request->descripcion[$key];
                $detalle_pedido->cantidad = $request->cantidad[$key];
                $detalle_pedido->subtotal = $request->subtotal[$key];
                $detalle_pedido->pedido_id = $pedido->id;
                $detalle_pedido->producto_id = $key;
                $detalle_pedido->save();
            }
            DB::commit();
            return redirect('pedido/'.$pedido->id);
        } catch (Exception $e) {
            DB::rollBack();
            return redirect('pedido/create');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        // Pedido::destroy($id);

        return redirect('pedido');
    }

    public function getDataTable()
    {
        $model = Pedido::select(['pedido.id', 'cliente.nombre', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total_importe'])
        ->join('cliente', 'pedido.cliente_id', '=', 'cliente.id')
        ->where('pedido.tipo', '=', 'tienda')
        ->where('pedido.estado', '!=', 'cancelado');
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/pedido/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            // ->editColumn('cliente_id', function ($model) { return $model->cliente->nombre; })
            ->make(true);

    }

    public function getPendientes() 
    {
        return view('pedido.pendientes');
    }

    public function getDataTablePendiente()
    {
        $model = Pedido::select(['pedido.id', 'cliente.nombre', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total_importe', 'pedido.tipo'])
        ->join('cliente', 'pedido.cliente_id', '=', 'cliente.id')
        ->where('pedido.estado', '=', 'espera');
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a class="btn btn-success btn-sm waves-effect waves-light" title="Entregar" onclick="entregar('.$model->id.');"><i class="fas fa-paper-plane"></i></a>'.
                '<a class="btn btn-danger btn-sm waves-effect waves-light" title="Cancelar" onclick="cancelar('.$model->id.');"><i class="fas fa-trash"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            // ->editColumn('cliente_id', function ($model) { return $model->cliente->nombre; })
            ->make(true);

    }

    public function updatePendiente(Request $request)
    {
        try {
            DB::beginTransaction();
            $pedido = Pedido::findOrFail($request->id);
            if ($request->estado == "entregado") {
                foreach ($pedido->detalle_pedido as $key => $value) {
                    Producto::where(['id' => $value->producto_id])
                    ->decrement('cantidad', $value->cantidad);
                    $lotes = Lote::where(['producto_id' => $value->producto_id])
                    ->where('cantidad', '>', 0)
                    ->orderBy('id')
                    ->get();
                    $cantidad_ = $value->cantidad;
                    foreach ($lotes as $k => $lote) {
                        $aux = $lote->cantidad - $cantidad_;
                        if ($aux >= 0) {
                            Lote::where(['id' => $lote->id])
                            ->decrement('cantidad', $cantidad_);
                            $cantidad_ = 0;
                            break;
                        }
                        else {
                            Lote::where(['id' => $lote->id])
                            ->decrement('cantidad', $lote->cantidad);
                            $cantidad_ -= $lote->cantidad;
                        }
                    } 
                }
                
            }
            
            $pedido->estado = $request->estado;
            $pedido->save();
            
            DB::commit();
            return response()->json([ 'message' => 'ok' ]);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json([ 'message' => 'error' ], 500);
        }
    }

    public function reportePedido(Request $request)
    {
        
        $date = date("Y-m");
        $tipo = "tienda";
        $estado = "espera";
        if ($request->year && $request->month) {
            $date = date("Y-m", strtotime($request->year . "-" . $request->month . "-01"));
            $tipo = $request->tipo;
            $estado = $request->estado;
        }
        $pedidos = Pedido::select('fecha_entrega', 'total_importe')->where(['tipo' => $tipo, 'estado' => $estado])->get();

        $array = [];

        foreach ($pedidos as $key => $value) {
            $fecha = date("Y-m", strtotime($value->fecha_entrega));
            if ($fecha == $date) {
                $array = array_add(
                    $array, 
                    $key, 
                    [date("Y-m-d", strtotime($value->fecha_entrega)), $value->total_importe]
                );
            }
        }
        
        $data = [];

        for ($i=1; $i <= $this->getMonthDays(date("m", strtotime($date)), date("Y", strtotime($date))); $i++) { 
            $total = 0;
            $aux = date("Y-m-d", strtotime($date . "-" . $i));
            foreach ($array as $key => $value) {
                if ($aux == $value[0]) {
                    $total += $value[1];
                }
            }
            $data = array_add($data, $aux, $total);
        }
        $años = $this->getYears();
        $mes = date("m", strtotime($date));
        $año = date("Y", strtotime($date));
        return view('reportes.pedidos', compact('data', 'años', 'mes', 'año', 'tipo', 'estado'));
    }

    private function getMonthDays($Month, $Year) 
    { 
        return date("t", mktime(0,0,0,$Month,1,$Year)); 
    } 

    private function getYears() 
    { 
        $pedidos = Pedido::select('fecha_entrega')->get();
        $collection = collect([]);
        foreach ($pedidos as $key => $value) {
            $collection->push(date("Y", strtotime($value->fecha_entrega)));
        }
        return $collection->unique();
    } 

    public function getPedidoByCliente($cliente_id)
    {
        $pedidos = Pedido::select('id', 'fecha', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total', 'descuento', 'total_importe', 'forma_de_pago', 'tipo', 'estado')
        ->where([
            ['cliente_id', '=', $cliente_id], 
            // ['estado', '=', 'espera']
        ])
        ->get();
        
        return response()->json($pedidos);
    }
}
