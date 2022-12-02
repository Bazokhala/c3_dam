import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                campoEmail(),
                campoPass(),
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
