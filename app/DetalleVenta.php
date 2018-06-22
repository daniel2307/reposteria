<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetalleVenta extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'detalle_venta';

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
    protected $fillable = ['cantidad', 'subtotal', 'venta_id', 'producto_id'];
	
    public $timestamps = false;
    
    public function venta()
    {
        return $this->hasOne('App\Venta', 'id', 'venta_id');
    }  
    
    public function producto()
    {
        return $this->hasOne('App\Producto', 'id', 'producto_id');
    } 
}
