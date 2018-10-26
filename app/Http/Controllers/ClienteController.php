<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Cliente;
use App\User;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Hash;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('cliente.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('cliente.create');
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
        $message = NULL;
        if ($this->verifyEmail($request['email'])) {
            $message = "el Email se encuentra registrado!! Por favor use otro Email.";
        }
        if ($this->verifyCI($request['ci'])) {
            $message = "el CI se encuentra registrado!!.";
        }
        if ($message) {
            if (auth('api')) {
                return response()->json(['message' => $message]);
            } else {
                Session::flash($message);
                return redirect('cliente/create');
            }
        }

        $requestData = $request->all();
        $requestData = array_add($requestData, 'tipo', 'comun');
        $requestData = array_add($requestData, 'rol', 'cliente');
        
        if ($request['direccion'] || $request['telefono'] || $request['celular'] || $request['email']) {
            array_set($requestData, 'password', Hash::make($request['password']));
            $user = User::create($requestData);
            $requestData = array_add($requestData, 'user_id', $user->id);
        }
        $cliente = Cliente::create($requestData);
        if (auth('api')) {
            return response()->json([
                'message' => 'Cliente registrado',
                'cliente_id' => $cliente->id,
            ]);
        }
        return redirect('cliente');
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
        $cliente = Cliente::findOrFail($id);
        return view('cliente.show', compact('cliente'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id, $key = NULL)
    {
        $cliente = Cliente::findOrFail($id);
        if (auth('api')->user()) {
            return response()->json(['cliente' => $cliente]);
        }
        return view('cliente.edit', compact('cliente'));
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
        $cliente = Cliente::findOrFail($id);
        if ($this->verifyEmail($request['email'], $cliente->user_id)) {
            Session::flash('message','el Email se encuentra registrado!! Por favor use otro Email.');
            return redirect('cliente/'.$cliente->id.'/edit');
        }
        if ($this->verifyCI($request['ci'], $cliente->id)) {
            Session::flash('message','el CI se encuentra registrado!!.');
            return redirect('cliente/'.$cliente->id.'/edit');
        }

        $requestData = $request->all();

        if ($request['direccion'] || $request['telefono'] || $request['celular'] || $request['email']) {
            array_set($array, 'password', Hash::make($request['password']));
            if ($cliente->user_id) {
                // tiene un registro en user, lo modificamos
                $user = User::findOrFail($cliente->user_id);
                $user->update($requestData);
            } else {
                // no tiene registro en user, se crea uno nuevo
                $requestData = array_add($requestData, 'rol', 'cliente');
                $user = User::create($requestData);
                $requestData = array_add($requestData, 'user_id', $user->id);
            }
        }

        $cliente->update($requestData);
        if (auth('api')->user()) {
            return response()->json(['message' => 'Usuario modificado']);
        }
        return redirect('cliente');
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
        $cliente = Cliente::findOrFail($id);
        $cliente->estado = "eliminado";
        $cliente->save();
        // HAY QUE VER SI UN CLIENTE ES ELIMINADO YA NO PUEDE ENTRAR EN LA APP MOVIL
        if ($cliente->user_id) {
            $user = User::findOrFail($cliente->user_id);
            $user->estado = "eliminado";
            $user->email = "sin email";
            $user->password = "sin password";
            $user->save();
        }
        
        return redirect('cliente');
    }

    public function searchByCi(Request $request){
        $cliente = Cliente::where('ci', '=', $request->ci)->first();
        return response()->json(['cliente' => $cliente]);
    }
    
    public function getDataTable()
    {
        $model = Cliente::select(['cliente.id', 'nombre', 'ci', 'users.celular', 'users.email'])
        ->leftJoin('users', 'cliente.user_id', '=', 'users.id')
        ->where('cliente.estado', 'activo');

        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/cliente/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/cliente/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/cliente/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);
    }

    public function reporteCliente()
    {
        $data = Cliente::select(['nombre', 'ci', 'telefono', 'celular', 'email', 'cliente.estado', 'cliente.created_at'])
        ->leftJoin('users', 'cliente.user_id', '=', 'users.id')
        ->get();
        return view('reportes.clientes', compact('data'));
    }

    private function verifyEmail($email, $user_id = NULL)
    {
        $existe = $user_id ?
        User::where([['email', '=', $email], ['id', '<>', $user_id]])->first() :
        User::where(['email' => $email])->first();
        
        return $existe ? true : false;
    }

    private function verifyCI($ci, $id = NULL)
    {
        $existe = $id ? 
        Cliente::where([['ci', '=', $ci], ['id', '<>', $id]])->first() : 
        Cliente::where(['ci' => $ci])->first();

        return $existe ? true : false;
    }
}
