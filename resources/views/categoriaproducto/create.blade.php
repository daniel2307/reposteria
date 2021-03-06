@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Crear Nueva Categoria</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/categoriaproducto') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>

        <form method="POST" class="text-center" action="{{ url('/categoriaproducto') }}" accept-charset="UTF-8" style="color: #757575;" enctype="multipart/form-data">
            @include('categoriaproducto.form', ['submitButtonText' => 'GUARDAR'])
        </form>

    </div>

</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-categoria-producto').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-categoria-producto').addClass('active');
        $("#css-categoria-producto").css("display", "block");
        $('#cmi-categoria-producto-create').addClass('current-menu-item');
    });
</script>
@endpush