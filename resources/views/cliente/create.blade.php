@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Crear Nuevo Cliente</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/admin/cliente') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>

        <form method="POST" class="text-center" action="{{ url('/admin/cliente') }}" accept-charset="UTF-8" style="color: #757575;">
            @include ('cliente.form', ['submitButtonText' => 'GUARDAR'])
        </form>

    </div>

</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-cliente').addClass('current-menu-item');
        $('#a-cliente').addClass('active');
    });
</script>
@endpush