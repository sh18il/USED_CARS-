import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:used_caer/model/low_cars_model.dart';

ValueNotifier<List<LowCarsModel>> carsLowListNotifier = ValueNotifier([]);

Future<void> addcarslow(LowCarsModel value) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsLow_db');
  await carslDB.add(value);
  carsLowListNotifier.value.add(value);

  carsLowListNotifier.notifyListeners();
}

Future<void> getAllCarslow() async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsLow_db');
  carsLowListNotifier.value.clear();
  carsLowListNotifier.value.addAll(carslDB.values);
  carsLowListNotifier.notifyListeners();
}

Future<void> deletCarslow(int index) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsLow_db');
  await carslDB.deleteAt(index);
  getAllCarslow();
}

Future<void> editCarslow(index, LowCarsModel value) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsLow_db');
  carsLowListNotifier.value.clear();
  carsLowListNotifier.value.addAll(carslDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  carsLowListNotifier.notifyListeners();
  carslDB.putAt(index, value);
  getAllCarslow();
}