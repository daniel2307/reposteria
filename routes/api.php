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

    Route::post('cliente', 'ClienteController@store');
    Route::post('cliente/{cliente_id}', 'ClienteController@update');
    Route::get('cliente/{cliente_id}/edit', 'ClienteController@edit');

});

Route::get('getPromocion', 'PromocionController@getPromocion');
Route::get('getCategoria', 'CategoriaProductoController@getCategoria');
Route::get('getProductosByCategoria/{categoria_id}', 'ProductoController@getProductosByCategoria');