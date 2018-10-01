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
    protected $fillable = ['cliente_id', 'fecha', 'fecha_entrega', 'hora_entrega', 'acuenta', 'saldo', 'total', 'descuento', 'total_importe', 'tipo', 'estado', 'forma_de_pago', 'comprobante'];

    public function cliente()
    {
        return $this->hasOne('App\Cliente', 'id', 'cliente_id');
    }

    public function detalle_pedido()
    {
        return $this->hasMany('App\DetallePedido', 'pedido_id');
    }

    public function getDia()
    {
        return $this->where([['fecha_entrega', '=', date('Y-m-d')], ['estado', '=', 'entregado']])->sum('total_importe');
    }

    public function getMes()
    {
        $pedidos = $this->select('fecha_entrega', 'total_importe')->get();
        $total = 0;
        foreach ($pedidos as $key => $pedido) {
            if (date('Y-m', strtotime($pedido->fecha_entrega)) == date('Y-m')) {
                $total += $pedido->total_importe;
            }
        }
        return $total;
    }

    public function getAño()
    {
        $pedidos = $this->select('fecha_entrega', 'total_importe')->get();
        $total = 0;
        foreach ($pedidos as $key => $pedido) {
            if (date('Y', strtotime($pedido->fecha_entrega)) == date('Y')) {
                $total += $pedido->total_importe;
            }
        }
        return $total;
    }
}
