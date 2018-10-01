@extends('layouts.app')

@section('content')
@if(Auth::user()->rol == "administrador")
<div class="row">

    <div class="col-lg-3 col-md-12 mb-lg-0 mb-4">

        <div class="card text-center">

            <div class="card-body">

                <h5 class="mb-4">Productos</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-birthday-cake fa-4x light-blue-text"></i>
                    </div>
                </div>

                <h2 class="font-weight-bold my-4">{{ $productos }} Types</h2>
                <a href="{{ url('producto') }}" class="btn btn-light-blue btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-3 col-md-6 mb-md-0 mb-4">

        <div class="card text-center purple-gradient">

            <div class="card-body white-text">

                <h5 class="mb-4">Categorias</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-tags fa-4x"></i>
                    </div>
                </div>

                <h2 class="font-weight-bold my-4">{{ $categorias }} Types</h2>
                <a href="{{ url('categoriaproducto') }}" class="btn btn-outline-white btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-3 col-md-6">

        <div class="card text-center">

            <div class="card-body">

                <h5 class="mb-4">Promociones</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-percent fa-4x light-blue-text"></i>
                    </div>
                </div>

                <h2 class="font-weight-bold my-4">{{ $promociones->vigente }} Promos</h2>
                <a href="{{ url('promocion') }}" class="btn btn-light-blue btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-3 col-md-6 mb-md-0 mb-4">

        <div class="card text-center peach-gradient">

            <div class="card-body white-text">

                <h5 class="mb-4">Pedidos en espera</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-user-clock fa-4x"></i>
                    </div>
                </div>

                <h2 class="font-weight-bold my-4">{{ $pedidos->espera }}</h2>
                <a href="{{ url('pedido-pendiente') }}" class="btn btn-outline-white btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>
    </div>
</div>
<br>
<div class="row mb-5">

    <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">

        <div class="card pricing-card white-text mb-2">

            <div class="aqua-gradient rounded-top">
                <h4 class="option">PEDIDOS</h4>
            </div>

            <div class="card-body striped green-striped card-background px-5">

                <h2 class="my-4 pb-3 h1">{{ $pedidos->espera + $pedidos->entregado + $pedidos->cancelado }}</h2>
                <ul>
                    <li>
                        <p><strong>{{ $pedidos->espera }}</strong> en espera</p>
                    </li>
                    <li>
                        <p><strong>{{ $pedidos->entregado }}</strong> entregados</p>
                    </li>
                    <li>
                        <p><strong>{{ $pedidos->cancelado }}</strong> cancelados</p>
                    </li>
                </ul>
                <a href="{{ url('pedido-pendiente') }}" class="mb-3 mt-3 btn aqua-gradient btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">

        <div class="card pricing-card white-text mb-2">

            <div class="aqua-gradient rounded-top">
                <h4 class="option">PEDIDOS</h4>
            </div>

            <div class="card-body striped green-striped card-background px-5">

                <h2 class="my-4 pb-3 h1">{{ $pedidos->dia }}$</h2>
                <ul>
                    <li>
                        <p><strong>{{ $pedidos->dia }}$</strong> este dia</p>
                    </li>
                    <li>
                        <p><strong>{{ $pedidos->mes }}$</strong> este mes</p>
                    </li>
                    <li>
                        <p><strong>{{ $pedidos->año }}$</strong> este año</p>
                    </li>
                </ul>
                <a href="{{ url('reporte/pedido') }}" class="mb-3 mt-3 btn aqua-gradient btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-4 col-md-6">

        <div class="card pricing-card white-text mb-2">

            <div class="purple-gradient rounded-top">
                <h4 class="option">VENTAS</h4>
            </div>

            <div class="card-body striped purple-striped card-background px-5">

                <h2 class="my-4 pb-3 h1">{{ $ventas->dia }}$</h2>
                <ul>
                    <li>
                        <p><strong>{{ $ventas->dia }}$</strong> este dia</p>
                    </li>
                    <li>
                        <p><strong>{{ $ventas->mes }}$</strong> este mes</p>
                    </li>
                    <li>
                        <p><strong>{{ $ventas->año }}$</strong> este año</p>
                    </li>
                </ul>
                <a href="{{ url('reporte/venta') }}" class="mb-3 mt-3 btn purple-gradient btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-4 col-md-6 mb-md-0 mb-4">

        <div class="card pricing-card white-text mb-2">

            <div class="peach-gradient rounded-top">
                <h4 class="option">PROMOCIONES</h4>
            </div>

            <div class="card-body striped orange-striped card-background px-5">

                <h2 class="my-4 pb-3 h1">{{ $promociones->espera + $promociones->vigente + $promociones->expirado }}</h2>
                <ul>
                    <li>
                        <p><strong>{{ $promociones->espera }}</strong> en espera</p>
                    </li>
                    <li>
                        <p><strong>{{ $promociones->vigente }}</strong> vigentes</p>
                    </li>
                    <li>
                        <p><strong>{{ $promociones->expirado }}</strong> expirados</p>
                    </li>
                </ul>
                <a href="{{ url('promocion') }}" class="mb-3 mt-3 btn peach-gradient btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

</div>
@endif
@if(Auth::user()->rol == "vendedor")
<br><br>
<div class="row">

    <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">

        <div class="card text-center">

            <div class="card-body">

                <h5 class="mb-4">Clientes</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-users fa-4x light-blue-text"></i>
                    </div>
                </div>

                <a href="{{ url('cliente') }}" class="btn btn-light-blue btn-rounded waves-effect waves-light">Ver</a>

            </div>

        </div>

    </div>

    <div class="col-lg-4 col-md-6 mb-md-0 mb-4">

        <div class="card text-center purple-gradient">

            <div class="card-body white-text">

                <h5 class="mb-4">Ventas</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-money-bill fa-4x"></i>
                    </div>
                </div>

                <a href="{{ url('venta/create') }}" class="btn btn-outline-white btn-rounded waves-effect waves-light">Realizar Venta</a>

            </div>

        </div>

    </div>

    <div class="col-lg-4 col-md-6">

        <div class="card text-center">

            <div class="card-body">

                <h5 class="mb-4">Pedidos</h5>
                <div class="d-flex justify-content-center">
                    <div class="card-circle d-flex justify-content-center align-items-center">
                        <i class="fas fa-user-clock fa-4x light-blue-text"></i>
                    </div>
                </div>

                <a href="{{ url('pedido/create') }}" class="btn btn-light-blue btn-rounded waves-effect waves-light">Realizar Pedido</a>

            </div>

        </div>

    </div>

</div>
@endif
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cmi-home').addClass('current-menu-item');
        $('#a-home').addClass('active');
    });
</script>
@endpush