<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Entrada extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'entradas';
    public $timestamps =false;
    protected $hidden = 'eventosConPivot';

    public function eventosConPivot(){
        return $this->hasMany(Evento::class,'ventas','code_evento,entrada_id,venta_id')->withPivot('cantidad','precio_venta');;

    }
}
