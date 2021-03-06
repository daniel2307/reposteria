@extends('layouts.app')

@section('content')
<div class="card mb-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Detalle Venta</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">
        <a href="{{ url('/venta') }}" title="Back"><button class="btn btn-warning btn-sm noPrint"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>

        <a href="javascript:window.print();"  title="print"><button class="btn btn-default btn-sm noPrint"><i class="fa fa-print" aria-hidden="true"></i> Imprimir</button></a>
        
        <div class="table-responsive">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">ID</th>
                        <td>{{ $venta->id }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Cliente</th>
                        <td>{{ $venta->cliente->nombre }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Fecha</th>
                        <td>{{ $venta->fecha }}</td>
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
                                    @foreach($venta->detalle_venta as $key => $value)
                                    <tr>
                                        <td>{{ $value->producto->nombre }}</td>
                                        <td>{{ $value->cantidad }}</td>
                                        <td>{{ round($value->subtotal / $value->cantidad , 2) }}</td>
                                        <td>{{ $value->subtotal }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <th scope="row">Total</th>
                        <td>{{ $venta->total }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Descuento</th>
                        <td>{{ $venta->descuento }}</td>
                    </tr>
                    <tr>
                        <th scope="row">Total Importe</th>
                        <td>{{ $venta->total_importe }}</td>
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
        $('#cma-cmp-venta').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-venta').addClass('active');
        $("#css-venta").css("display", "block");
        $('#cmi-venta').addClass('current-menu-item');
    });
</script>
@endpush