import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EntradasProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  //Obtencion de todos los Eventos
  Future<List<dynamic>> getEntradas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/entradas'));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
