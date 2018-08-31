<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Promocion;
use App\Producto;
use DB;
use Illuminate\Http\Request;

class PromocionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('promocion.index');
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
        return view('promocion.create', compact('productos'));
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
        
        $requestData = $request->all();
        
        $v = \Validator::make($requestData, [
            'descuento' => 'required|between:0,99.99',
            'fecha' => 'required|date_format:Y-m-d',
            'duracion' => 'required||string|max:255',
            'estado' => 'required|string|max:255',
            'producto_id' => 'required|string|max:255',

        ]);
 
        if ($v->fails())
        {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }
        
        Promocion::create($requestData);

        return redirect('promocion')->with('flash_message', 'Promocion added!');
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
        $promocion = Promocion::findOrFail($id);

        return view('promocion.show', compact('promocion'));
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
        $promocion = Promocion::findOrFail($id);

        return view('promocion.edit', compact('promocion'));
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
            'descuento' => 'required|between:0,99.99',
            'fecha' => 'required|date_format:Y-m-d',
            'duracion' => 'required||string|max:255',
            'estado' => 'required|string|max:255',
            'producto_id' => 'required|string|max:255',

        ]);
 
        if ($v->fails())
        {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }
        
        $promocion = Promocion::findOrFail($id);
        $promocion->update($requestData);

        return redirect('promocion')->with('flash_message', 'Promocion updated!');
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
        Promocion::destroy($id);

        return redirect('promocion')->with('flash_message', 'Promocion deleted!');
    }

    public function getDataTable()
    {
        $model = Promocion::select('promocion.id', 'producto.nombre', 'promocion.precio', 'promocion.duracion', 'promocion.unidad')
        ->join('producto', 'promocion.producto_id', '=', 'producto.id')
        ->where(['promocion.estado' => 'vigente']);
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/promocion/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            // ->editColumn('cliente_id', function ($model) { return $model->cliente->nombre; })
            ->make(true);

    }

    public function getPromocion() 
    {
        $data = Promocion::select('promocion.id', 'producto_id', 'nombre', 'producto.imagen', 'producto.descripcion', 'producto.imagen', 'promocion.precio', 'promocion.duracion', 'promocion.unidad')
        ->join('producto', 'promocion.producto_id', '=', 'producto.id')
        ->where([
            'promocion.estado' => 'vigente',
            'producto.estado' => 'activo',
        ])
        ->get();
        foreach ($data as $key => $value) {
            $value->imagen = $value->imagen ? asset('img/producto/'.$value->imagen) : asset('img/producto/sid.jpg');
        }
        return $data;
    }
}
