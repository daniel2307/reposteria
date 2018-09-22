@extends('layouts.app')

@section('content')
<div class="card mb-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Crear Nueva Promocion</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/promocion') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>

        <form method="POST" class="text-center" action="{{ url('/promocion') }}" accept-charset="UTF-8" style="color: #757575;">
            @include('promocion.form', ['submitButtonText' => 'GUARDAR'])
        </form>

    </div>

</div>
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-promocion').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-promocion').addClass('active');
        $("#css-promocion").css("display", "block");
        $('#cmi-promocion-create').addClass('current-menu-item');
    });

    function getDatos(){
        var producto_id = $('#producto_id').val();
        var costo = $("#producto_id option:selected").data("price");
        var cantidad = $("#producto_id option:selected").data("quantity");
        $('#precio').val(costo);
        $('#cantidad').val(cantidad);
    }
</script>
@endpush