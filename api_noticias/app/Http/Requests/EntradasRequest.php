<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EntradasRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
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
           // 'cod_evento.required'=>'Indique el código del evento',
           'id'=>'required|unique:entradas,id|numeric',
           'codigo_evento'=>'required|max:5',
           'fecha_compra'=>'required|date',
           'metodo_pago'=>'required|max:20|alpha',

        ];
    }

    public function messages(){
        return[

            'id.required'=>'Indique el id de la entrada',
            'id.unique'=>'El id de la entrada debe ser único',
            'id.numeric'=>'El id solo debe ser númerico',
            'codigo_evento.required'=>'El código del evento al que pertenece la entrada debe ser ingresado',
            'codigo_evento.max'=>'El largo del código sale de los parametros esperados',
            'fecha_compra.required'=>'La fecha de compra es obligatoria',
            'fecha_compra.date'=>'El formato de la fecha de compra no es compatible',
            'metodo_pago.required'
        ];
    }
}
