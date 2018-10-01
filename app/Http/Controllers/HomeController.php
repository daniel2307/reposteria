<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Producto;
use App\Categoriaproducto;
use App\Promocion;
use App\Pedido;
use App\Venta;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $productos = Producto::where('estado', 'activo')->count();
        $categorias = CategoriaProducto::where('estado', 'activo')->count();
        
        $ventas = collect([]);
        $ventas->dia = (new Venta)->getDia();
        $ventas->mes = (new Venta)->getMes();
        $ventas->año = (new Venta)->getAño();

        $pedidos = collect([]);
        $pedidos->dia = (new Pedido)->getDia();
        $pedidos->mes = (new Pedido)->getMes();
        $pedidos->año = (new Pedido)->getAño();
        $pedidos->espera = Pedido::where('estado', 'espera')->count();
        $pedidos->entregado = Pedido::where('estado', 'entregado')->count();
        $pedidos->cancelado = Pedido::where('estado', 'cancelado')->count();

        $promociones = collect([]);
        $promociones->espera = Promocion::where('estado', 'espera')->count();
        $promociones->vigente = Promocion::where('estado', 'vigente')->count();
        $promociones->expirado = Promocion::where('estado', 'expirado')->count();
        return view('home', compact('productos', 'categorias', 'promociones', 'pedidos', 'ventas'));
    }
}
