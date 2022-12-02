<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EventoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'cod_evento'=>'required|min:5|unique:evento,cod_evento',
            'nombre'=>'required',
            'fecha_evento'=>'required',
            'estado_evento'=>'required|alpha',
            'precio_entrada'=>'required|numeric|gte:0',
            'stock_entradas'=>'required|numeric|gte:0',

        ];
    }
    public function messages(){
        return[
            'cod_evento.required'=>'Indique el código del evento',
            'cod_evento.man'=>'El largo del código sale de los parametros esperados',
            'cod_evento.unique'=>'El código del evento debe ser único',
            'nombre.required'=>'El nombre del evento es obligatorio',
            'fecha_evento.required'=>'La fecha del evento es obligatoria',
            'estado_evento.required'=>'El estado del evento es obligatorio',
            'estado_evento.alpha'=>'El estado del evento solo acepta letras',
            'precio_entrada.required'=>'El precio de entrada es obligatorio',
            'precio_entrada.numeric'=>'Solo se aceptan números para precio',
            'precio_entrada.gte'=>'El precio debe ser mayor a 0',
            'stock_entradas.required'=>'El stock de entradas es necesario',
            'stock_entradas.numeric'=>'El stock de entrada debe ser númerico',
            'stock_entradas.gte'=>'El stock de entrada debe ser mayor a 0',
        ];
    }
}
