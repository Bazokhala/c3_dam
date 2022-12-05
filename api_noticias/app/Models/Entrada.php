<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminae\Database\Eloquent\SoftDeletes;

class Entrada extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'entrada';
    public $timestamps =false;
}