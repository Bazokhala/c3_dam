<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use Illuminate\Http\Request;
use App\Http\Requests\EventosRequest;

class EventosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Evento::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EventosRequest $request)
    {
        //
        $evento = new Evento();
        $evento->cod_evento = $request->cod_evento;
        $evento->nombre=$request->nombre;
        $evento->fecha_evento=$request->fecha_evento;
        $evento->estado_evento=$request->estado_evento;
        $evento->lugar_evento=$request->lugar_evento;
        $evento->precio_entrada=$request->precio_entrada;
        $evento->stock_entradas=$request->stock_entradas;
        $evento->save();
        return $evento;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function show(Evento $evento)
    {
        //
        return $evento;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Evento $evento)
    {
        //
        $evento->cod_evento = $request->cod_evento;
        $evento->nombre=$request->nombre;
        $evento->fecha_evento=$request->fecha_evento;
        $evento->estado_evento=$request->estado_evento;
        $evento->lugar_evento=$request->lugar_evento;
        $evento->precio_entrada=$request->precio_entrada;
        $evento->stock_entradas=$request->stock_entradas;
        $evento->save();
        return $evento;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function destroy(Evento $evento)
    {
        //
        $evento->delete();
    }
}
