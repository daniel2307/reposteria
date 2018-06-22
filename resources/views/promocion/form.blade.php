<div class="form-group {{ $errors->has('descuento') ? 'has-error' : ''}}">
    <label for="descuento" class="col-md-4 control-label">{{ 'Descuento' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="descuento" step='0.01' type="number" id="descuento" value="{{ $promocion->descuento or ''}}" >
        {!! $errors->first('descuento', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('fecha') ? 'has-error' : ''}}">
    <label for="fecha" class="col-md-4 control-label">{{ 'Fecha' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="fecha" type="date" id="fecha" value="{{ $promocion->fecha or ''}}" >
        {!! $errors->first('fecha', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('duracion') ? 'has-error' : ''}}">
    <label for="duracion" class="col-md-4 control-label">{{ 'Duracion' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="duracion" type="text" id="duracion" value="{{ $promocion->duracion or ''}}" >
        {!! $errors->first('duracion', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('estado') ? 'has-error' : ''}}">
    <label for="estado" class="col-md-4 control-label">{{ 'Estado' }}</label>
    <div class="col-md-6">
        <select name="estado" class="form-control" id="estado" >
    @foreach (json_decode('{"vigente": "Vigente", "expirado": "Expirado"}', true) as $optionKey => $optionValue)
        <option value="{{ $optionKey }}" {{ (isset($promocion->estado) && $promocion->estado == $optionKey) ? 'selected' : ''}}>{{ $optionValue }}</option>
    @endforeach
</select>
        {!! $errors->first('estado', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('producto_id') ? 'has-error' : ''}}">
    <label for="producto_id" class="col-md-4 control-label">{{ 'Producto Id' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="producto_id" type="number" id="producto_id" value="{{ $promocion->producto_id or ''}}" >
        {!! $errors->first('producto_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group">
    <div class="col-md-offset-4 col-md-4">
        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
    </div>
</div>
