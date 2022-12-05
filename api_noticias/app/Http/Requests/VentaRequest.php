<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VentaRequest extends FormRequest
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
        'code_evento'=>'required|max:5|unique:ventas,code_evento',
        'entrada_id'=> 'required|numeric|unique:ventas,entrada_id',
        'venta_id'=> 'required|numeric|unique:ventas,venta_id',
        'cantidad'=> 'required|numeric|gte:0',
        'fecha_compra'=>'required|date',
        'metodo_pago'=>'required|max:20|alpha',
        ];
    }
    public function messages(){
        return[
            'fecha_compra.required'=>'La fecha de compra es obligatoria',
            'fecha_compra.date'=>'El formato de la fecha de compra no es compatible',
            'metodo_pago.required'=>'El metodo de pago es obligatorio',
            'metodo_pago.max'=>'El metodo de pago debe ser de largo máximo 20',
            'metodo_pago.alpha'=>'El metodo de pago debe ser solo caracteres',
            'code_evento.required'=>'Indique el código del evento',
            'code_evento.max'=>'El largo del código sale de los parametros esperados',
            'code_evento.unique'=>'El código del evento debe ser único',
            'entrada_id.required'=>'Indique el id de la entrada',
            'entrada_id.unique'=>'El id de la entrada de la entrada debe ser único',
            'entrada_id.numeric'=>'El id de la entrada solo debe ser númerico',
            'venta_id.required'=>'El id de la venta es obligatorio',
            'venta_id.numeric'=>'El id de la venta debe ser númerico',
            'venta_id.unique'=>'El id de la venta debe ser unico',
            'cantidad.required'=>'La cantidad de entradas compradas es obligatoria',
            'cantidad.numeric'=>'El valor ingresado en cantidad debe ser númerico',
            'cantidad.gte'=>'La cantidad de entradas compradas debe ser mayor a 0',
            
        ];
    }
}
