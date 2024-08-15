import 'package:flutter/material.dart';
import 'package:geo_loc/providers/contador_provider.dart';
import 'package:provider/provider.dart';

class ContadorPag extends StatelessWidget {
  const ContadorPag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Contadores'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ContadorProviders>().SumarContador();
              }, child: const Text('Insertar numero')),
          Expanded(child: Consumer<ContadorProviders>(
              builder: (context, counterProvider, child) {
            return ListView.builder(
                itemCount: counterProvider.counter.length,
                itemBuilder: (context, index) {
                  final counter = counterProvider.counter[index];
                  return ListTile(
                    title: Text('Contador ${index + 1}: ${counter.valor}'),
                    leading: IconButton(
                        onPressed: () {
                          context
                              .read<ContadorProviders>()
                              .disminuirContador(counter);
                        },
                        icon: const Icon(Icons.remove)),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<ContadorProviders>()
                              .imcrementarContador(counter);
                        },
                        icon: Icon(Icons.add)),
                    onLongPress: () {
                      context
                          .read<ContadorProviders>()
                          .eliminarContador(counter);
                    },
                  );
                });
          }))
        ],
      ),
    );
  }
}
