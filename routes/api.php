<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
    Route::post('cliente', 'AuthController@cliente');

});


Route::group([

    'middleware' => ['api', 'auth:api'],

], function ($router) {

    Route::put('cliente/{cliente_id}', 'ClienteController@update');
    Route::get('cliente/{cliente_id}/edit', 'ClienteController@edit');
    Route::post('pedido', 'PedidoController@store');
    Route::get('pedido/{pedido_id}', 'PedidoController@show');
    Route::get('pedido/cliente/{cliente_id}', 'PedidoController@getPedidoByCliente');

});

Route::post('cliente', 'ClienteController@store');
Route::get('getPromocion', 'PromocionController@getPromocion');
Route::get('getProductos', 'ProductoController@getProductos');
Route::get('getCategoria', 'CategoriaProductoController@getCategoria');
Route::get('getProductosByCategoria/{categoria_id}', 'ProductoController@getProductosByCategoria');

