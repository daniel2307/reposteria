@csrf
<div class="row">
    <div class="col-lg-5">
        <div class="row">
            <div class="col-12">
                <label for="producto">Producto <b class="red-text">*</b></label>
                <select class="mdb-select colorful-select dropdown-primary" name="producto" id="producto" searchable="Search here..">
                    @foreach($productos as $key => $value)
                        <option value="{{ $value->id }}" data-price="{{ $value->costo }}">{{ $value->producto }}</option>
                    @endforeach
                </select>
                <!-- <label for="producto">Producto <b class="red-text">*</b></label> -->
            </div>
            <div class="col-12">
                <button type="button" class="btn btn-success" onclick="agregar();">Agregar en Lista</button>
            </div>
            <div class="col-12">
                <div class="form-group row">
                    <label for="fecha_entrega" class="col-sm-5 col-form-label">Fecha entrega <b class="red-text">*</b></label>
                    <div class="col-sm-7">
                        <div class="md-form mt-0">
                            <input type="date" class="form-control" name="fecha_entrega" id="fecha_entrega">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="form-group row">
                    <label for="hora_entrega" class="col-sm-5 col-form-label">Hora entrega <b class="red-text">*</b></label>
                    <div class="col-sm-7">
                        <div class="md-form mt-0">
                            <input type="time" class="form-control" name="hora_entrega" id="hora_entrega">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="form-group row">
                    <label for="forma_de_pago" class="col-sm-5 col-form-label">Forma de pago <b class="red-text">*</b></label>
                    <div class="col-sm-7">
                        <div class="md-form mt-0">
                            <select class="mdb-select colorful-select dropdown-primary" name="forma_de_pago" id="forma_de_pago">
                                <option value="tienda">Tienda</option>
                                <option value="banco">Banco</option>
                                <option value="domicilio">Domicilio</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-7">
        <!--Panel-->
        <div class="card border-primary mb-3" style="max-width: 100%;">
            <div class="card-header">Datos del Cliente</div>
            <div class="card-body text-primary">
                <div class="row">
                    <div class="col-md-12">
                        <div class="md-form input-group">
                            <input type="text" class="form-control" id="txt_search" placeholder="Buscar Cliente..." aria-label="Buscar Cliente..." aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-mdb-color waves-effect m-0" type="button" onclick="buscar_cliente();"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="md-form form-group">
                            <input type="text" class="form-control" name="cliente_nombre" id="cliente_nombre" placeholder="...">
                            <label for="cliente_nombre">
                                Nombre Cliente <b class="red-text">*</b>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="md-form form-group">
                            <input type="text" class="form-control" name="cliente_ci" id="cliente_ci" placeholder="...">
                            <label for="cliente_ci">
                                CI Cliente <b class="red-text">*</b>
                            </label>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="cliente_id"  id="cliente_id">
            </div>
        </div>
        <!--/.Panel-->
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="table-responsive-lg">
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th></th>
                        <th>Producto</th>
                        <th>Descripcion</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Sub Total</th>
                    </tr>
                </thead>
                <tbody id="lista_pedido">
                </tbody>
                <tfoot>
                    <tr>
                        <th>Acuenta</th>
                        <th><input type="number" name="acuenta" id="acuenta" style="width:120px;" value="0.00" class="form-control" onchange="calcular_saldo();" min="0"></th>
                        <th colspan="2"></th>
                        <th>Total</th>
                        <th><input type="text" name="total" id="total" style="width:120px;" value="0.00" class="form-control" readonly></th>
                    </tr>
                    <tr>
                        <th>Saldo</th>
                        <th><input type="text" name="saldo" id="saldo" style="width:120px;" value="0.00" class="form-control" readonly></th>
                        <th colspan="2"></th>
                        <th>Descuento</th>
                        <th><input type="number" name="descuento" id="descuento" style="width:120px;" value="0.00" class="form-control" onchange="calcular_total_importe();" min="0"></th>
                    </tr>
                    <tr>
                        <th colspan="4"></th>
                        <th>Total Importe</th>
                        <th><input type="text" name="total_importe" id="total_importe" style="width:120px;" value="0.00" class="form-control" min="0" readonly></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<div class="text-right">
    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'GUARDAR' }}">
</div>