<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'venta';

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
    protected $fillable = ['cliente_id', 'users_id', 'fecha', 'total', 'descuento', 'total_importe', 'estado'];

    public function cliente()
    {
        return $this->hasOne('App\Cliente', 'id', 'cliente_id');
    }

    public function user()
    {
        return $this->hasOne('App\User', 'id', 'users_id');
    }

    public function detalle_venta()
    {
        return $this->hasMany('App\DetalleVenta', 'venta_id');
    }

    public function getDia()
    {
        return $this->where('fecha', '=', date('Y-m-d'))->sum('total_importe');
    }

    public function getMes()
    {
        $ventas = $this->select('fecha', 'total_importe')->get();
        $total = 0;
        foreach ($ventas as $key => $venta) {
            if (date('Y-m', strtotime($venta->fecha)) == date('Y-m')) {
                $total += $venta->total_importe;
            }
        }
        return $total;
    }

    public function getAño()
    {
        $ventas = $this->select('fecha', 'total_importe')->get();
        $total = 0;
        foreach ($ventas as $key => $venta) {
            if (date('Y', strtotime($venta->fecha)) == date('Y')) {
                $total += $venta->total_importe;
            }
        }
        return $total;
    }
}
