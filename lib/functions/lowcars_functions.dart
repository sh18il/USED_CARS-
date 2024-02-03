import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:used_caer/model/low_cars_model.dart';

ValueNotifier<List<LowCarsModel>> carsLowListNotifier = ValueNotifier([]);

Future<void> addcarsll(LowCarsModel value) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsll_db');
  await carslDB.add(value);
  carsLowListNotifier.value.add(value);

  carsLowListNotifier.notifyListeners();
}

Future<void> getAllCarsll() async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsll_db');
  carsLowListNotifier.value.clear();
  carsLowListNotifier.value.addAll(carslDB.values);
  carsLowListNotifier.notifyListeners();
}

Future<void> deletCarsll(int index) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsll_db');
  await carslDB.deleteAt(index);
  getAllCarsll();
}

Future<void> editCarsll(index, LowCarsModel value) async {
  final carslDB = await Hive.openBox<LowCarsModel>('carsll_db');
  carsLowListNotifier.value.clear();
  carsLowListNotifier.value.addAll(carslDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  carsLowListNotifier.notifyListeners();
  carslDB.putAt(index, value);
  getAllCarsll();
}
 