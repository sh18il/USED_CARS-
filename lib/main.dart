import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/model/low_cars_model.dart';
import 'package:used_caer/model/medium_cars_model.dart';


import 'package:hive/hive.dart';
import 'package:used_caer/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CarsModelAdapter().typeId)) {
    Hive.registerAdapter(CarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(MediumCarsModelAdapter().typeId)) {
    Hive.registerAdapter(MediumCarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(LowCarsModelAdapter().typeId)) {
    Hive.registerAdapter(LowCarsModelAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      home: SplashScreen(),
    );
  }
}
