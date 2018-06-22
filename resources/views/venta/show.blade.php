@extends('layouts.app')

@section('content')

@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-venta').addClass('current-menu-item');
        $('#a-venta').addClass('active');
    });
</script>
@endpush