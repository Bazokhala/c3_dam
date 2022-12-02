<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVentas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ventas', function (Blueprint $table) {
            // $table->id();
           // $table->timestamps();
           $table->string('code_evento',5);
           $table->unsignedInteger('entrada_id');
           $table->unsignedInteger('venta_id');
           $table->primary(['code_evento','venta_id','entrada_id']);
           
           $table->unsignedSmallInteger('cantidad');
           $table->unsignedInteger('precio_venta');
          
          $table->foreign('code_evento')->references('cod_evento')->on('evento');
          $table->foreign('entrada_id')->references('id')->on('entradas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ventas');
    }
}
