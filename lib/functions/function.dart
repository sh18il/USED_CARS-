// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:used_caer/model/cars_model.dart';

// ValueNotifier<List<CarsModel>> carsListNotifier = ValueNotifier([]);

// Future<void> addcarsl(CarsModel value) async {
//   final carslDB = await Hive.openBox<CarsModel>('carsl_db');
//   await carslDB.add(value);
//   carsListNotifier.value.add(value);

//   carsListNotifier.notifyListeners();
//   getAllCars();
// }

// Future<void> getAllCars() async {
//   final carslDB = await Hive.openBox<CarsModel>('carsl_db');
//   carsListNotifier.value.clear();
//   carsListNotifier.value.addAll(carslDB.values);
//   carsListNotifier.notifyListeners();
// }

// Future<void> deletCarsL(int index) async {
//   final carslDB = await Hive.openBox<CarsModel>('carsl_db');
//   await carslDB.deleteAt(index);
//   getAllCars();
// }

// Future<void> editCarsL(index, CarsModel value) async {
//   final carslDB = await Hive.openBox<CarsModel>('carsl_db');
//   carsListNotifier.value.clear();
//   carsListNotifier.value.addAll(carslDB.values);

//   carsListNotifier.notifyListeners();
//   carslDB.putAt(index, value);
//   getAllCars();
// }
//.............................................................
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/model/medium_cars_model.dart';
import 'package:used_caer/model/low_cars_model.dart';
import 'package:used_caer/screens/add_screen.dart';

ValueNotifier<List<CarsModel>> carsListNotifier = ValueNotifier([]);
ValueNotifier<List<LowCarsModel>> carsLowListNotifier = ValueNotifier([]);
ValueNotifier<List<MediumCarsModel>> carsMediumListNotifier = ValueNotifier([]);

Future<void> addCar(DataBases type,  value) async {
  final box = await _getBoxForType(type);
  await box.add(value);

  getAllCars(type);
}

Future<void> getAllCars(DataBases type) async {
  final box = await _getBoxForType(type);
  _clearNotifierList(type);
  _addAllToList(type, box.values.toList());
}

Future<void> deleteCar(DataBases type, int index) async {
  final box = await _getBoxForType(type);
  await box.deleteAt(index);

  getAllCars(type);
}

Future<void> editCar(DataBases type, int index, dynamic value) async {
  final box = await _getBoxForType(type);
  await box.putAt(index, value);

  getAllCars(type);
}

Future<Box<dynamic>> _getBoxForType(DataBases type) async {
  switch (type) {
    case DataBases.LowDb:
      return await Hive.openBox<LowCarsModel>('low_cars_db');
    case DataBases.MediumDb:
      return await Hive.openBox<MediumCarsModel>('medium_cars_db');
    case DataBases.LuxuryDb:
      return await Hive.openBox<CarsModel>('luxury_cars_db');
  }
}

void _clearNotifierList(DataBases type) {
  switch (type) {
    case DataBases.LowDb:
      carsLowListNotifier.value.clear();
      carsLowListNotifier.notifyListeners();
      break;
    case DataBases.MediumDb:
      carsMediumListNotifier.value.clear();
      carsMediumListNotifier.notifyListeners();
      break;
    case DataBases.LuxuryDb:
      carsListNotifier.value.clear();
      carsListNotifier.notifyListeners();
      break;
  }
}

void _addAllToList(DataBases type, List<dynamic> values) {
  switch (type) {
    case DataBases.LowDb:
      carsLowListNotifier.value.addAll(values.cast<LowCarsModel>());
      carsLowListNotifier.notifyListeners();
      break;
    case DataBases.MediumDb:
      carsMediumListNotifier.value.addAll(values.cast<MediumCarsModel>());
      carsMediumListNotifier.notifyListeners();
      break;
    case DataBases.LuxuryDb:
      carsListNotifier.value.addAll(values.cast<CarsModel>());
      carsListNotifier.notifyListeners();
      break;
  }
}

class Chartfucntion {
  static double totals = 0;
 
}
class ChartfucntionMe {
 
  static double totalMedi = 0;

}
class ChartfucntionLow {
 
  static double totalLow = 0;
}

