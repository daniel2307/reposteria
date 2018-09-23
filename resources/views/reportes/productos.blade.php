@extends('layouts.app')

@section('content')

<a class="btn btn-info noPrint" onclick="window.print();"><i class="fa fa-print mr-1"></i> Imprimir</a>
<hr>
<h3>Lista de Productos Registrados</h3>
<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped table-sm" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">#</th>
                <th class="th-sm">PRODUCTO</th>
                <th class="th-sm">CATEGORIA</th>
                <th class="th-sm">COSTO</th>
                <th class="th-sm">CANTIDAD</th>
                <th class="th-sm">ESTADO</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $key => $value)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $value->producto }}</td>
                <td>{{ $value->categoria }}</td>
                <td>{{ $value->costo }}</td>
                <td>{{ $value->cantidad }}</td>
                <td>{{ $value->estado }}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>#</th>
                <th>PRODUCTO</th>
                <th>CATEGORIA</th>
                <th>COSTO</th>
                <th>CANTIDAD</th>
                <th>ESTADO</th>
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
        $('#cmi-reporte-producto').addClass('current-menu-item');

    });
</script>
@endpush