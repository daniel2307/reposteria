<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Preparado extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'preparado';

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
    protected $fillable = ['fecha', 'hora', 'vencimiento', 'cantidad', 'producto_id', 'pedido_id', 'users_id'];

    
}
