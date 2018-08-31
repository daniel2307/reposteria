<nav class="navbar fixed-top navbar-expand-md navbar-light white double-nav scrolling-navbar">
    <!-- SideNav slide-out button -->
    <div class="float-left">
        <a href="#" data-activates="slide-out" class="button-collapse"><i class="fa fa-bars"></i><span class="sr-only" aria-hidden="true">Toggle side navigation</span></a>
    </div>
    <!-- Navbar links-->
    <div class="mr-auto">
        <span class="d-none d-md-inline-block">

        <!--Angular-->
              
            <!-- <a class="btn btn-info btn-sm my-0" href="#" role="button">
                <span class="d-none d-lg-inline-block mr-1">Tutorial</span>
                <i class="fa fa-graduation-cap"></i>
            </a>
            <a class="btn btn-unique btn-sm my-0" href="#" role="button">
                <span class="d-none d-lg-inline-block mr-1">Go Pro</span>
                <i class="fab fa-product-hunt"></i>
            </a> -->
            <!-- Dynamic content wrapper -->
            <span></span>
        </span>
    </div>

    <!--Navigation icons-->
    <ul class="nav navbar-nav nav-flex-icons ml-auto">
        
        <!-- Support -->
        <li id="navbar-static-support" class="nav-item ">
            <a href="#" class="nav-link waves-effect">
                <span class="clearfix d-none d-sm-inline-block">{{ Auth::user()->name }}</span>
            </a>
        </li>
        <!-- Login / register -->
        <a href="{{ route('logout') }}" class="btn btn-info btn-rounded btn-sm waves-effect waves-light" onclick="event.preventDefault(); if (confirm('Esta seguro de Salir?')) {document.getElementById('logout-form').submit();} ">
            Log Out
            <i class="fas fa-sign-out-alt ml-2"></i>
        </a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
    </ul>
</nav>