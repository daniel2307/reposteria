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

    public function promocionOff()
    {
        $promociones = $this->where("estado", "vigente")->get();
        $fecha_hoy = date("Y-m-d");
        $hora_hoy = date("H:i:s");
        foreach ($promociones as $key => $promocion) {
            if ($promocion->fecha_fin < $fecha_hoy) {
                $this->actualizar($promocion->id, "expirado");
                
            } elseif ($promocion->fecha_fin == $fecha_hoy) {
                if ($promocion->hora_fin <= $hora_hoy) {
                    $this->actualizar($promocion->id, "expirado");
                }
            }
        }
    }

    public function promocionOn()
    {
        $promociones = $this->where("estado", "espera")->get();
        $fecha_hoy = date("Y-m-d");
        $hora_hoy = date("H:i:s");
        foreach ($promociones as $key => $promocion) {
            if ($promocion->fecha_inicio < $fecha_hoy) {
                $this->actualizar($promocion->id, "vigente");
                echo $promocion->fecha_inicio ." < ". $fecha_hoy;
            } elseif ($promocion->fecha_inicio == $fecha_hoy) {
                if ($promocion->hora_inicio <= $hora_hoy) {
                    $this->actualizar($promocion->id, "vigente");
                    echo $promocion->fecha_inicio ." == ". $fecha_hoy;
                }
            }
            echo "llego a promotion on";
        }
    }

    private function actualizar($id, $estado)
    {
        $promo = $this->where("id", $id)->first();
        $promo->estado = $estado;
        $promo->save();
    }
}
