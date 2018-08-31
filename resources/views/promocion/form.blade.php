@csrf
<div class="form-row">
    <div class="col text-left">
        <select class="mdb-select colorful-select dropdown-primary" name="producto_id" id="producto_id" required>
            @foreach($productos as $key => $value)
            <option value="{{ $value->id }}">{{ $value->nombre }}</option>
            @endforeach
        </select>
        <label for="producto_id">Producto <b class="red-text">*</b></label>
    </div>
    <div class="col">
        <div class="md-form">
            <input type="number" id="precio" name="precio" class="form-control" value="{{ $promocion->precio or '' }}" required>
            <label for="precio">Precio <b class="red-text">*</b></label>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="number" id="duracion" name="duracion" class="form-control" value="{{ $promocion->duracion or '' }}" required>
            <label for="duracion">Duracion <b class="red-text">*</b></label>
        </div>
    </div>
    <div class="col">
        <div class="md-form">
            <textarea type="text" id="unidad" name="unidad" class="md-textarea form-control" rows="2">{{ $promocion->unidad or '' }}</textarea>
            <label for="unidad">Unidad</label>
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
        <select class="mdb-select colorful-select dropdown-primary" name="unidad" id="unidad" required>
            <option value="horas">Horas</option>
            <option value="dias">Dias</option>
        </select>
        <label for="unidad">Unidad <b class="red-text">*</b></label>
    </div>
</div>  

<div class="md-form">
    <div class="file-field">
        <div class="btn btn-primary btn-sm float-left">
            <span>Imagen</span>
            <input type="file" id="imagen" name="imagen">
        </div>
        <div class="file-path-wrapper">
            <!-- <input class="file-path validate" type="text" placeholder="Upload your file"> -->
        </div>
    </div>
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
