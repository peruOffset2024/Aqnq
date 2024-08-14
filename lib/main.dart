import 'package:flutter/material.dart';
import 'package:geo_loc/app/app.dart';
import 'package:geo_loc/providers/LocationProvider.dart';
import 'package:geo_loc/providers/get_api_provider.dart';
import 'package:geo_loc/views/Pruebas/providers/Auth_provider.dart';
import 'package:geo_loc/views/Pruebas/providers/nombreProvider.dart';
import 'package:geo_loc/views/Pruebas/providers/provider_counter.dart';
import 'package:geo_loc/views/Pruebas/providers/task_provider.dart';
import 'package:geo_loc/views/Pruebas/providers/tiempo_real.dart';
import 'package:geo_loc/views/Pruebas/providers/ubicacionProvider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> LocationProvider(),),
    ChangeNotifierProvider(create: (_)=> CounterProvider()),  
    ChangeNotifierProvider(create: (_)=> NombreProvider()),
    ChangeNotifierProvider(create: (_)=> TaskProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()), 
    ChangeNotifierProvider(create: (context) => DataProvider()),
    ChangeNotifierProvider(create: (context) => LocationUbiProvider()),  
    ChangeNotifierProvider(create: (context) => LocProvider()),

    
  ],
  child: const MyApp()));
}




