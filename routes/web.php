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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
/**
 * middleware para los que estan autentificados
 */
// Route::middleware(['auth']) ->group(function (){
//     Route::resource('admin/producto', 'ProductoController');
// });
Route::resource('admin/producto', 'ProductoController');
Route::get('producto/getDataTable', 'ProductoController@getDataTable');

/**
 * middleware para los qu estan autentificados y que tienen el rol adminsitrador
 */
// Route::middleware(['auth', 'rol:administrador']) ->group(function (){
    Route::resource('admin/categoriaproducto', 'CategoriaProductoController');
    Route::get('categoriaproducto/getDataTable', 'CategoriaProductoController@getDataTable');
    

    Route::resource('admin/cliente', 'ClienteController');
    Route::get('cliente/getDataTable', 'ClienteController@getDataTable');
    // Route::resource('admin/producto', 'ProductoController');
    Route::resource('admin/pedido', 'PedidoController');
    Route::resource('admin/promocion', 'PromocionController');
// });

/**
 * middleware para los que estan autentificados y que tienen el rol vendedor
 */
// Route::middleware(['auth', 'rol:vendedor']) ->group(function (){
    Route::resource('admin/venta', 'VentaController');
    Route::post('admin/cliente/searchByCi', 'ClienteController@searchByCi');
    
// });

/**
 * middleware para los qu estan autentificados y que tienen el rol panadero
 */
// Route::middleware(['auth', 'rol:panadero']) ->group(function (){
    Route::resource('admin/preparado', 'PreparadoController');
// });