@csrf
<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="nombre" name="nombre" class="form-control" value="{{ $producto->nombre or '' }}">
            <label for="nombre">Nombre</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="costo" name="costo" class="form-control" value="{{ $producto->costo or '' }}">
            <label for="costo">Costo</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="number" id="cantidad" name="cantidad" class="form-control" value="{{ $producto->cantidad or '' }}">
            <label for="cantidad">Cantidad</label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <textarea type="text" id="descripcion" name="descripcion" class="md-textarea form-control" rows="2" value="{{ $producto->descripcion or '' }}"></textarea>
            <label for="descripcion">Descripcion</label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="number" id="duracion" name="duracion" class="form-control" value="{{ $producto->duracion or '' }}">
            <label for="duracion">Duracion</label>
        </div>
    </div>
    <div class="col">
        <select class="mdb-select colorful-select dropdown-primary" name="categoria_producto_id" id="categoria_producto_id">
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3" selected>Option 3</option>
            <option value="4">Option 4</option>
            <option value="5">Option 5</option>
        </select>
        <label for="categoria_producto_id">Categoria</label>
    </div>
</div>  

<div class="md-form">
    <div class="file-field">
        <div class="btn btn-primary btn-sm float-left">
            <span>Imagen</span>
            <input type="file">
        </div>
        <div class="file-path-wrapper">
            <input class="file-path validate" type="text" placeholder="Upload your file">
        </div>
    </div>
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
