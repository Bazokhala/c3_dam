import 'package:cliente_eventos/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: Icon(FontAwesomeIcons.newspaper),
        title: Text('Eventos Masivos'),
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
                leading: Icon(FontAwesomeIcons.hackerNews),
                title: Text(noticias['titulo']),
                subtitle: Text(noticias['descripcion']),
              );
            },
          );
        },
      ),
    );
  }
}
