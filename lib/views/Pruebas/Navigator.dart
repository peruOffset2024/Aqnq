import 'package:flutter/material.dart';
import 'package:geo_loc/views/comentarios.dart';


class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}
  int index = 0;
  List<Widget> rutas = [
    const  Text('bv'),
    MyHomePage3()
  ];


class _NavegadorState extends State<Navegador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rutas[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int indice){
          setState(() {
            index= indice;
          });
        },
        currentIndex: index,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
    );
  }
}