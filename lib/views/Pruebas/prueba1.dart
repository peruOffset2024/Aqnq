import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/providers/provider_counter.dart';
import 'package:provider/provider.dart';

class Prueba1 extends StatelessWidget {
  const Prueba1({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('presionar el boton'),
            
             Text('${context.watch<CounterProvider>().count}',
            style: TextStyle(fontWeight: FontWeight.bold)
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: context.read<CounterProvider>().increment,
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
          ),
          FloatingActionButton(onPressed: context.read<CounterProvider>().decrement,
          tooltip: 'Disminuir',
          child: Icon(Icons.minimize_rounded),
          )
        ],
      ),
    );
  }
}
