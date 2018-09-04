@extends('layouts.app')

@section('content')

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
                <th class="th-sm">Cantidad</th>
                <th class="th-sm">accion</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
        <tfoot>
            <tr>
                <th>id</th>
                <th>Producto</th>
                <th>Categoria</th>
                <th>Cantidad</th>
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
        $('#cmi-update-stock').addClass('current-menu-item');
        $('#a-update-stock').addClass('active');

        $('#dtModel').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url("update-stock/get/DataTable") }}',
            columns: [
                {data: 'id', name: 'id'},
                {data: 'nombre', name: 'nombre'},
                {data: 'categoria', name: 'categoria_producto.nombre'},
                {data: 'cantidad', name: 'cantidad', orderable: false, searchable: false},
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

    function guardar(btn, producto_id) {
        var td = $(btn).parents('td');
        var input = $(td).find('input');
        var cantidad = input.val();
        if (cantidad > 0 && cantidad != "") {
            $.ajax({
                method: "POST",
                url: "/update-stock",
                data: { 
                    producto_id: producto_id, 
                    cantidad: cantidad, 
                    _token: "{{ csrf_token() }}", 
                },
                success: function(result) {
                    $('#dtModel').DataTable().draw();
                    toastr["success"]("Se guardo correctamente!")
                },
                error: function() {
                    toastr["error"]("No se completo la operacion!")
                }
            });
        }
        else {
            alert("Dato inadecuado para guardar!");
        }
            
    }
</script>
@endpush