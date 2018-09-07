@extends('layouts.app')

@section('content')
<div class="card mb-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Crear Nuevo Producto</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/producto') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>

        <form method="POST" class="text-center" action="{{ url('/producto') }}" accept-charset="UTF-8" style="color: #757575;" enctype="multipart/form-data">
            @include('producto.form', ['submitButtonText' => 'GUARDAR'])
        </form>

    </div>

</div>
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-producto').addClass('current-menu-item');
        $('#a-producto').addClass('active');
    });
</script>
@endpush