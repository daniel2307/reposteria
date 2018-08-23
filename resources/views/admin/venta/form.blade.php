<div class="form-group {{ $errors->has('fecha') ? 'has-error' : ''}}">
    <label for="fecha" class="col-md-4 control-label">{{ 'Fecha' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="fecha" type="date" id="fecha" value="{{ $ventum->fecha or ''}}" >
        {!! $errors->first('fecha', '<p class="help-block">:message</p>') !!}
    </div>
</div>
<div class="form-group {{ $errors->has('hora') ? 'has-error' : ''}}">
    <label for="hora" class="col-md-4 control-label">{{ 'Hora' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="hora" type="time" id="hora" value="{{ $ventum->hora or ''}}" >
        {!! $errors->first('hora', '<p class="help-block">:message</p>') !!}
    </div>
</div>
<div class="form-group {{ $errors->has('total') ? 'has-error' : ''}}">
    <label for="total" class="col-md-4 control-label">{{ 'Total' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="total" type="number" id="total" value="{{ $ventum->total or ''}}" >
        {!! $errors->first('total', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('descuento') ? 'has-error' : ''}}">
    <label for="descuento" class="col-md-4 control-label">{{ 'Descuento' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="descuento" type="number" id="descuento" value="{{ $ventum->descuento or ''}}" >
        {!! $errors->first('descuento', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('total_importe') ? 'has-error' : ''}}">
    <label for="total_importe" class="col-md-4 control-label">{{ 'Total Importe' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="total_importe" type="number" id="total_importe" value="{{ $ventum->total_importe or ''}}" >
        {!! $errors->first('total_importe', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('iva') ? 'has-error' : ''}}">
    <label for="iva" class="col-md-4 control-label">{{ 'Iva' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="iva" type="number" id="iva" value="{{ $ventum->iva or ''}}" >
        {!! $errors->first('iva', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('estado') ? 'has-error' : ''}}">
    <label for="estado" class="col-md-4 control-label">{{ 'Estado' }}</label>
    <div class="col-md-6">
        <select name="estado" class="form-control" id="estado" >
    @foreach (json_decode('{"activo": "Activo", "cancelado": "Cancelado"}', true) as $optionKey => $optionValue)
        <option value="{{ $optionKey }}" {{ (isset($ventum->estado) && $ventum->estado == $optionKey) ? 'selected' : ''}}>{{ $optionValue }}</option>
    @endforeach
</select>
        {!! $errors->first('estado', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('cliente_id') ? 'has-error' : ''}}">
    <label for="cliente_id" class="col-md-4 control-label">{{ 'Cliente Id' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="cliente_id" type="number" id="cliente_id" value="{{ $ventum->cliente_id or ''}}" >
        {!! $errors->first('cliente_id', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('users_id') ? 'has-error' : ''}}">
    <label for="users_id" class="col-md-4 control-label">{{ 'Users Id' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="users_id" type="number" id="users_id" value="{{ $ventum->users_id or ''}}" >
        {!! $errors->first('users_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group">
    <div class="col-md-offset-4 col-md-4">
        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
    </div>
</div>
