<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Evento extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'evento';
    protected $primaryKey = 'cod_evento';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
    //protected $hidden = 'entradasConPivot';

    //public function entradasConPivot(){
     //   return $this->belongsTo(Entrada::class,'ventas','code_evento,entrada_id,venta_id')->withPivot('cantidad','precio_venta');;

    //}
}
