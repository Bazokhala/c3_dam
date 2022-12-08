import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class EventosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  //Obtencion de todos los Eventos
  Future<List<dynamic>> getNoticias() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/evento'));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Agregado de un Evento
  Future<LinkedHashMap<String, dynamic>> agregar(
    String cod_evento,
    String nombre,
    DateTime fecha,
    String estado,
    String lugar,
    Int precio,
    int stock,
  ) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/evento'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento,
        'nombre': nombre,
        'fecha_evento': fecha,
        'estado_evento': estado,
        'lugar_evento': lugar,
        'precio_entrada': precio,
        'stock_entradas': stock,
      }),
    );
    return json.decode(respuesta.body);
  }

  //Borrado de Evento
  Future<bool> borrar(String cod_evento) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/evento/' + cod_evento));
    return respuesta.statusCode == 200;
  }

  //Obtencion de 1 noticia en particular
  Future<LinkedHashMap<String, dynamic>> getNoticia(String cod_evento) async {
    var respuesta = await http.get(Uri.parse(apiURL + '/evento/' + cod_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  //Edicion de un Evento
  Future<LinkedHashMap<String, dynamic>> editar(
    String cod_evento_actual,
    String cod_evento_nuevo,
    String nombre,
    DateTime fecha,
    String estado,
    String lugar,
    Int precio,
    int stock,
  ) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/evento/' + cod_evento_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento_nuevo,
        'nombre': nombre,
        'fecha_evento': fecha,
        'estado_evento': estado,
        'lugar_evento': lugar,
        'precio_entrada': precio,
        'stock_entradas': stock,
      }),
    );
    return json.decode(respuesta.body);
  }
}
