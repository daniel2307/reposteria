@extends('layouts.app')

@section('content')
<a href="{{ url('/venta/create') }}" class="btn btn-success" title="Agregar Nueva Venta">
    <i class="fa fa-plus" aria-hidden="true"></i> Agregar Nueva Venta
</a>

<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">ID
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Cliente
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Fecha
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Total
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Descuento
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Total Importe
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">accion
                </th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Descuento</th>
                <th>Total Importe</th>
                <th>accion</th>
            </tr>
        </tfoot>
    </table>
</div>
@endsection

@push('links')
<!-- MDBootstrap Datatables  -->
<link href="/css/addons/datatables.min.css" rel="stylesheet">
@endpush

@push('scripts')
<!-- MDBootstrap Datatables  -->
<script type="text/javascript" src="/js/addons/datatables.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-venta').addClass('current-menu-item');
        $('#a-venta').addClass('active');

        $('#dtModel').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url("venta/get/DataTable") }}',
            columns: [
                {data: 'id', name: 'id'},
                {data: 'nombre', name: 'cliente.nombre'},
                {data: 'fecha', name: 'fecha'},
                {data: 'total', name: 'total'},
                {data: 'descuento', name: 'descuento'},
                {data: 'total_importe', name: 'total_importe'},
                {data: 'action', name: 'action', orderable: false, searchable: false}
            ],
            order: [[ 0, 'desc' ]],
        });
        $('#dtModel_wrapper').find('label').each(function () {
            $(this).parent().append($(this).children());
        });
        $('#dtModel_wrapper .dataTables_filter').find('input').each(function () {
            $('input').attr("placeholder", "Search");
            $('input').removeClass('form-control-sm');
        });
        $('#dtModel_wrapper .dataTables_length').addClass('d-flex flex-row');
        $('#dtModel_wrapper .dataTables_filter').addClass('md-form');
        $('#dtModel_wrapper select').removeClass('custom-select custom-select-sm form-control form-control-sm');
        $('#dtModel_wrapper select').addClass('mdb-select');
        $('#dtModel_wrapper .mdb-select').material_select();
        $('#dtModel_wrapper .dataTables_filter').find('label').remove();
    });
</script>
@endpush