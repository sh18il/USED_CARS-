// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import 'package:used_caer/model/medium_cars_model.dart';

// ValueNotifier<List<MediumCarsModel>> carsMediumListNotifier = ValueNotifier([]);

// Future<void> addcarsm(MediumCarsModel value) async {
//   final carslDB = await Hive.openBox<MediumCarsModel>('carsm_db');
//   await carslDB.add(value);
//   carsMediumListNotifier.value.add(value);

//   carsMediumListNotifier.notifyListeners();
// }

// Future<void> getAllCarsm() async {
//   final carslDB = await Hive.openBox<MediumCarsModel>('carsm_db');
//   carsMediumListNotifier.value.clear();
//   carsMediumListNotifier.value.addAll(carslDB.values);
//   carsMediumListNotifier.notifyListeners();
// }

// Future<void> deletCarsm(int index) async {
//   final carslDB = await Hive.openBox<MediumCarsModel>('carsm_db');
//   await carslDB.deleteAt(index);
//   getAllCarsm();
// }

// Future<void> editCarsm(index, MediumCarsModel value) async {
//   final carslDB = await Hive.openBox<MediumCarsModel>('carsm_db');
//   carsMediumListNotifier.value.clear();
//   carsMediumListNotifier.value.addAll(carslDB.values);
//   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//   carsMediumListNotifier.notifyListeners();
//   carslDB.putAt(index, value);
//   getAllCarsm();
// }
