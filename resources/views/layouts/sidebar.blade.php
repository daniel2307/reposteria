<div id="slide-out" class="side-nav sn-bg-4 mdb-sidenav fixed noPrint">
    <ul class="custom-scrollbar list-unstyled" style="max-height:100vh;">
        <!-- Logo -->
        <li class="logo-sn d-block waves-effect">
            <div class="text-center">
                <a class="pl-0" href="#"><img id="MDB-logo" src="/img/logo.png" alt="Logo Reposteria"></a>
            </div>
        </li>
        <!--/. Logo -->
        <hr>
        <li>
            <p class="text-center text-uppercase text-black-50">{{ Auth::user()->rol }}</p>
        </li>
        <hr>
        <!-- Side navigation links -->
        <li>
            <ul class="collapsible collapsible-accordion">
                <li class="menu-item" id="cmi-home"> <!-- current-menu-item -->
                    <a class="collapsible-header waves-effect" href="{{ url('home') }}" id="a-home">
                        <i class="fas fa-home mr-2"></i>
                        Home
                    </a>
                </li>
                
                @if(Auth::user()->rol == "administrador")
                <li class="menu-item" id="cma-cmp-producto">
                    <a class="collapsible-header waves-effect arrow-r" id="a-producto">
                        <i class="fas fa-boxes mr-2"></i>
                        Productos
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-producto">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-producto">
                                <a class="collapsible-header waves-effect" href="{{ url('producto') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-producto-create">
                                <a class="collapsible-header waves-effect" href="{{ url('producto/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif

                @if(Auth::user()->rol == "administrador")
                <li class="menu-item" id="cma-cmp-categoria-producto">
                    <a class="collapsible-header waves-effect arrow-r" id="a-categoria-producto">
                        <i class="fas fa-tags mr-2"></i>
                        Categoria de Productos
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-categoria-producto">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-categoria-producto">
                                <a class="collapsible-header waves-effect" href="{{ url('categoriaproducto') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-categoria-producto-create">
                                <a class="collapsible-header waves-effect" href="{{ url('categoriaproducto/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif

                @if(Auth::user()->rol == "vendedor")
                <li class="menu-item" id="cma-cmp-cliente">
                    <a class="collapsible-header waves-effect arrow-r" id="a-cliente">
                        <i class="fas fa-users mr-2"></i>
                        Clientes
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-cliente">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-cliente">
                                <a class="collapsible-header waves-effect" href="{{ url('cliente') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-cliente-create">
                                <a class="collapsible-header waves-effect" href="{{ url('cliente/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif

                @if(Auth::user()->rol == "vendedor")
                <li class="menu-item" id="cma-cmp-venta">
                    <a class="collapsible-header waves-effect arrow-r" id="a-venta">
                        <i class="fas fa-money-bill mr-2"></i>
                        Ventas
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-venta">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-venta">
                                <a class="collapsible-header waves-effect" href="{{ url('venta') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-venta-create">
                                <a class="collapsible-header waves-effect" href="{{ url('venta/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif
                
                @if(Auth::user()->rol == "vendedor")
                <li class="menu-item" id="cma-cmp-pedido">
                    <a class="collapsible-header waves-effect arrow-r" id="a-pedido">
                        <i class="fas fa-percentage mr-2"></i>
                        Pedidos
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-pedido">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-pedido">
                                <a class="collapsible-header waves-effect" href="{{ url('pedido') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-pedido-create">
                                <a class="collapsible-header waves-effect" href="{{ url('pedido/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif
                
                @if(Auth::user()->rol == "administrador")
                <li class="menu-item" id="cma-cmp-promocion">
                    <a class="collapsible-header waves-effect arrow-r" id="a-promocion">
                        <i class="fas fa-percentage mr-2"></i>
                        Promociones
                        <i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body" id="css-promocion">
                        <ul class="sub-menu">
                            <li class="menu-item" id="cmi-promocion">
                                <a class="collapsible-header waves-effect" href="{{ url('promocion') }}">Lista</a>
                            </li>
                            <li class="menu-item" id="cmi-promocion-create">
                                <a class="collapsible-header waves-effect" href="{{ url('promocion/create') }}">Crear</a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif

                @if(Auth::user()->rol == "administrador" || Auth::user()->rol == "panadero")
                <li class="menu-item" id="cmi-update-stock">
                    <a class="collapsible-header waves-effect" href="{{ url('update-stock') }}" id="a-update-stock">
                        <i class="fas fa-boxes mr-2"></i>
                        Actualizar Existencias
                    </a>
                </li>
                @endif

                @if(Auth::user()->rol == "administrador")
                <li class="menu-item" id="cmi-users">
                    <a class="collapsible-header waves-effect" href="{{ url('users') }}" id="a-users">
                        <i class="fas fa-users mr-2"></i>
                        Usuarios
                    </a>
                </li>
                @endif

                @if(Auth::user()->rol == "administrador")
                <li class="menu-item" id="cmi-users">
                    <a class="collapsible-header waves-effect" href="{{ url('') }}" id="a-users">
                        <i class="fas fa-users mr-2"></i>
                        Pedidos en linea
                    </a>
                </li>

                <li class="menu-item" id="cmi-users">
                    <a class="collapsible-header waves-effect" href="{{ url('') }}" id="a-users">
                        <i class="fas fa-users mr-2"></i>
                        historial de clientes
                    </a>
                </li>

                <li class="menu-item" id="cmi-pedido-pendiente">
                    <a class="collapsible-header waves-effect" href="{{ url('pedido-pendiente') }}" id="a-pedido-pendiente">
                        <i class="fas fa-boxes mr-2"></i>
                        pedidos en espera
                    </a>
                </li>
                @endif

            </ul>
        </li>
        <!-- /. Side navigation links -->
    </ul>
    <div class="sidenav-bg mask-strong"></div>
</div>