<!DOCTYPE html>
<html lang="en">

<head>
    @include('layouts.htmlheader')
    <style>
        body,html{height:100%}
    </style>
</head>

<body style="background-image: url('/img/sidenav3.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
    <br>
    <br>
    <br>
    <!--Grid row-->

    <div class="row wow fadeIn aling-items-center" style="margin-right:0px; margin-left:0px; margin-top:0px;">
        <div class="col-md-4"></div>
        
        <div class="col-md-4 col-sm-12">
            <!--Form with header-->
            <div class="card"><!-- bg-transparent -->
                <div class="card-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
                        @csrf
                        <!--Header-->
                        <div class="form-header blue-grey purple-gradient">
                            <h3>
                                <i class="fa fa-lock white-text"></i> {{ __('Login:') }}
                            </h3>
                        </div>

                        <!--Body-->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="email" class="form-control validate" name="email">
                            <label for="email">{{ __('E-Mail Address') }}</label>
                        </div>

                        <br>

                        <div class="md-form">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="password" class="form-control validate" name="password">
                            <label for="password">{{ __('Your password') }}</label>
                        </div>

                        <br>

                        <div class="text-center">
                            <button class="btn btn-  blue-grey purple-gradient waves-effect waves-light">Login</button>
                        </div>
                    </form>
                    <!-- Form -->
                </div>
                <!--Footer-->
                <div class="modal-footer">
                    
                    <div class="footer-copyright py-3 text-center" alig="center">
                        © 2018 Copyright:
                        <a href="#"> Said.com </a>
                    </div>
                    
                </div>
            </div>
            <!--/Form with header-->
        </div>
        <div class="col-md-4"></div>
    </div>
    <!--Grid row-->

    <!-- SCRIPTS -->
    @include('layouts.scripts')

</body>

</html>