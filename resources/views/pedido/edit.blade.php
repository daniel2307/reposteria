@extends('layouts.app')

@section('content')
<div class="card mb-5">
    <h3 class="card-header primary-color white-text">Crear Nuevo Pedido</h3>
    <div class="card-body">
        <a href="{{ url('/pedido/' . $pedido->id) }}" title="Back"><button class="btn btn-warning btn-sm mb-4"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>
        
        <form method="POST" action="{{ url('/pedido/' . $pedido->id) }}" accept-charset="UTF-8" class="form-horizontal" onsubmit="return validar_formulario();">
            @method('PATCH')
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
                                        <input type="date" class="form-control" name="fecha_entrega" id="fecha_entrega" value="{{ $pedido->fecha_entrega }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group row">
                                <label for="hora_entrega" class="col-sm-5 col-form-label">Hora entrega <b class="red-text">*</b></label>
                                <div class="col-sm-7">
                                    <div class="md-form mt-0">
                                        <input type="time" class="form-control" name="hora_entrega" id="hora_entrega" value="{{ $pedido->hora_entrega }}">
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
                                            <option value="tienda" {{ $pedido->forma_de_pago == 'tienda' ? 'selected' : '' }}>Tienda</option>
                                            <option value="banco" {{ $pedido->forma_de_pago == 'banco' ? 'selected' : '' }}>Banco</option>
                                            <option value="domicilio" {{ $pedido->forma_de_pago == 'domicilio' ? 'selected' : '' }}>Domicilio</option>
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
                                <div class="col-md-6">
                                    <div class="md-form form-group">
                                        <input type="text" class="form-control" name="cliente_nombre" id="cliente_nombre" value="{{ $pedido->cliente->nombre }}" readonly>
                                        <label for="cliente_nombre">
                                            Nombre Cliente <b class="red-text">*</b>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="md-form form-group">
                                        <input type="text" class="form-control" name="cliente_ci" id="cliente_ci" value="{{ $pedido->cliente->ci }}" readonly>
                                        <label for="cliente_ci">
                                            CI Cliente <b class="red-text">*</b>
                                        </label>
                                    </div>
                                </div>
                            </div>
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
                                @foreach($pedido->detalle_pedido as $key => $value)
                                <tr id="item{{ $value->producto_id }}">
                                    <td><button type="button" onclick="eliminar_item('#item{{ $value->producto_id }}');" class="btn btn-danger btn-sm">X</button></td>
                                    <td>{{ $value->producto->nombre }}</td>
                                    <td><textarea type="text" name="descripcion[{{ $value->producto_id }}]" class="md-textarea form-control" rows="2">{{ $value->descripcion }}</textarea></td>
                                    <td><input type="number" class="form-control" name="cantidad[{{ $value->producto_id }}]" style="width:100px;" min="1" value="{{ $value->cantidad }}" onchange="calcular_subtotal('#item{{ $value->producto_id }}');"></td>
                                    <td>{{ $value->producto->costo }}</td>
                                    <td><input type="text" class="form-control" name="subtotal[{{ $value->producto_id }}]" style="width:120px;" value="{{ $value->subtotal }}" readonly></td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Acuenta</th>
                                    <th><input type="number" name="acuenta" id="acuenta" style="width:120px;" value="{{ $pedido->acuenta }}" class="form-control" onchange="calcular_saldo();" min="0"></th>
                                    <th colspan="2"></th>
                                    <th>Total</th>
                                    <th><input type="text" name="total" id="total" style="width:120px;" value="{{ $pedido->total }}" class="form-control" readonly></th>
                                </tr>
                                <tr>
                                    <th>Saldo</th>
                                    <th><input type="text" name="saldo" id="saldo" style="width:120px;" value="{{ $pedido->saldo }}" class="form-control" readonly></th>
                                    <th colspan="2"></th>
                                    <th>Descuento</th>
                                    <th><input type="number" name="descuento" id="descuento" style="width:120px;" value="{{ $pedido->descuento }}" class="form-control" onchange="calcular_total_importe();" min="0"></th>
                                </tr>
                                <tr>
                                    <th colspan="4"></th>
                                    <th>Total Importe</th>
                                    <th><input type="text" name="total_importe" id="total_importe" style="width:120px;" value="{{ $pedido->total_importe }}" class="form-control" min="0" readonly></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="text-right">
                <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'GUARDAR' }}">
            </div>
        </form>

    </div>
