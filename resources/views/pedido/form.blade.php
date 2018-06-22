<div class="form-group {{ $errors->has('saldo') ? 'has-error' : ''}}">
    <label for="saldo" class="col-md-4 control-label">{{ 'Saldo' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="saldo" type="number" step='0.01' id="saldo" value="{{ $pedido->saldo or ''}}" >
        {!! $errors->first('saldo', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('estado') ? 'has-error' : ''}}">
    <label for="estado" class="col-md-4 control-label">{{ 'Estado' }}</label>
    <div class="col-md-6">
        <select name="estado" class="form-control" id="estado" >
    @foreach (json_decode('{"espera": "Espera", "preparado": "Preparado", "entregado": "Entregado", "cancelado": "Cancelado"}', true) as $optionKey => $optionValue)
        <option value="{{ $optionKey }}" {{ (isset($pedido->estado) && $pedido->estado == $optionKey) ? 'selected' : ''}}>{{ $optionValue }}</option>
    @endforeach
</select>
        {!! $errors->first('estado', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('fecha') ? 'has-error' : ''}}">
    <label for="fecha" class="col-md-4 control-label">{{ 'Fecha' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="fecha" format="yyyy/MM/dd" type="date" id="fecha" value="{{ $pedido->fecha or ''}}" >
        {!! $errors->first('fecha', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('fecha_entrega') ? 'has-error' : ''}}">
    <label for="fecha_entrega" class="col-md-4 control-label">{{ 'Fecha Entrega' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="fecha_entrega" type="date" id="fecha_entrega" value="{{ $pedido->fecha_entrega or ''}}" >
        {!! $errors->first('fecha_entrega', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('hora_entrega') ? 'has-error' : ''}}">
    <label for="hora_entrega" class="col-md-4 control-label">{{ 'Hora Entrega' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="hora_entrega" format="H:i:s:" type="time" id="hora_entrega" value="{{ $pedido->hora_entrega or ''}}" >
        {!! $errors->first('hora_entrega', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('forma_de_pago') ? 'has-error' : ''}}">
    <label for="forma_de_pago" class="col-md-4 control-label">{{ 'Forma De Pago' }}</label>
    <div class="col-md-6">
        <select name="forma_de_pago" class="form-control" id="forma_de_pago" >
    @foreach (json_decode('{"tienda": "Tienda", "banco": "Banco", "domicilio": "Domicilio"}', true) as $optionKey => $optionValue)
        <option value="{{ $optionKey }}" {{ (isset($pedido->forma_de_pago) && $pedido->forma_de_pago == $optionKey) ? 'selected' : ''}}>{{ $optionValue }}</option>
    @endforeach
</select>
        {!! $errors->first('forma_de_pago', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('iva') ? 'has-error' : ''}}">
    <label for="iva" class="col-md-4 control-label">{{ 'Iva' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="iva" type="number" step='0.01' id="iva" value="{{ $pedido->iva or ''}}" >
        {!! $errors->first('iva', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('cliente_id') ? 'has-error' : ''}}">
    <label for="cliente_id" class="col-md-4 control-label">{{ 'Cliente Id' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="cliente_id" type="number" id="cliente_id" value="{{ $pedido->cliente_id or ''}}" >
        {!! $errors->first('cliente_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group">
    <div class="col-md-offset-4 col-md-4">
        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
    </div>
</div>
