@extends('layouts.app')

@section('content')
<div class="card mb-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Modificar Promocion</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/promocion') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>

        <form method="POST" class="text-center" action="{{ url('/promocion/' . $promocion->id) }}" accept-charset="UTF-8" style="color: #757575;">
            @method('PATCH')
            @csrf
            <div class="form-row">
                <div class="col text-left">
                    <div class="md-form">
                        <label for="precio">Producto: <b>{{ $promocion->producto->nombre }} - {{ $promocion->producto->categoria->nombre }}</b></label>
                    </div>
                </div>
                <div class="col">
                    <div class="md-form">
                        <input type="number" id="precio" name="precio" class="form-control" value="{{ $promocion->precio or '' }}" required>
                        <label for="precio">Precio de Promocion <b class="red-text">*</b></label>
                    </div>
                </div>
            </div>

            <div class="card card-body">
                <div class="form-row">
                    <div class="col">
                        <div class="md-form">
                            <input type="number" id="duracion" name="duracion" class="form-control" value="{{ $promocion->duracion or '' }}">
                            <label for="duracion">Duracion</label>
                        </div>
                    </div>
                    <div class="col text-left">
                        <select class="mdb-select colorful-select dropdown-primary" name="unidad" id="unidad">
                            <option value="horas" {{ $promocion->unidad == "horas" ? 'selected' : '' }}>Horas</option>
                            <option value="dias" {{ $promocion->unidad == "dias" ? 'selected' : '' }}>Dias</option>
                        </select>
                        <label for="unidad">Unidad</label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <div class="md-form">
                        <input type="number" id="cantidad" name="cantidad" class="form-control" value="{{ $promocion->cantidad or '' }}">
                        <label for="cantidad">Cantidad</label>
                    </div>
                </div>
            </div>
            
            <div class="card card-body">
                <div class="form-row text-left">
                    <div class="col">
                        <div class="form-group row">
                            <label for="fecha_inicio" class="col-sm-4 col-form-label">Fecha Inicio</label>
                            <div class="col-sm-8">
                                <div class="md-form mt-0">
                                    <input type="date" class="form-control" name="fecha_inicio" id="fecha_inicio" value="{{ date('Y-m-d', strtotime($promocion->fecha_inicio)) }}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group row">
                            <label for="fecha_fin" class="col-sm-4 col-form-label">Fecha Fin</label>
                            <div class="col-sm-8">
                                <div class="md-form mt-0">
                                    <input type="date" class="form-control" name="fecha_fin" id="fecha_fin" value="{{ date('Y-m-d', strtotime($promocion->fecha_fin)) }}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            <button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
                {{ $submitButtonText or 'MODIFICAR' }}
            </button>
        </form>

    </div>

</div>
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-promocion').addClass('current-menu-item');
        $('#a-promocion').addClass('active');
    });
</script>
@endpush