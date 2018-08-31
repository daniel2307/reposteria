@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Detalle Producto</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/producto') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        <a href="{{ url('/producto/' . $producto->id . '/edit') }}" title="Edit Producto"><button class="btn btn-primary btn-sm"><i class="far fa-edit" aria-hidden="true"></i> Edit</button></a>

        <form method="POST" action="{{ url('producto' . '/' . $producto->id) }}" accept-charset="UTF-8" style="display:inline">
            {{ method_field('DELETE') }}
            @csrf
            <button type="submit" class="btn btn-danger btn-sm" title="Delete Producto" onclick="return confirm('Confirm delete?')"><i class="far fa-trash-alt" aria-hidden="true"></i> Delete</button>
        </form>
        
        <div class="table-responsive">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">ID</th>
                        <td>{{ $producto->id }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Nombre</th>
                        <td>{{ $producto->nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Costo</th>
                        <td>{{ $producto->costo }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Cantidad</th>
                        <td>{{ $producto->cantidad }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Descripcion</th>
                        <td>{{ $producto->descripcion }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Duracion</th>
                        <td>{{ $producto->duracion }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Imagen</th>
                        <td><img src="/img/producto/{{ $producto->imagen or 'sid.jpg'}}" alt="imagen" height="300px"></td>
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
        $('#cmi-producto').addClass('current-menu-item');
        $('#a-producto').addClass('active');
    });
</script>
@endpush