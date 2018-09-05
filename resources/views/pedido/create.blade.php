@extends('layouts.app')

@section('content')
<div class="card">
    <h3 class="card-header primary-color white-text">Crear Nuevo Pedido</h3>
    <div class="card-body">
        <a href="{{ url('/pedido') }}" title="Back"><button class="btn btn-warning btn-sm mb-4"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <p><small class="red-text">* Obligatorio</small></p>
        
        <form method="POST" action="{{ url('/pedido') }}" accept-charset="UTF-8" class="form-horizontal" onsubmit="return validar_formulario();">
            @include('pedido.form', ['submitButtonText' => 'GUARDAR'])
        </form>

    </div>
</div>

@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-pedido').addClass('current-menu-item');
        $('#a-pedido').addClass('active');
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