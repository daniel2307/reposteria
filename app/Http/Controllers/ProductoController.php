<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Producto;
use App\CategoriaProducto;
use Illuminate\Http\Request;
use Storage;
use File;
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
        // dd($request);
        $nombre_img = NULL;
        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\producto');

            $imagen->move($path, $nombre_img);
        }

        $res = Producto::create([
            'categoria_producto_id' => $request->categoria_producto_id,
            'nombre' => $request->nombre,
            'costo' => $request->costo,
            'cantidad' => $request->cantidad,
            'descripcion' => $request->descripcion,
            'duracion' => $request->duracion,
            'imagen' => $nombre_img
            
        ]);

        if ($res) {
            return redirect('producto');
        }
        else {
            return redirect('producto/create');
        }

       // $requestData = $request->all();
        
        //Producto::create($requestData);

        //return redirect('producto')->with('flash_message', 'Producto added!');
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
        $producto = Producto::findOrFail($id);
        $producto->nombre = $request->nombre;
        if ($request->hasFile('imagen')) {
            if ($producto->imagen) {
                // elimina la imagen
                Storage::disk('local')->delete("producto/". $producto->imagen);
            }
                
            $imagen = $request->file('imagen');

            $nombre_img = str_random(20) . '.' . $imagen->getClientOriginalExtension();

            $path = public_path('img\producto');

            $imagen->move($path, $nombre_img);

            $producto->imagen = $nombre_img;
        }
        $producto->save();
        return redirect('producto');
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
        $producto = Producto::findOrFail($id);
        $producto->estado = "eliminado";
        $producto->save();
        return redirect('producto');
    }

    public function getDataTable()
    {
        $model = Producto::select(['producto.id', 'producto.nombre', 'categoria_producto.nombre as categoria', 'costo', 'cantidad'])
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->where(['producto.estado' => 'activo']);

        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/producto/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/producto/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/producto/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);
    }

    public function getProductos() 
    {
        $data = Producto::select('producto.id', 'producto.nombre as producto', 'categoria_producto.nombre as categoria','producto.descripcion', 'producto.imagen', 'producto.costo', 'producto.cantidad')
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->where([
            'producto.estado' => 'activo',
        ])
        ->get();
        foreach ($data as $key => $value) {
            $value->imagen = $value->imagen ? asset('img/producto/'.$value->imagen) : asset('img/producto/sid.jpg');
        }
        return response()->json($data);
    }

    public function getProductosByCategoria($categoria_id)
    {
        $data = Producto::select('id', 'nombre', 'costo', 'cantidad', 'descripcion', 'duracion', 'imagen')
        ->where([
            'categoria_producto_id' => $categoria_id,
            'estado' => 'activo',
            ])
        ->get();
        foreach ($data as $key => $value) {
            $value->imagen = $value->imagen ? asset('img/producto/'.$value->imagen) : asset('img/producto/sid.jpg');
        }
        return response()->json($data);
    }

    public function reporteProducto()
    {
        $data = Producto::select(['producto.nombre as producto', 'categoria_producto.nombre as categoria', 'costo', 'cantidad', 'producto.estado'])
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->get();
        return view('reportes.productos', compact('data'));
    }
}
