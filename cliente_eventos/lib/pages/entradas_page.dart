import 'package:cliente_eventos/providers/entradas_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntradasPage extends StatefulWidget {
  const EntradasPage({super.key});

  @override
  State<EntradasPage> createState() => _EntradasPageState();
}

class _EntradasPageState extends State<EntradasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas a la Venta'),
      ),
      body: FutureBuilder(
        future: (EntradasProvider().getEntradas()),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: ((context, index) => Divider()),
            itemCount: snapshot.data.length,
            itemBuilder: ((context, index) {
              var entrada = snapshot.data[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.ticket),
                title: Text(entrada['codigo_evento']),
                subtitle: Text(entrada['id'].toString()),
                trailing: Column(
                  children: [
                    Text(entrada['fecha_compra']),
                    Text(entrada['metodo_pago'])
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
