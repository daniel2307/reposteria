<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetallePedido extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'detalle_pedido';

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
    protected $fillable = ['pedido_id', 'producto_id', 'cantidad', 'subtotal', 'descripcion'];

    public $timestamps = false;

    public function pedido()
    {
        return $this->hasOne('App\Pedido', 'id', 'pedido_id');
    }  
    
    public function producto()
    {
        return $this->hasOne('App\Producto', 'id', 'producto_id');
    } 
}

