<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\CategoriaProducto;
use Storage;
use File;
use Illuminate\Http\Request;

class CategoriaProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('categoriaproducto.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('categoriaproducto.create');
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

        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\categoria');

            $imagen->move($path, $nombre_img);
            $variable = CategoriaProducto::create([
                'nombre' => $request->nombre,
                'imagen' => $nombre_img,
            ]);
            return redirect('admin/categoriaproducto');
        }
        else {
            return view('admin/categoriaproducto/create');
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
        $categoriaproducto = CategoriaProducto::findOrFail($id);

        return view('categoriaproducto.show', compact('categoriaproducto'));
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
        $categoriaproducto = CategoriaProducto::findOrFail($id);

        return view('categoriaproducto.edit', compact('categoriaproducto'));
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
        $categoriaproducto = CategoriaProducto::findOrFail($id);
        $categoriaproducto->nombre = $request->nombre;
        if ($request->hasFile('imagen')) {
            // elimina la imagen
            Storage::disk('local')->delete("categoria/". $categoriaproducto->imagen);

            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\categoria');

            $imagen->move($path, $nombre_img);

            $categoriaproducto->imagen = $nombre_img;
        }
        $categoriaproducto->save();
        return redirect('admin/categoriaproducto');
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
        $categoriaproducto = CategoriaProducto::findOrFail($id);
        CategoriaProducto::destroy($id);
        Storage::disk('local')->delete("categoria/". $categoriaproducto->imagen);
        return redirect('admin/categoriaproducto');
    }

    public function getDataTable()
    {
        $model = CategoriaProducto::select(['id', 'nombre', 'imagen'])->orderBy('id', 'desc');
        $path = storage_path('app\categoria');
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/admin/categoriaproducto/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/admin/categoriaproducto/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/admin/categoriaproducto/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);

    }

}
