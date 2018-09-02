@extends('layouts.app')

@section('content')
<a href="{{ url('/categoriaproducto/create') }}" class="btn btn-success" title="Add New Categoria Producto">
    <i class="fa fa-plus" aria-hidden="true"></i> Agregar Nueva Categoria
</a>

<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">ID
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Nombre
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Imagen
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
                <th>Nombre</th>
                <th>Imagen</th>
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
        $('#cmi-categoria-producto').addClass('current-menu-item');
        $('#a-categoria-producto').addClass('active');

        $('#dtModel').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url("categoriaproducto/get/DataTable") }}',
            columns: [
                {data: 'id', name: 'id'},
                {data: 'nombre', name: 'nombre'},
                {data: 'imagen', name: 'imagen', render: function (data, type, full, meta) {
                    return '<img src="/img/categoria/'+(data?data:'sid.jpg')+'" alt="imagen" height="100px">';
                }, orderable: false, searchable: false},
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