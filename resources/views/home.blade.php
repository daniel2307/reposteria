@extends('layouts.app')

@section('content')

@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-home').addClass('current-menu-item');
        $('#a-home').addClass('active');
    });
</script>
@endpush