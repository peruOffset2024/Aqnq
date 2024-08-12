import 'package:flutter/material.dart';

class MyHomePage2 extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MyHomePage2({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ubicación Actual',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Latitude: $latitude',
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Longitude: $longitude',
                ),
              ],
            ),
            const SizedBox(
                  height: 20,
                ),
            const Placeholder(
              color: Colors.red,
              strokeWidth: 2,
              child: Text('Contenido'),
              )
          ],
        ),
      ),
    );
  }
}
