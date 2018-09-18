<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Promocion extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'promocion';

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
    protected $fillable = ['producto_id', 'fecha', 'cantidad', 'precio', 'fecha_inicio', 'fecha_fin', 'hora_inicio', 'hora_fin', 'estado'];

    public function producto()
    {
        return $this->hasOne('App\Producto', 'id', 'producto_id');
    }
}
