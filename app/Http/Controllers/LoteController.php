<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Lote;
use App\Producto;

class LoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('stock.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $requestData = $request->all();
        $requestData = array_add($requestData, 'fecha', date("Y-m-d H:i:s"));
        $requestData = array_add($requestData, 'estado', 'activo');
        Lote::create($requestData);
        Producto::where(['id' => $request->producto_id])
                ->increment('cantidad', $request->cantidad);
        return response()->json(['message' => 'ok']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getDataTable()
    {
        $model = Producto::select(['producto.id', 'producto.nombre', 'categoria_producto.nombre as categoria', 'cantidad'])
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->where(['producto.estado' => 'activo']);

        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return '
                <div class="md-form input-group m-0">
                    <input type="number" class="form-control txt_cantidad" style="width:10px;" min="1">
                    <div class="input-group-append">
                        <button onclick="guardar(this,'.$model->id.');" class="btn btn-success btn-sm waves-effect m-0" type="button" title="Guardar"><i class="far fa-save" aria-hidden="true"></i></button>
                    </div>
                </div>
                ';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);
    }
}
