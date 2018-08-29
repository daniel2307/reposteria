@csrf
<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="nombre" name="nombre" class="form-control" value="{{ $producto->nombre or '' }}" autocomplete="off" required>
            <label for="nombre">Nombre <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="costo" name="costo" class="form-control" value="{{ $producto->costo or '' }}" required>
            <label for="costo">Costo <b class="red-text">*</b></label>
        </div>
    </div>



    <div class="col">
        <div class="md-form">
            <input type="number" id="cantidad" name="cantidad" class="form-control" value="{{ $producto->cantidad or '' }}" required>
            <label for="cantidad">Cantidad <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <textarea type="text" id="descripcion" name="descripcion" class="md-textarea form-control" rows="2">{{ $producto->descripcion or '' }}</textarea>
            <label for="descripcion">Descripcion</label>
        </div>
    </div>



    <div class="col">
        <div class="md-form">
            <input type="number" id="duracion" name="duracion" class="form-control" value="{{ $producto->duracion or '' }}">
            <label for="duracion">Duracion</label>
        </div>
    </div>
    <div class="col text-left">
        <select class="mdb-select colorful-select dropdown-primary" name="categoria_producto_id" id="categoria_producto_id" required>
            @foreach($categoria as $key => $value)
            <option value="{{ $value->id }}">{{ $value->nombre }}</option>
            @endforeach
        </select>
        <label for="categoria_producto_id">Categoria <b class="red-text">*</b></label>
    </div>


<div class="md-form">
    <div class="file-field">
        <div class="btn btn-primary btn-sm float-left">
            <span>Imagen</span>
            <input type="file" name="imagen">
        </div>
        <div class="file-path-wrapper">
            <!-- <input class="file-path validate" type="text" placeholder="Upload your file"> -->
        </div>
    </div>
</div>
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
