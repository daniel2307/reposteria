<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Pedido;
use Illuminate\Http\Request;

class PedidoController extends Controller
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
            $pedido = Pedido::where('saldo', 'LIKE', "%$keyword%")
                ->orWhere('estado', 'LIKE', "%$keyword%")
                ->orWhere('fecha', 'LIKE', "%$keyword%")
                ->orWhere('fecha_entrega', 'LIKE', "%$keyword%")
                ->orWhere('hora_entrega', 'LIKE', "%$keyword%")
                ->orWhere('forma_de_pago', 'LIKE', "%$keyword%")
                ->orWhere('iva', 'LIKE', "%$keyword%")
                ->orWhere('cliente_id', 'LIKE', "%$keyword%")
                ->latest()->paginate($perPage);
        } else {
            $pedido = Pedido::latest()->paginate($perPage);
        }

        return view('pedido.index', compact('pedido'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('pedido.create');
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
            'saldo' => 'required|between:0,99.99',
            'estado' => 'required|string|max:255',
            'fecha' => 'required|date_format:Y-m-d',
            'fecha_entrega' => 'required|date_format:Y-m-d',
            'hora_entrega' => 'required',
            'forma_de_pago' => 'required|string|max:255',
            'iva' => 'required|between:0,99.99',
            'cliente_id' => 'required|string|max:255',
        ]);
 
        if ($v->fails())
        {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }

        Pedido::create($requestData);

        return redirect('pedido')->with('flash_message', 'Pedido added!');
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
            'iva' => 'required',
            'cliente_id' => 'required|string|max:255',
        ]);
 
        if ($v->fails())
        {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }

        $pedido = Pedido::findOrFail($id);
        $pedido->update($requestData);

        return redirect('pedido')->with('flash_message', 'Pedido updated!');
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

        return redirect('pedido')->with('flash_message', 'Pedido deleted!');
    }
    public function apiListpedidos (){
        header('Access-Control-Allow-Origin: *');
        return Pedido::all();
    }
}
