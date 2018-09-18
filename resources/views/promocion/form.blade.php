@csrf
<div class="form-row">
    <div class="col">
        <div class="row text-left">
            <div class="col-12">
                <label for="producto_id">Producto <b class="red-text">*</b></label>
                <select class="mdb-select colorful-select dropdown-primary" name="producto_id" id="producto_id" style="width: 100%;" onchange="getDatos();">
                    @foreach($productos as $key => $value)
                    <option value="{{ $value->id }}" data-price="{{ $value->costo }}" data-quantity="{{ $value->cantidad }}">{{ $value->producto }}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="number" id="cantidad" name="cantidad" class="form-control" value="{{ $promocion->cantidad or '' }}" placeholder="0" required>
            <label for="cantidad">Cantidad <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="precio" name="precio" class="form-control" value="{{ $promocion->precio or '' }}" placeholder="0" required>
            <label for="precio">Precio de Promocion <b class="red-text">*</b></label>
        </div>
    </div>
</div>

<div class="form-row text-left">
    <div class="col">
        <div class="form-group row">
            <label for="fecha_inicio" class="col-sm-4 col-form-label">Fecha Inicio <b class="red-text">*</b></label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="date" class="form-control" name="fecha_inicio" id="fecha_inicio" value="{{ $promocion->fecha_inicio or '' }}" required>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="form-group row">
            <label for="fecha_fin" class="col-sm-4 col-form-label">Fecha Fin <b class="red-text">*</b></label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="date" class="form-control" name="fecha_fin" id="fecha_fin" value="{{ $promocion->fecha_fin or '' }}" required>
                </div>
            </div>
        </div>
    </div>
</div> 
<div class="form-row text-left">
    <div class="col">
        <div class="form-group row">
            <label for="hora_inicio" class="col-sm-4 col-form-label">Hora Inicio</label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="time" class="form-control" name="hora_inicio" id="hora_inicio" value="{{ $promocion->hora_inicio or '' }}">
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="form-group row">
            <label for="hora_fin" class="col-sm-4 col-form-label">Hora Fin</label>
            <div class="col-sm-8">
                <div class="md-form mt-0">
                    <input type="time" class="form-control" name="hora_fin" id="hora_fin" value="{{ $promocion->hora_fin or '' }}">
                </div>
            </div>
        </div>
    </div>
</div> 

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
