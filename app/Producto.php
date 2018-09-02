<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

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
    
}
