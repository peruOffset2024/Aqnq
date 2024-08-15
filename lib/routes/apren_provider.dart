import 'package:flutter/material.dart';
import 'package:geo_loc/providers/nombre_provider.dart';
import 'package:provider/provider.dart';

class NombreNuevo extends StatelessWidget {
  const NombreNuevo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Nombre Actual'),
            Text(
              context.watch<NombreNuevoProvider>().nombre,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<NombreNuevoProvider>().actualizarNombre('Eddy');
                },
                child: const Text('Cambiar Nombre')),
            const SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (value) {
                context.read<NombreNuevoProvider>().actualizarNombre(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Ingrese el una palabra'
              ),
            ),
            const SizedBox(
              height: 50,
            ),
              Text('Lo escrito: ${context.watch<NombreNuevoProvider>().nombre}')

          ],
        ),
      ),
    );
  }
}
