<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lote extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'lote';

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
    protected $fillable = ['producto_id', 'cantidad', 'fecha', 'estado'];
	
    public $timestamps = false;
}
