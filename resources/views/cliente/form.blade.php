@csrf
<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="nombre" name="nombre" class="form-control" value="{{ $cliente->nombre or '' }}">
            <label for="nombre">Nombre</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="text" id="ci" name="ci" class="form-control" value="{{ $cliente->ci or '' }}">
            <label for="ci">CI</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="direccion" name="direccion" class="form-control" value="{{ $cliente->direccion or '' }}">
            <label for="direccion">Direccion</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="text" id="telefono" name="telefono" class="form-control" value="{{ $cliente->telefono or '' }}">
            <label for="telefono">Telefono</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="celular" name="celular" class="form-control" value="{{ $cliente->celular or '' }}">
            <label for="celular">Celular</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="email" id="email" name="email" class="form-control" value="{{ $cliente->email or '' }}">
            <label for="email">Email</label>
        </div>
    </div>
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