</div>

@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-pedido').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-pedido').addClass('active');
        $("#css-pedido").css("display", "block");
        $('#cmi-pedido').addClass('current-menu-item');
    });

    function agregar(){
        var producto_id = $('#producto').val();
        var producto = $("#producto option:selected").text();
        var costo = $("#producto option:selected").data("price");
        var item = "item"+producto_id;
        if($("#"+item).length == 0) {
            // no existe el id
            $('#lista_pedido').append("\
                <tr id='"+item+"'>\
                    <td><button type='button' onclick='eliminar_item("+item+");' class='btn btn-danger btn-sm'>X</button></td>\
                    <td>"+producto+"</td>\
                    <td><textarea type='text' name='descripcion["+producto_id+"]' class='md-textarea form-control' rows='2'></textarea></td>\
                    <td><input type='number' class='form-control' name='cantidad["+producto_id+"]' style='width:100px;' min='1' value='1' onchange='calcular_subtotal("+item+");'></td>\
                    <td>"+costo+"</td>\
                    <td><input type='text' class='form-control' name='subtotal["+producto_id+"]' style='width:120px;' value='"+costo+"' readonly></td>\
                </tr>\
                ");
            calcular_total();
        }
        else {
            alert("El producto ya esta en la lista!!!");
        }
    }
    function calcular_subtotal(item){
        var cantidad = $($($(item).find("td"))[3]).find("input").val();
        var pu = $(item).find("td").eq(4).html();
        var subtotal = cantidad * pu;
        $($($(item)[0])[0].cells[5].childNodes[0]).val(subtotal.toFixed(2));
        calcular_total();


    }
    function calcular_total(){
         // obtenemos todas las filas del tbody
        var filas=document.querySelectorAll("#lista_pedido tr");
     
        var total=0;
     
        // recorremos cada una de las filas
        filas.forEach(function(e) {
     
            // obtenemos las columnas de cada fila
            var columnas=e.querySelectorAll("td");
            
            // obtenemos los valores de la cantidad y importe
            var st=parseFloat($(columnas[5].childNodes[0]).val());
     
            total+=st;
        });
        $("#total").val(total.toFixed(2));
        calcular_total_importe();
    }

    function calcular_total_importe(){
        var total_ = $("#total").val();
        var descuento_ = $("#descuento").val();
        var total_importe_ = parseFloat(total_) - parseFloat(descuento_);
        $("#total_importe").val(total_importe_.toFixed(2));
        calcular_saldo();
    }

    function calcular_saldo(){
        var total_importe_ = $("#total_importe").val();
        var acuenta_ = $("#acuenta").val();
        var saldo_ = parseFloat(total_importe_) - parseFloat(acuenta_);
        $("#saldo").val(saldo_.toFixed(2));
    }

    function buscar_cliente(){
        var ci = $("#txt_search").val();
        if (ci) {
            $.ajax({
                method: "POST",
                url: "/cliente/searchByCi",
                data: { ci: ci, _token: "{{ csrf_token() }}", },
                success: function(result) {
                    if (result.cliente) {
                        $("#cliente_nombre").val(result.cliente.nombre);
                        $("#cliente_ci").val(result.cliente.ci);
                        $("#cliente_id").val(result.cliente.id);
                    }
                    else {
                        $("#cliente_nombre").val("");
                        $("#cliente_ci").val(ci);
                        $("#cliente_id").val("");
                    }
                },
                error: function() {
                    console.log("No se ha podido obtener la información");
                }
            });
        }
    }

    function eliminar_item(item){
        $(item).remove();
        calcular_total();
    }

    function validar_formulario(){
        if ($("#lista_pedido").find("tr").length == 0) {
            alert("Lista vacia de productos!");
            return false;
        }
        if ($("#cliente_id").val() == "" && $("#cliente_ci").val() == "") {
            alert("Llenar datos del cliente!");
            return false;
        }
        if ($("#fecha_entrega").val() == "" && $("#hora_entrega").val() == "") {
            alert("Llenar datos de entrega!");
            return false;
        }
        return true;
    }
    
</script>
@endpush