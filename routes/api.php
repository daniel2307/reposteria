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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('getPromocion', 'PromocionController@getPromocion');

Route::post('cliente', 'ClienteController@store');
Route::post('cliente/{cliente_id}', 'ClienteController@update');
Route::get('cliente/{cliente_id}/edit', 'ClienteController@edit');
Route::get('getCategoria', 'CategoriaProductoController@getCategoria');

Route::get('getProductosByCategoria/{categoria_id}', 'ProductoController@getProductosByCategoria');

