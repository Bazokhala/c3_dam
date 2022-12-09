import 'package:cliente_eventos/pages/agregar_eventos_page.dart';
import 'package:cliente_eventos/pages/entradas_page.dart';
import 'package:cliente_eventos/providers/eventos_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({super.key});

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.ticket),
        backgroundColor: Color(0xFF037470),
        title: Text('Eventos'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'carrito',
                child: Text('Carrito'),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text('Cerrar Sesion'),
              ),
            ],
            onSelected: ((opcionSeleccionada) {
              if (opcionSeleccionada == 'logout') {
                //logout(context);
              }
            }),
          )
        ],
      ),
      body: FutureBuilder(
        future: EventosProvider().getEventos(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: ((context, index) {
              var evento = snapshot.data[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.ticketSimple),
                title: Text(evento['cod_evento'] + ' ' + evento['nombre']),
                subtitle: Row(
                  children: [
                    Text(evento['fecha_evento']),
                    Text(evento['lugar_evento']),
                  ],
                ),
                trailing: Column(
                  children: [
                    Text(evento['estado_evento']),
                    Text('\$' + evento['precio_entrada'].toString()),
                  ],
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) {
                      return EntradasPage();
                    },
                  );
                  Navigator.push(context, route);
                },
                onLongPress: () async {
                  confirmDialog(context, evento['nombre']).then(
                    (confirma) {
                      if (confirma) {
                        EventosProvider().borrar(evento['cod_evento']).then(
                          (fueBorrado) {
                            if (fueBorrado) {
                              snapshot.data.removeAt(index);
                              setState(() {});
                            }
                          },
                        );
                      }
                    },
                  );
                },
              );
            }),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: ((context) => AgregarEventosPage()),
          );
          Navigator.push(context, route);
        },
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Accionar con el Evento'),
          content: Text('¿Que desea hacer con $evento?'),
          actions: [
            Container(
              color: Colors.red,
              child: TextButton(
                child: Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
            ),
            TextButton(
              child: Text('Editar'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('Atras'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        );
      },
    );
  }
}
