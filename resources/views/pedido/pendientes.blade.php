@extends('layouts.app')

@section('content')
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
                <th class="th-sm">Fecha de Entrega
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Hora de Entrega
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Acuenta
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Saldo
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Total Importe
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Tipo
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
                <th>Fecha de Entrega</th>
                <th>Hora de Entrega</th>
                <th>Acuenta</th>
                <th>Saldo</th>
                <th>Total Importe</th>
                <th>Tipo</th>
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
        $('#a-pedido-pendiente').addClass('active');
        $('#cmi-pedido-pendiente').addClass('current-menu-item');

        $('#dtModel').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url("pedido/get/DataTablePendiente") }}',
            columns: [
                {data: 'id', name: 'id'},
                {data: 'nombre', name: 'cliente.nombre'},
                {data: 'fecha_entrega', name: 'fecha_entrega'},
                {data: 'hora_entrega', name: 'hora_entrega'},
                {data: 'acuenta', name: 'acuenta'},
                {data: 'saldo', name: 'saldo'},
                {data: 'total_importe', name: 'total_importe'},
                {data: 'tipo', name: 'pedido.tipo'},
                {data: 'action', name: 'action', orderable: false, searchable: false}
            ],
            order: [[ 2, 'desc' ]],
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

    function entregar(pedido_id) {
        if (confirm('El pedido se registrara como Entregado!!')) {
            $.ajax({
                method: "POST",
                url: "/pedido-pendiente",
                data: { 
                    id: pedido_id,
                    _token: "{{ csrf_token() }}", 
                },
                success: function(result) {
                    toastr["success"]("Se ejecuto correctamente!");
                    $('#dtModel').DataTable().draw();
                },
                error: function() {
                    toastr["error"]("No se completo la operación!");
                }
            });
        }
    }

</script>
@endpush