@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Detalle Promocion</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/promocion') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        <a href="{{ url('/promocion/' . $promocion->id . '/edit') }}" title="Edit Promocion"><button class="btn btn-primary btn-sm"><i class="far fa-edit" aria-hidden="true"></i> Edit</button></a>

        <form method="POST" action="{{ url('promocion' . '/' . $promocion->id) }}" accept-charset="UTF-8" style="display:inline">
            {{ method_field('DELETE') }}
            @csrf
            <button type="submit" class="btn btn-danger btn-sm" title="Delete Promocion" onclick="return confirm('Confirm delete?')"><i class="far fa-trash-alt" aria-hidden="true"></i> Delete</button>
        </form>
        
        <div class="table-responsive">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">ID</th>
                        <td>{{ $promocion->id }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Producto</th>
                        <td>
                            {{ $promocion->producto->nombre }} - 
                            {{ $promocion->producto->categoria->nombre }}
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Precio</th>
                        <td>{{ $promocion->precio }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha</th>
                        <td>{{ $promocion->fecha }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Duracion</th>
                        <td>{{ $promocion->duracion }} {{ $promocion->unidad }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Cantidad</th>
                        <td>{{ $promocion->cantidad }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha Inicio</th>
                        <td>{{ $promocion->fecha_inicio }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha Fin</th>
                        <td>{{ $promocion->fecha_fin }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Estado</th>
                        <td>{{ $promocion->estado }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Imagen</th>
                        <td><img src="/img/producto/{{ $promocion->producto->imagen or 'sid.jpg'}}" alt="imagen" height="300px"></td>
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
        $('#cmi-promocion').addClass('current-menu-item');
        $('#a-promocion').addClass('active');
    });
</script>
@endpush