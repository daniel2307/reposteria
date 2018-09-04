<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use DB;
use App\Pedido;
use App\DetallePedido;
use App\Producto;
use App\Cliente;
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
            $pedido = new Pedido;
            $pedido->cliente_id = $cliente->id;
            $pedido->fecha = date("Y-m-d");
            $pedido->fecha_entrega = $request->fecha_entrega;
            $pedido->hora_entrega = $request->hora_entrega;
            $pedido->acuenta = $request->acuenta;
            $pedido->saldo = $request->saldo;
            $pedido->total = $request->total;
            $pedido->descuento = $request->descuento;
            $pedido->total_importe = $request->total_importe;
            $pedido->tipo = "tienda";
            $pedido->estado = "espera";
            $pedido->forma_de_pago = $request->forma_de_pago;
            $pedido->save();

            foreach ($request->cantidad as $key => $value) {
                // insertamos el detalle de pedido por cada producto vendido
                $detalle_pedido = new DetallePedido;
                $detalle_pedido->cantidad = $request->cantidad[$key];
                $detalle_pedido->subtotal = $request->subtotal[$key];
                $detalle_pedido->pedido_id = $pedido->id;
                $detalle_pedido->producto_id = $key;
                $detalle_pedido->save();
            }
            DB::commit();
            return redirect('pedido');
        } catch (Exception $e) {
            DB::rollBack();
            return redirect('pedido/create');
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
        $pedido = Pedido::findOrFail($id);

        return view('pedido.show', compact('pedido'));
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

        return view('pedido.edit', compact('pedido'));
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
        
        $requestData = $request->all();
        
         $v = \Validator::make($requestData, [
            'saldo' => 'required',
            'estado' => 'required|string|max:255',
            'fecha' => 'required|date_format:Y-m-d',
            'fecha_entrega' => 'required|date_format:Y-m-d',
            'hora_entrega' => 'required',
            'forma_de_pago' => 'required|string|max:255',
            'cliente_id' => 'required|string|max:255',
        ]);
 
        if ($v->fails())
        {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }

        $pedido = Pedido::findOrFail($id);
        $pedido->update($requestData);

        return redirect('pedido');
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
        Pedido::destroy($id);

        return redirect('pedido');
    }

    public function getDataTable()
    {
        $model = Pedido::select(['pedido.id', 'cliente.nombre', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total_importe'])
        ->join('cliente', 'pedido.cliente_id', '=', 'cliente.id')
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
}
