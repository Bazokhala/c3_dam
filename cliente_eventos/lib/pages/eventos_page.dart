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
      ),
      body: FutureBuilder(
        future: EventosProvider().getNoticias(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              var evento = snapshot.data!.docs[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.ticketSimple),
                title: Text(evento['cod_evento'] + ' ' + evento['nombre']),
                subtitle: Row(
                  children: [
                    Text(evento['fecha_evento']),
                    Text(evento['lugar_Evento']),
                  ],
                ),
                trailing: Column(
                  children: [
                    Text(evento['estado_evento']),
                    Text(evento['precio_entrada']),
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
