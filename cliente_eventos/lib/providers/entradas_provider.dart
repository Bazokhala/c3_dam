import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EntradasProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  //Obtencion de todas las Entradas
  Future<List<dynamic>> getEntradas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/entradas'));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Obtencion de un Evento
  Future<LinkedHashMap<String, dynamic>> getEvento(String cod_evento) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/eventos/' + cod_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  //Agregado de un Evento
  Future<LinkedHashMap<String, dynamic>> agregar(
    int id,
    String codigo_evento,
    DateTime fecha,
    String metodo_pago,
  ) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/entradas'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'codigo_evento': codigo_evento,
        'fecha_compra': fecha,
      }),
    );
    return json.decode(respuesta.body);
  }
}
