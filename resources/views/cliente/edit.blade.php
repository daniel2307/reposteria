@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Modificar Cliente {{ $cliente->nombre or '' }}</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/cliente') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        
        <p><small class="red-text">* Obligatorio</small></p>
        
        @if(Session::has('message'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{Session::get('message')}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
        
        <form method="POST" class="text-center" action="{{ url('/cliente/' . $cliente->id) }}" accept-charset="UTF-8" style="color: #757575;">
            @method('PATCH')
            @include ('cliente.form', ['submitButtonText' => 'MODIFICAR'])
        </form>

    </div>

</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-cliente').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-cliente').addClass('active');
        $("#css-cliente").css("display", "block");
        $('#cmi-cliente').addClass('current-menu-item');
    });
</script>
@endpush