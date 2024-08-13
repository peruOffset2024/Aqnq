import 'package:flutter/material.dart';

import 'package:geo_loc/views/Pruebas/providers/nombreProvider.dart';
import 'package:provider/provider.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User perfil'),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(' Ingrese nsu nombre'),
          TextField(
            onChanged: (value) {
             context.read<NombreProvider>().updateName(value);
              },
            decoration: InputDecoration(border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(10)
            ))
          ),
          SizedBox(height: 20,),
          const Text('Hola'),
          Text(context.watch<NombreProvider>().nombre)
        ],

      )
      )
      
      ,
    );
  }
}