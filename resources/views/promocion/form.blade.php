@csrf
<div class="form-row">
    <div class="col text-left">
        <select class="mdb-select colorful-select dropdown-primary" name="producto_id" id="producto_id" required>
            @foreach($productos as $key => $value)
            <option value="{{ $value->id }}">{{ $value->producto }}</option>
            @endforeach
        </select>
        <label for="producto_id">Producto <b class="red-text">*</b></label>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="precio" name="precio" class="form-control" value="{{ $promocion->precio or '' }}" required>
            <label for="precio">Precio de Promocion <b class="red-text">*</b></label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="number" id="duracion" name="duracion" class="form-control" value="{{ $promocion->duracion or '' }}">
            <label for="duracion">Duracion</label>
        </div>
    </div>
    <div class="col text-left">
        <select class="mdb-select colorful-select dropdown-primary" name="unidad" id="unidad">
            <option value="horas">Horas</option>
            <option value="dias">Dias</option>
        </select>
        <label for="unidad">Unidad</label>
    </div>
</div>

<div class="form-row">
    <div class="col">

    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="cantidad" name="cantidad" class="form-control" value="{{ $promocion->cantidad or '' }}">
            <label for="cantidad">Cantidad</label>
        </div>
    </div>
</div>

<div class="form-row text-left">
    <div class="col">
        <div class="form-group row">
            <label for="fecha_inicio" class="col-sm-4 col-form-label">Fecha Inicio</label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="date" class="form-control" name="fecha_inicio" id="fecha_inicio" value="{{ $promocion->fecha_inicio or '' }}">
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="form-group row">
            <label for="fecha_fin" class="col-sm-4 col-form-label">Fecha Fin</label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="date" class="form-control" name="fecha_fin" id="fecha_fin" value="{{ $promocion->fecha_fin or '' }}">
                </div>
            </div>
        </div>
    </div>
</div> 

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
