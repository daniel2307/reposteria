<div id="slide-out" class="side-nav sn-bg-4 mdb-sidenav fixed">
    <ul class="custom-scrollbar list-unstyled" style="max-height:100vh;">
        <!-- Logo -->
        <li class="logo-sn d-block waves-effect">
            <div class="text-center">
                <a class="pl-0" href="index.html"><img id="MDB-logo" src="/img/logo-mdb-jquery-small.png" alt="MDB Logo"></a>
            </div>
        </li>
        <!--/. Logo -->
        <!--Search Form-->
        
        <!--/.Search Form-->
        <!-- Side navigation links -->
        <li>
            <ul class="collapsible collapsible-accordion">
                <li class="menu-item" id="cmi-home"> <!-- current-menu-item -->
                    <a class="collapsible-header waves-effect" href="{{ url('home') }}" id="a-home">
                        <i class="fas fa-home mr-2"></i>
                        Home
                    </a>
                </li>
            

                <li class="menu-item" id="cmi-producto">
                    <a class="collapsible-header waves-effect"  href="{{ url('producto') }}" id="a-producto">
                        <i class="fas fa-boxes mr-2"></i> 
                        Productos
                    </a>
                </li>

                <li class="menu-item" id="cmi-categoria-producto">
                    <a class="collapsible-header waves-effect"  href="{{ url('categoriaproducto') }}" id="a-categoria-producto">
                        <i class="fas fa-tags mr-2"></i> 
                        Categoria de producto
                    </a>
                </li>

                <li class="menu-item" id="cmi-cliente">
                    <a class="collapsible-header waves-effect" href="{{ url('cliente') }}" id="a-cliente">
                        <i class="fas fa-users mr-2"></i>
                        Cliente
                    </a>
                </li>

                <li class="menu-item" id="cmi-venta">
                    <a class="collapsible-header waves-effect" href="{{ url('venta') }}" id="a-venta">
                        <i class="fas fa-money mr-2"></i>
                        Venta
                    </a>
                </li>

                <li class="menu-item" id="cmi-pedido">
                    <a class="collapsible-header waves-effect" href="{{ url('pedido') }}" id="a-pedido">
                        <i class="fas fa-email mr-2"></i>
                        Pedidos
                    </a>
                </li>

                <li class="menu-item">
                    <a class="collapsible-header waves-effect arrow-r">
                        <i class="fas fa-print mr-2"></i>Reportes<i class="fa fa-angle-down rotate-icon"></i>
                    </a>
                    <div class="collapsible-body">
                        <ul class="sub-menu">
                            <li class="menu-item">
                                <a class="collapsible-header waves-effect" href="#"></a>
                            </li>
                            <li class="menu-item">
                                <a class="collapsible-header waves-effect" href="#"></a>
                            </li>
                            <li class="menu-item">
                                <a class="collapsible-header waves-effect" href="#"></a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
        </li>
        <!-- /. Side navigation links -->
    </ul>
    <div class="sidenav-bg mask-strong"></div>
</div>