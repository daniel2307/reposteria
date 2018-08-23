<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Preparado;
use App\Producto;
use App\User;
use App\Pedido;
use App\His_cantidad;
use Illuminate\Http\Request;

class PreparadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $keyword = $request->get('search');
        $perPage = 25;

        if (!empty($keyword)) {
            $preparado = Preparado::where('fecha', 'LIKE', "%$keyword%")
                ->orWhere('hora', 'LIKE', "%$keyword%")
                ->orWhere('vencimiento', 'LIKE', "%$keyword%")
                ->orWhere('cantidad', 'LIKE', "%$keyword%")
                ->orWhere('producto_id', 'LIKE', "%$keyword%")
                ->orWhere('pedido_id', 'LIKE', "%$keyword%")
                ->orWhere('users_id', 'LIKE', "%$keyword%")
                ->latest()->paginate($perPage);
        } else {
            $preparado = Preparado::latest()->paginate($perPage);
        }

        return view('admin.preparado.index', compact('preparado'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $productos = Producto::all();
        $users = User::all();
        $pedidos = Pedido::where(['estado'=>'espera'])->get();
        return view('admin.preparado.create', compact('productos', 'users', 'pedidos'));
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
        $producto = Producto::find($requestData['producto_id']);
        $cantidadAux = $producto->cantidad;
        $producto->cantidad = intval($cantidadAux) + intval($requestData['cantidad']);
        $producto->save();
        //registrar el istorial de cantidad
        $historialCantidad = [
            'cantidad_anterior'=>$cantidadAux,
            'cantidad_actual'=>$producto->cantidad,
            'fecha'=>date('Y-m-d'),
            'hora'=>date('H:i:s'),
            'tipo'=>'entrada',
            'producto_id'=>$producto->id
        ];
        His_cantidad::create($historialCantidad);
        // return $producto;
        $requestData['fecha'] = date('Y-m-d');
        $requestData['hora'] = date('H:i:s');
        Preparado::create($requestData);

        return redirect('admin/preparado')->with('flash_message', 'Preparado added!');
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
        $preparado = Preparado::findOrFail($id);

        return view('admin.preparado.show', compact('preparado'));
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
        $preparado = Preparado::findOrFail($id);

        return view('admin.preparado.edit', compact('preparado'));
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
        
        $preparado = Preparado::findOrFail($id);
        $preparado->update($requestData);

        return redirect('admin/preparado')->with('flash_message', 'Preparado updated!');
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
        Preparado::destroy($id);

        return redirect('admin/preparado')->with('flash_message', 'Preparado deleted!');
    }
}
