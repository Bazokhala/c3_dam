import 'package:cliente_eventos/services/firestore_service.dart';
import 'package:flutter/material.dart';

class AgregarNoticiasPage extends StatefulWidget {
  const AgregarNoticiasPage({super.key});

  @override
  State<AgregarNoticiasPage> createState() => _AgregarNoticiasPageState();
}

class _AgregarNoticiasPageState extends State<AgregarNoticiasPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregado de Noticias'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoTitulo(),
              campoDescripcion(),
              Container(
                child: ElevatedButton(
                  child: Text('Agregar'),
                  onPressed: (() {
                    FirestoreService().agregar(
                      tituloCtrl.text.trim(),
                      descripcionCtrl.text.trim(),
                    );
                    Navigator.pop(context);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoTitulo() {
    return TextFormField(
      controller: tituloCtrl,
      decoration: InputDecoration(
        labelText: 'Titulo',
        hintText: 'Agrege el Titulo de la Noticia',
      ),
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      controller: descripcionCtrl,
      decoration: InputDecoration(
        labelText: 'Descripcion',
        hintText: 'Agrege una descripcion a la Noticia',
      ),
    );
  }
}
