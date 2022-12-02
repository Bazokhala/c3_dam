<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Evento extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'evento';
    protected $primaryKey = 'cod_Evento';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
}
