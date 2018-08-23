@csrf
<div class="form-row">
    <div class="col">
        <div class="md-form">
            <input type="text" id="nombre" name="nombre" class="form-control" value="{{ $categoriaproducto->nombre or '' }}" required>
            <label for="nombre">Nombre</label>
        </div>
    </div>
    <div class="col">
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
</div>

<button class="btn btn-success btn-block my-4 waves-effect z-depth-0" type="submit">
    {{ $submitButtonText or 'GUARDAR' }}
</button>
