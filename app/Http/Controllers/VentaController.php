<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Venta;
use App\Producto;
use App\Cliente;
use App\DetalleVenta;
use DB;
use Illuminate\Http\Request;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('venta.index');
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
        ->where(['producto.estado' => 'activo'])
        ->orderBy('producto.nombre')
        ->get();
        return view('venta.create', compact('productos'));
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
            // insertamos la venta
            $venta = new Venta;
            $venta->fecha = date("Y-m-d H:i:s");
            $venta->total = $request->total;
            $venta->descuento = $request->descuento;
            $venta->total_importe = $request->total_importe;
            $venta->cliente_id = $cliente->id;
            $venta->users_id = auth()->user()->id;
            $venta->save();

            foreach ($request->cantidad as $key => $value) {
                // insertamos el detalle de venta por cada producto vendido
                $detalle_venta = new DetalleVenta;
                $detalle_venta->cantidad = $request->cantidad[$key];
                $detalle_venta->subtotal = $request->subtotal[$key];
                $detalle_venta->venta_id = $venta->id;
                $detalle_venta->producto_id = $key;
                $detalle_venta->save();
                // disminuir el stock del producto
                Producto::where(['id' => $key])
                ->decrement('cantidad', $request->cantidad[$key]);
            }
            DB::commit();
            return redirect('venta');
        } catch (Exception $e) {
            DB::rollBack();
            return redirect('venta/create');
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
        $venta = Venta::findOrFail($id);
        return view('venta.show', compact('venta'));
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
        $venta = Venta::findOrFail($id);
        return view('venta.edit', compact('venta'));
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
        
        $venta = Venta::findOrFail($id);
        $venta->update($requestData);

        return redirect('venta')->with('flash_message', 'Venta updated!');
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
        Venta::destroy($id);

        return redirect('venta')->with('flash_message', 'Venta deleted!');
    }

    public function getDataTable()
    {
        $model = Venta::select(['venta.id', 'cliente.nombre', 'fecha', 'total', 'descuento', 'total_importe'])
        ->join('cliente', 'venta.cliente_id', '=', 'cliente.id');
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/venta/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            // ->editColumn('cliente_id', function ($model) { return $model->cliente->nombre; })
            ->make(true);
    }
}
