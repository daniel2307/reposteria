@extends('layouts.app')

@section('content')
<form action="{{ url('reporte/categoria') }}" method="get">
    <div class="form-row mt-1">
        <div class="col-3">
            <select class="mdb-select md-form colorful-select dropdown-primary" name="estado">
                <option value="activo" {{ $estado == "activo" ? 'selected' : '' }}>Activo</option>
                <option value="inactivo" {{ $estado == "inactivo" ? 'selected' : '' }}>Eliminado</option>
            </select>
            <label>Estado:</label>
        </div>
        <div class="col-3">
            <button type="submit" class="btn btn-success noPrint"><i class="fa fa-eye mr-1"></i> Mostrar</button>
        </div>
        <div class="col-3">
            <a class="btn btn-info noPrint" onclick="window.print();"><i class="fa fa-print mr-1"></i> Imprimir</a>
        </div>
    </div>
</form>

<hr>
<h3>Lista de categorias</h3>
<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped table-sm" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">#</th>
                <th class="th-sm">CATEGORIA</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $key => $value)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $value->nombre }}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>#</th>
                <th>CATEGORIA</th>
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
        $('#cmi-reporte-categoria').addClass('current-menu-item');
    });
</script>
@endpush