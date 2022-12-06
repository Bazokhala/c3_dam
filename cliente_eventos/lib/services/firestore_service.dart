import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Obtener Noticias
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
  }

  //Agregar noticias
  Future agregar(String titulo, String descripcion) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'titulo': titulo,
      'descripcion': descripcion,
    });
  }

  //Borrado
  Future borrar(String tituloId) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(tituloId)
        .delete();
  }
}
