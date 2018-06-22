@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Detalle Cliente</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/admin/cliente') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        <a href="{{ url('/admin/cliente/' . $cliente->id . '/edit') }}" title="Edit Cliente"><button class="btn btn-primary btn-sm"><i class="far fa-edit" aria-hidden="true"></i> Edit</button></a>

        <form method="POST" action="{{ url('admin/cliente' . '/' . $cliente->id) }}" accept-charset="UTF-8" style="display:inline">
            {{ method_field('DELETE') }}
            @csrf
            <button type="submit" class="btn btn-danger btn-sm" title="Delete Cliente" onclick="return confirm('Confirm delete?')"><i class="far fa-trash-alt" aria-hidden="true"></i> Delete</button>
        </form>
        
        <div class="table-responsive">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">ID</th>
                        <td>{{ $cliente->id }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Nombre</th>
                        <td>{{ $cliente->nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="row">CI</th>
                        <td>{{ $cliente->ci }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Direccion</th>
                        <td>{{ $cliente->direccion }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Telefono</th>
                        <td>{{ $cliente->telefono }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Celular</th>
                        <td>{{ $cliente->celular }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Email</th>
                        <td>{{ $cliente->email }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-cliente').addClass('current-menu-item');
        $('#a-cliente').addClass('active');
    });
</script>
@endpush