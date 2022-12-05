import 'package:cliente_eventos/pages/listado_eventos_page.dart';
import 'package:cliente_eventos/widgets/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          height: 300,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                campoEmail(),
                campoPass(),
                Divider(),
                ElevatedButton(
                  child: Text('Ingresar'),
                  onPressed: (() {}),
                ),
                Divider(),
                Container(
                  child: MaterialButton(
                    onPressed: (() async {
                      User? user = await Authenticator.iniciarSesion(
                        context: context,
                      );
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => ListadoEventosPage(),
                      );
                      print(user?.displayName);
                      Navigator.push(context, route).then((value) {
                        setState(() {});
                      });
                    }),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Icon(FontAwesomeIcons.google),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      controller: emailCtrl,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Ingrese su email',
      ),
    );
  }

  TextFormField campoPass() {
    return TextFormField(
      controller: passCtrl,
      decoration: InputDecoration(
          labelText: 'Contraseña', hintText: 'Ingrese su contraseña'),
      obscureText: true,
    );
  }
}
