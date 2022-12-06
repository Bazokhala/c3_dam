<?php

namespace App\Http\Controllers;

use App\Models\Venta;
use Illuminate\Http\Request;
use App\Http\Requests\VentaRequest;

class VentasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Venta::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(VentaRequest $request)
    {
        //
        $venta = new Venta();
        $venta->code_evento->$request->code_evento;
        $venta->entrada_id->$request->entrada_id;
        $venta->venta_id->$request->venta_id;
        $venta->cantidad->$request->cantidad;
        $venta->fecha_compra->$request->fecha_compra;
        $venta->metodo_pago->$request->metodo_pago;
        $venta->save();
        return $venta;

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function show(Venta $venta)
    {
        //
        return $venta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function update(VentaRequest $request, Venta $venta)
    {
        //
        $venta->code_evento->$request->code_evento;
        $venta->entrada_id->$request->entrada_id;
        $venta->venta_id->$request->venta_id;
        $venta->cantidad->$request->cantidad;
        $venta->fecha_compra->$request->fecha_compra;
        $venta->metodo_pago->$request->metodo_pago;
        $venta->save();
        return $venta;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Venta $venta)
    {
        //
        $venta->delete();
    }
}
