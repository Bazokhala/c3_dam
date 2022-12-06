<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMetodoFecha extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('entradas', function (Blueprint $table) {
            //
            $table->dateTime('fecha_compra');
            $table->string('metodo_pago',20);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('entradas', function (Blueprint $table) {
            //
        });
    }
}
