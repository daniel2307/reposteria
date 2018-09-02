@extends('layouts.app')

@section('content')
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Detalle Pedido</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/pedido') }}" title="Back"><button class="btn btn-warning btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
        
        <div class="table-responsive">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">ID</th>
                        <td>{{ $pedido->id }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Cliente</th>
                        <td>{{ $pedido->cliente->nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha</th>
                        <td>{{ $pedido->fecha }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha de Entrega</th>
                        <td>{{ $pedido->fecha_entrega }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Hora de Entrega</th>
                        <td>{{ $pedido->hora_entrega }}</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio Unitario</th>
                                        <th>Sub Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($pedido->detalle_pedido as $key => $value)
                                    <tr>
                                        <td>{{ $value->producto->nombre }}</td>
                                        <td>{{ $value->cantidad }}</td>
                                        <td>{{ $value->producto->costo }}</td>
                                        <td>{{ $value->subtotal }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <th scope="row">Acuenta</th>
                        <td>{{ $pedido->acuenta }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Saldo</th>
                        <td>{{ $pedido->saldo }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Total</th>
                        <td>{{ $pedido->total }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Descuento</th>
                        <td>{{ $pedido->descuento }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Total Importe</th>
                        <td>{{ $pedido->total_importe }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Tipo</th>
                        <td>{{ $pedido->tipo }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Estado</th>
                        <td>{{ $pedido->estado }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Forma de pago</th>
                        <td>{{ $pedido->forma_de_pago }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-pedido').addClass('current-menu-item');
        $('#a-pedido').addClass('active');
    });
</script>
@endpush