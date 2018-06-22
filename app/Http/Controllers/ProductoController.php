<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Producto;
use App\CategoriaProducto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view("producto.index");
    }
    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $categoria = CategoriaProducto::where('estado', '=', 'activo')->get();
        return view('producto.create', compact('categoria'));
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
        
        Producto::create($requestData);

        return redirect('admin/producto')->with('flash_message', 'Producto added!');
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
        $producto = Producto::findOrFail($id);

        return view('producto.show', compact('producto'));
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
        $producto = Producto::findOrFail($id);
        $categoria = CategoriaProducto::where('estado', '=', 'activo')->get();
        return view('producto.edit', compact('producto', 'categoria'));
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
        
        $producto = Producto::findOrFail($id);
        $producto->update($requestData);

        return redirect('admin/producto')->with('flash_message', 'Producto updated!');
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
        Producto::destroy($id);

        return redirect('admin/producto')->with('flash_message', 'Producto deleted!');
    }

    public function getDataTable()
    {
        $model = Producto::select(['id', 'nombre', 'costo', 'cantidad', 'descripcion', 'duracion']);

        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/admin/producto/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/admin/producto/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/admin/producto/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);
    }
}
