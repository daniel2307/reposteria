@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Añadir Nueva Venta</div>
                    <div class="card-body">
                        <a href="{{ url('/admin/venta') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

                        <form method="POST" action="{{ url('/admin/venta') }}" accept-charset="UTF-8" class="form-horizontal" enctype="multipart/form-data" onsubmit="return validar_formulario();">
                            {{ csrf_field() }}

                            <div class="form-group">
                                <label for="producto" class="col-md-4 control-label">Producto:</label>
                                <div class="col-md-6">
                                    <select  class="form-control" id="producto">
                                        @foreach($productos as $key => $value)
                                            <option value="{{ $value->id }}" data-price="{{ $value->costo }}">{{ $value->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="txt_search" placeholder="Buscar cliente...">
                                    <span class="input-group-append">
                                        <button class="btn btn-secondary" type="button" onclick="buscar_cliente();">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <input type="hidden" name="cliente_id" id="cliente_id" value="">
                            </div>
                            <div class="form-group">
                                <label for="cliente_nombre" class="col-md-4 control-label">Nombre Cliente:</label>
                                <div class="col-md-6">
                                    <input class="form-control" name="cliente_nombre" id="cliente_nombre" type="text" id="" value="" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cliente_ci" class="col-md-4 control-label">CI Cliente:</label>
                                <div class="col-md-6">
                                    <input class="form-control" name="cliente_ci" id="cliente_ci" type="text" id="" value="" >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-4">
                                    <button type="button" class="btn btn-success" onclick="agregar();">Agregar en Lista</button>
                                </div>
                            </div>
                            
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio Unitario</th>
                                        <th>Sub Total</th>
                                    </tr>
                                </thead>
                                <tbody id="lista_pedido">

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3"></th>
                                        <th>Total</th>
                                        <th><input type="text" name="total" id="total" style="width:120px;" value="0.00" class="form-control" readonly></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3"></th>
                                        <th>Descuento</th>
                                        <th><input type="number" name="descuento" id="descuento" style="width:120px;" value="0.00" class="form-control" onchange="calcular_total_importe();" min="0"></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3"></th>
                                        <th>Total Importe</th>
                                        <th><input type="text" name="total_importe" id="total_importe" style="width:120px;" value="0.00" class="form-control" min="0" readonly></th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-4">
                                    <input class="btn btn-primary" type="submit" value="{{ $submitButtonText or 'Create' }}">
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
<script type="text/javascript">
    function agregar(){
        var producto_id = $('#producto').val();
        var producto = $("#producto option:selected").text()
        var costo = $("#producto option:selected").data("price");
        var item = "item"+producto_id;
        if($("#"+item).length == 0) {
            // no existe el id
            $('#lista_pedido').append("\
                <tr id='"+item+"'>\
                    <td><button type='button' onclick='eliminar_item("+item+");' class='btn btn-danger'>X</button></td>\
                    <td>"+producto+"</td>\
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
        var cantidad = $($($(item).find("td"))[2]).find("input").val();
        var pu = $(item).find("td").eq(3).html();
        var subtotal = cantidad * pu;
        $($($(item)[0])[0].cells[4].childNodes[0]).val(subtotal.toFixed(2));
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
            var st=parseFloat($(columnas[4].childNodes[0]).val());
     
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
    }

    function buscar_cliente(){
        var ci = $("#txt_search").val();
        if (ci) {
            $.ajax({
                method: "POST",
                url: "/admin/cliente/searchByCi",
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
        var res = false;
        if ($("#cliente_id").val() == "" && $("#cliente_ci").val() == "") {
            res = false;
            // mostrar errores, cliente no seleccionado
        }
        else {
            res = true;
        }
        if ($("#lista_pedido").find("tr").length == 0) {
            res = false;
            // mostrar errores, lista vacia de pedidos
        }
        else {
            res = true;
        }
        return res;
    }
    
</script>
