<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistorialCantidad extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'His_cantidad';

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
    protected $fillable = ['cantidad_anterior', 'cantidad_actual', 'fecha', 'hora', 'tipo', 'producto_id'];

    
}
