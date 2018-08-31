@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">

            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Promocion {{ $promocion->id }}</div>
                    <div class="card-body">

                        <a href="{{ url('/promocion') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

                        <form method="POST" action="{{ url('promocion' . '/' . $promocion->id) }}" accept-charset="UTF-8" style="display:inline">
                            {{ method_field('DELETE') }}
                            {{ csrf_field() }}
                            <button type="submit" class="btn btn-danger btn-sm" title="Delete Promocion" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</button>
                        </form>
                        <br/>
                        <br/>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>ID</th><td>{{ $promocion->id }}</td>
                                    </tr>
                                    <tr>
                                        <th>Producto</th><td>{{ $promocion->producto->nombre }}</td>
                                    </tr>
                                    <tr><th> Precio de Promocion </th><td> {{ $promocion->precio }} </td></tr><tr><th> Fecha </th><td> {{ $promocion->fecha }} </td></tr><tr><th> Duracion </th><td> {{ $promocion->duracion }} {{ $promocion->unidad }} </td></tr>
                                    <tr>
                                        <th>Estado</th><td>{{ $promocion->estado }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
