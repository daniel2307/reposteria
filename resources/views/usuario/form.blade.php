@csrf
<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="name" name="name" class="form-control" value="{{ $user->name or '' }}" required>
            <label for="name">Nombre <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="text" id="direccion" name="direccion" class="form-control" value="{{ $user->direccion or '' }}">
            <label for="direccion">Direccion</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="telefono" name="telefono" class="form-control" value="{{ $user->telefono or '' }}">
            <label for="telefono">Telefono</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="text" id="celular" name="celular" class="form-control" value="{{ $user->celular or '' }}">
            <label for="celular">Celular</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="email" id="email" name="email" class="form-control" value="{{ $user->email or '' }}" required>
            <label for="email">Email <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="password" id="password" name="password" class="form-control" autocomplete="new-password" {{ isset($user->password) ? '' : 'required' }}>
            <label for="password">Password <b class="red-text">*</b></label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col text-left">
        <select class="mdb-select colorful-select dropdown-primary" name="rol" id="rol" required>
            <option value="vendedor" @if(isset($user->rol)){{ $user->rol == "vendedor" ? 'selected' : '' }}@endif>Vendedor</option>
            <option value="administrador" @if(isset($user->rol)){{ $user->rol == "administrador" ? 'selected' : '' }}@endif>Administrador</option>
            <option value="panadero" @if(isset($user->rol)){{ $user->rol == "panadero" ? 'selected' : '' }}@endif>Panadero</option>
        </select>
        <label for="rol">Rol <b class="red-text">*</b></label>
    </div>
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
