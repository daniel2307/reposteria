<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'pedido';

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
    protected $fillable = ['cliente_id', 'fecha', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total', 'descuento', 'total_importe', 'iva', 'tipo', 'estado', 'forma_de_pago', 'comprobante'];

    
}
