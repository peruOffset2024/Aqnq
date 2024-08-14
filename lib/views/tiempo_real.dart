import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RealTimeLocation extends StatefulWidget {
  const RealTimeLocation({super.key});

  @override
  _RealTimeLocationState createState() => _RealTimeLocationState();
}

class _RealTimeLocationState extends State<RealTimeLocation> {
  Position? _currentPosition;
  late Stream<Position> _positionStream;

  @override
  void initState() {
    super.initState();

    // Obtén el flujo de ubicación en tiempo real
    _positionStream = Geolocator.getPositionStream();

    // Suscríbete a las actualizaciones de la ubicación
    _positionStream.listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación en Tiempo Real'),
      ),
      body: Center(
        child: _currentPosition == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Latitud: ${_currentPosition!.latitude}'),
                  Text('Longitud: ${_currentPosition!.longitude}'),
                ],
              ),
      ),
    );
  }
}


