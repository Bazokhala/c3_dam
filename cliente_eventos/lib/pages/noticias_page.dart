import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/firestore_service.dart';
import 'agregar_noticias_page.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD80100),
        leading: Icon(FontAwesomeIcons.newspaper),
        title: Text('Noticias que te Importan'),
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
      body: StreamBuilder(
        stream: FirestoreService().noticias(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //Aca ta
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noticias = snapshot.data!.docs[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.fortAwesomeAlt),
                title: Text(noticias['titulo']),
                subtitle: Text(noticias['descripcion']),
                trailing: ElevatedButton(
                  child: Text('Eliminar'),
                  onPressed: () {
                    FirestoreService().borrar(noticias.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: ((context) => AgregarNoticiasPage()),
          );
          Navigator.push(context, route);
        },
      ),
    );
  }
}
