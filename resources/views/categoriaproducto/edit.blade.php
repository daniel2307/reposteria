@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Modificar Categoria</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/admin/categoriaproducto') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>
        
        <form method="POST" class="text-center" action="{{ url('/admin/categoriaproducto/' . $categoriaproducto->id) }}" accept-charset="UTF-8" style="color: #757575;" enctype="multipart/form-data">
            {{ method_field('PATCH') }}
            @include ('categoriaproducto.form', ['submitButtonText' => 'MODIFICAR'])
        </form>

    </div>

</div>
@endsection
