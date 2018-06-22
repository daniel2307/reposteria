<div class="form-group {{ $errors->has('producto_id') ? 'has-error' : ''}}">
    <label for="producto_id" class="col-md-4 control-label">{{ 'Producto' }}</label>
    <div class="col-md-6">
        <select class="form-control" name="producto_id" id="producto_id" value="{{ $preparado->producto_id or ''}}" >
            @foreach ($productos as $producto)
                <option value="{{$producto->id}}">{{$producto->nombre}}</option>
            @endforeach
        </select>
        {!! $errors->first('producto_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>


<div class="form-group {{ $errors->has('cantidad') ? 'has-error' : ''}}">
    <label for="cantidad" class="col-md-4 control-label">{{ 'Cantidad' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="cantidad" type="number" id="cantidad" value="{{ $preparado->cantidad or ''}}" >
        {!! $errors->first('cantidad', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group {{ $errors->has('vencimiento') ? 'has-error' : ''}}">
    <label for="vencimiento" class="col-md-4 control-label">{{ 'Hora vencimiento' }}</label>
    <div class="col-md-6">
        <input class="form-control" name="vencimiento" type="time" id="vencimiento" value="" >
        {!! $errors->first('vencimiento', '<p class="help-block">:message</p>') !!}
    </div>
</div>



<div class="form-group {{ $errors->has('pedido_id') ? 'has-error' : ''}}">
    <label for="pedido_id" class="col-md-4 control-label">{{ 'Pedido Id' }}</label>
    <div class="col-md-6">
        <select class="form-control" name="pedido_id" id="pedido_id" value="{{ $preparado->pedido_id or ''}}" >
              @foreach ($pedidos as $pedido)
                <option value="{{$pedido->id}}">{{$pedido->hora_entrega}}</option>
              @endforeach
        </select>
        {!! $errors->first('pedido_id', '<p class="help-block">:message</p>') !!}
    </div>
</div><div class="form-group {{ $errors->has('users_id') ? 'has-error' : ''}}">
    <label for="users_id" class="col-md-4 control-label">{{ 'Users Id' }}</label>
    <div class="col-md-6">
        <select class="form-control" name="users_id"  id="users_id" value="{{ $preparado->users_id or ''}}" >
             @foreach ($users as $user)
                <option value="{{$user->id}}">{{$user->name}}</option>
             @endforeach
        </select>
        {!! $errors->first('users_id', '<p class="help-block">:message</p>') !!}
    </div>
</div>

<div class="form-group">
    <div class="col-md-offset-4 col-md-4">
        <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
    </div>
</div>
