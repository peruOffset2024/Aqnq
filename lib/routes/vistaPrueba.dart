import 'package:flutter/material.dart';
import 'package:geo_loc/providers/get_api_provider.dart';
import 'package:provider/provider.dart';


class VistaPrueba extends StatelessWidget {
  const VistaPrueba({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Fetch Example'),
      ),
      body: Center(
        child: dataProvider.isLoading
            ? const CircularProgressIndicator()
            : dataProvider.errorMessage != null
                ? Text('Error: ${dataProvider.errorMessage}')
                : ListView.builder(
                    itemCount: dataProvider.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(dataProvider.items[index]),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvider.fetchData();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
