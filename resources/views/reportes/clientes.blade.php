@extends('layouts.app')

@section('content')

<a class="btn btn-info noPrint" onclick="window.print();"><i class="fa fa-print mr-1"></i> Imprimir</a>
<hr>
<h3>Lista de Clientes Registrados</h3>
<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped table-sm" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">#</th>
                <th class="th-sm">NOMBRE</th>
                <th class="th-sm">CI</th>
                <th class="th-sm">TELEFONO</th>
                <th class="th-sm">CELULAR</th>
                <th class="th-sm">EMAIL</th>
                <th class="th-sm">ESTADO</th>
                <th class="th-sm">CREADO</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $key => $value)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $value->nombre }}</td>
                <td>{{ $value->ci }}</td>
                <td>{{ $value->telefono }}</td>
                <td>{{ $value->celular }}</td>
                <td>{{ $value->email }}</td>
                <td>{{ $value->estado }}</td>
                <td>{{ $value->created_at }}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>#</th>
                <th>NOMBRE</th>
                <th>CI</th>
                <th>TELEFONO</th>
                <th>CELULAR</th>
                <th>EMAIL</th>
                <th>ESTADO</th>
                <th>CREADO</th>
            </tr>
        </tfoot>
    </table>
</div>
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-reporte').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-reporte').addClass('active');
        $("#css-reporte").css("display", "block");
        $('#cmi-reporte-cliente').addClass('current-menu-item');

    });
</script>
@endpush