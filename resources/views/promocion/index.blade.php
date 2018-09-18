@extends('layouts.app')

@section('content')
<a href="{{ url('/promocion/create') }}" class="btn btn-success" title="Add New Promocion">
    <i class="fa fa-plus" aria-hidden="true"></i> Agregar Nueva Promocion
</a>

<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">id
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Producto
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Categoria
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Precio
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Fecha Inicio
                    <i class="fa fa-sort float-right" aria-hidden="true"></i>
                </th>
                <th class="th-sm">Fecha Fin
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
                <th>id</th>
                <th>Producto</th>
                <th>Categoria</th>
                <th>Precio</th>
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
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
        $('#cma-cmp-promocion').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-promocion').addClass('active');
        $("#css-promocion").css("display", "block");
        $('#cmi-promocion').addClass('current-menu-item');

        $('#dtModel').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url("promocion/get/DataTable") }}',
            columns: [
                {data: 'id', name: 'id'},
                {data: 'nombre', name: 'producto.nombre'},
                {data: 'categoria', name: 'categoria_producto.nombre'},
                {data: 'precio', name: 'precio'},
                {data: 'fecha_inicio', name: 'fecha_inicio'},
                {data: 'fecha_fin', name: 'fecha_fin'},
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

    function expirado(promocion_id) {        
        if (confirm("Se cambiara el estado a expirado esta Promoción!")) {
            $.ajax({
                method: "POST",
                url: "/promocion/expirado",
                data: { 
                    id: promocion_id, 
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