<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('_eventos', function (Blueprint $table) {
            //$table->id();
            //$table->timestamps();
            $table->string('cod_evento',5)->primary();
            $table->string('nombre',50);
            $table->dateTime('fecha_evento');
            $table->string('estado_evento');
            $table->integer('precio_entrada');
            $table->integer('cantidad_entradas');
            $table->integer('stock_entradas');
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
        Schema::dropIfExists('_eventos');
    }
}
