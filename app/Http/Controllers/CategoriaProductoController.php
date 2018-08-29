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
        $nombre_img = NULL;
        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\categoria');

            $imagen->move($path, $nombre_img);
        }
        $res = CategoriaProducto::create([
            'nombre' => $request->nombre,
            'imagen' => $nombre_img,
            'estado' => 'activo',
        ]);
        if ($res) {
            return redirect('categoriaproducto');
        }
        else {
            return redirect('categoriaproducto/create');
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
            if ($categoriaproducto->imagen) {
                // elimina la imagen
                Storage::disk('local')->delete("categoria/". $categoriaproducto->imagen);
            }
                
            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\categoria');

            $imagen->move($path, $nombre_img);

            $categoriaproducto->imagen = $nombre_img;
        }
        $categoriaproducto->save();
        return redirect('categoriaproducto');
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
        $categoriaproducto->estado = "inactivo";
        $categoriaproducto->save();
        // CategoriaProducto::destroy($id);
        // if ($categoriaproducto->imagen) {
        //     Storage::disk('local')->delete("categoria/". $categoriaproducto->imagen);
        // }
        return redirect('categoriaproducto');
    }

    public function getDataTable()
    {
        $model = CategoriaProducto::select(['id', 'nombre', 'imagen'])->where(['estado' => 'activo']);
        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/categoriaproducto/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/categoriaproducto/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/categoriaproducto/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);

    }

    public function getCategoria() 
    {
        header('Access-Control-Allow-Origin: *');
        $data = CategoriaProducto::select('id', 'nombre', 'imagen')->where(['estado' => 'activo'])->get();
        foreach ($data as $key => $value) {
            $value->imagen = asset('img/categoria/'.$value->imagen);
        }
        return $data;
    }    

}
