import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:used_caer/model/cars_model.dart';


ValueNotifier<List<CarsModel>> carsListNotifier = ValueNotifier([]);


Future<void> addcarsl(CarsModel value) async {
  final carslDB = await Hive.openBox<CarsModel>('carsl_db');
  await carslDB.add(value);
  carsListNotifier.value.add(value);

  carsListNotifier.notifyListeners();
}

Future<void> getAllCars() async {
  final carslDB = await Hive.openBox<CarsModel>('carsl_db');
  carsListNotifier.value.clear();
  carsListNotifier.value.addAll(carslDB.values);
  carsListNotifier.notifyListeners();
}

Future<void> deletCarsL(int index) async {
  final carslDB = await Hive.openBox<CarsModel>('carsl_db');
  await carslDB.deleteAt(index);
  getAllCars();
}

Future<void> editCarsL(index, CarsModel value) async {
  final carslDB = await Hive.openBox<CarsModel>('carsl_db');
  carsListNotifier.value.clear();
  carsListNotifier.value.addAll(carslDB.values);
  
  carsListNotifier.notifyListeners();
  carslDB.putAt(index, value);
  getAllCars();
}
