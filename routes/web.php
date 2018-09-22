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
Auth::routes();

Route::middleware(['auth'])->group(function (){

    Route::get('/', 'HomeController@index');
    Route::get('/home', 'HomeController@index')->name('home');

    Route::middleware(['rol:administrador'])->group(function (){
        Route::resource('producto', 'ProductoController');
        Route::get('producto/get/DataTable', 'ProductoController@getDataTable');

        Route::resource('users', 'UserController');
        Route::get('users/get/DataTable', 'UserController@getDataTable');

        Route::resource('categoriaproducto', 'CategoriaProductoController');
        Route::get('categoriaproducto/get/DataTable', 'CategoriaProductoController@getDataTable');

        Route::resource('promocion', 'PromocionController');
        Route::post('promocion/expirado', 'PromocionController@setEstado');
        Route::get('promocion/get/DataTable', 'PromocionController@getDataTable');

        Route::resource('update-stock', 'LoteController');
        Route::get('update-stock/get/DataTable', 'LoteController@getDataTable');   
    });

    Route::resource('venta', 'VentaController');
    Route::get('venta/get/DataTable', 'VentaController@getDataTable');

    Route::get('pedido-pendiente', 'PedidoController@getPendientes');
    Route::post('pedido-pendiente', 'PedidoController@updatePendiente');
    Route::get('pedido/get/DataTable', 'PedidoController@getDataTable');
    Route::get('pedido/get/DataTablePendiente', 'PedidoController@getDataTablePendiente');

    Route::middleware(['rol:vendedor'])->group(function (){
        Route::resource('cliente', 'ClienteController');
        Route::get('cliente/get/DataTable', 'ClienteController@getDataTable');
        Route::post('cliente/searchByCi', 'ClienteController@searchByCi');

        Route::resource('venta', 'VentaController');
        Route::get('venta/get/DataTable', 'VentaController@getDataTable');

        Route::resource('pedido', 'PedidoController');
        
    });    

    Route::resource('preparado', 'PreparadoController');
});

/**
 * middleware para los qu estan autentificados y que tienen el rol adminsitrador
 */


/**
 * middleware para los que estan autentificados y que tienen el rol vendedor
 */


/**
 * middleware para los qu estan autentificados y que tienen el rol panadero
 */
