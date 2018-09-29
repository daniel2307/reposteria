<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Promocion;
use DB;

class Producto extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'producto';

    /**
    * The database primary key value.
    *
    * @var string
    */
    protected $primaryKey = 'id';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['categoria_producto_id', 'nombre', 'costo', 'cantidad', 'descripcion', 'duracion', 'imagen'];

    public function detalle_venta()
    {
        return $this->hasMany('App\DetalleVenta', 'producto_id');
    }

    public function categoria()
    {
        return $this->hasOne('App\CategoriaProducto', 'id', 'categoria_producto_id');
    }

    public function getProductos()
    {
        $productos = $this->select('producto.id', 'costo', 'cantidad', DB::raw('CONCAT(producto.nombre, " [ ", categoria_producto.nombre, " ]") as producto')) //'producto.nombre', 'categoria_producto.nombre as categoria', 
        ->join('categoria_producto', 'producto.categoria_producto_id', '=', 'categoria_producto.id')
        ->where(['producto.estado' => 'activo'])
        ->orderBy('producto.nombre')
        ->get();
        foreach ($productos as $key => $value) {
            $precio = Promocion::where([
                ['estado', '=', 'vigente'],
                ['producto_id', '=', $value->id],
            ])->value('precio');

            if ($precio) {
                $value->costo = $precio;
            }
        }
        return $productos;
    }
    
    
}
