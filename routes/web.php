<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
/**
 * middleware para los que estan autentificados
 */
// Route::middleware(['auth']) ->group(function (){
//     Route::resource('producto', 'ProductoController');
// });
Route::resource('producto', 'ProductoController');
Route::get('producto/get/DataTable', 'ProductoController@getDataTable');

/**
 * middleware para los qu estan autentificados y que tienen el rol adminsitrador
 */
// Route::middleware(['auth', 'rol:administrador']) ->group(function (){
    Route::resource('categoriaproducto', 'CategoriaProductoController');
    Route::get('categoriaproducto/get/DataTable', 'CategoriaProductoController@getDataTable');
    

    Route::resource('cliente', 'ClienteController');
    Route::get('cliente/get/DataTable', 'ClienteController@getDataTable');
    // Route::resource('producto', 'ProductoController');
    Route::resource('pedido', 'PedidoController');
    Route::get('pedido/get/DataTable', 'PedidoController@getDataTable');
    Route::resource('promocion', 'PromocionController');
// });

/**
 * middleware para los que estan autentificados y que tienen el rol vendedor
 */
// Route::middleware(['auth', 'rol:vendedor']) ->group(function (){
    Route::resource('venta', 'VentaController');
    Route::get('venta/get/DataTable', 'VentaController@getDataTable');
    Route::post('cliente/searchByCi', 'ClienteController@searchByCi');
    
// });

/**
 * middleware para los qu estan autentificados y que tienen el rol panadero
 */
// Route::middleware(['auth', 'rol:panadero']) ->group(function (){
    Route::resource('preparado', 'PreparadoController');
// });