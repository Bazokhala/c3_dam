<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEvento extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evento', function (Blueprint $table) {
            //$table->id();
            //$table->timestamps();
            $table->string('cod_evento',5)->primary();
            $table->string('nombre',50);
            $table->dateTime('fecha_evento');
            $table->string('estado_evento');
            $table->string('lugar_evento');
            $table->unsignedInteger('precio_entrada');
            $table->smallInteger('stock_entradas');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('evento');
    }
}
