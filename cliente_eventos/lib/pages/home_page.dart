import 'package:cliente_eventos/pages/eventos_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'noticias_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSel = 0;
  final paginas = [NoticiasPage(), EventosPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[paginaSel],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: paginaSel,
        onTap: ((index) {
          setState(() {
            paginaSel = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'Noticias',
            backgroundColor: Color(0xFFD80100),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ticket),
            label: 'Eventos',
            backgroundColor: Color(0xFF037470),
          ),
        ],
      ),
    );
  }
}
