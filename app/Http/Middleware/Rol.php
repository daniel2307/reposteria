<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class Rol
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $rol)
    {    
        if (Auth::User()->rol == $rol) {
            return $next($request);
        }else{
            return abort(404);
        }
    }
}
