@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Modificar Usuario {{ $user->name or '' }}</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/users') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        
        <p><small class="red-text">* Obligatorio</small></p>
        
        <form method="POST" class="text-center" action="{{ url('/users/' . $user->id) }}" accept-charset="UTF-8" style="color: #757575;">
            {{ method_field('PATCH') }}
            @include ('usuario.form', ['submitButtonText' => 'MODIFICAR'])
        </form>

    </div>

</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-users').addClass('current-menu-item');
        $('#a-users').addClass('active');
    });
</script>
@endpush