<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Cliente extends Authenticatable
{
    use Notifiable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cliente';

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
    protected $fillable = ['user_id', 'nombre', 'ci', 'tipo'];

    public function venta()
    {
        return $this->hasMany('App\Venta', 'cliente_id');
    }

    public function pedido()
    {
        return $this->hasMany('App\Pedido', 'cliente_id');
    }

    public function user()
    {
        return $this->hasOne('App\User', 'id', 'user_id');
    }  

}
