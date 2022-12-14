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
           // 'cod_evento.required'=>'Indique el código del evento',
           'id'=>'required|unique:entradas,id|numeric',
           'codigo_evento'=>'required|max:5',
           

        ];
    }

    public function messages(){
        return[

            'id.required'=>'Indique el id de la entrada',
            'id.unique'=>'El id de la entrada debe ser único',
            'id.numeric'=>'El id solo debe ser númerico',
            'codigo_evento.required'=>'El código del evento al que pertenece la entrada debe ser ingresado',
            'codigo_evento.max'=>'El largo del código sale de los parametros esperados',
            
        ];
    }
}
