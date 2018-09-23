<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('usuario.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('usuario.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        User::create([
            'name' => $request['name'],
            'direccion' => $request['direccion'],
            'telefono' => $request['telefono'],
            'celular' => $request['celular'],
            'rol' => $request['rol'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ]);
        return redirect('users');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);
        return view('usuario.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
        // dd($user->rol == 'administrador' ? 'selected' : '');
        return view('usuario.edit', compact('user'));
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
        $requestData = $request->all();
        if (!$request->password) {
            array_set($array, 'password', Hash::make($request['password']));
        }
        $user = User::findOrFail($id);
        $user->update($requestData);

        return redirect('users');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->estado = "eliminado";
        $user->email = "sin email";
        $user->password = "sin password";
        $user->save();
        return redirect('users');
    }

    public function getDataTable()
    {
        $model = User::select(['id', 'name', 'celular', 'email', 'rol'])->where(['estado' => 'activo']);

        return datatables()->of($model)
            ->addColumn('action', function ($model) {
                return 
                '<a href="/users/'.$model->id.'" class="btn btn-info btn-sm waves-effect waves-light" title="Ver"><i class="far fa-eye"></i></a>
                <a href="/users/'.$model->id.'/edit" class="btn btn-primary btn-sm waves-effect waves-light" title="Editar"><i class="far fa-edit"></i></a>
                <a href="/users/'.$model->id.'" class="btn btn-danger btn-sm waves-effect waves-light" title="Eliminar"><i class="far fa-trash-alt"></i></a>';
            })
            ->editColumn('id', 'ID: {{$id}}')
            ->make(true);
    }

    public function reporteUsuario()
    {
        $data = User::select(['name', 'telefono', 'celular', 'email', 'rol', 'estado', 'created_at'])->get();
        return view('reportes.usuarios', compact('data'));
    }
}
