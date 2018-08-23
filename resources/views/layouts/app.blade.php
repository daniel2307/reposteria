<!DOCTYPE html>

<html lang="en">

<head>
    @include('layouts.htmlheader')
</head>

<body class="fixed-sn mdb-skin-custom" data-spy="scroll" data-target="#scrollspy" data-offset="15">
    <header>
        <!-- Sidebar navigation -->
        @include('layouts.sidebar')
        <!--/. Sidebar navigation -->

        <!-- Navbar-->
        @include('layouts.navbar')
        <!-- /.Navbar-->
    </header>

    <!--Main layout-->
    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Content -->
                    @yield('content')
                    <!-- Content -->
                </div>
            </div>
        </div>
    </main>
    <!--Main layout-->
    
    <!--Footer-->
    <!-- @ include('layouts.footer') -->
    <!--/.Footer-->

    <!-- scripts -->
    @include('layouts.scripts')
    <!--/.scripts -->
</body>

</html>