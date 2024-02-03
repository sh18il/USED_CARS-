import 'dart:io';

import 'package:flutter/material.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/model/cars_model.dart';

import 'package:used_caer/screens/editscreen_luxury.dart';
import 'package:used_caer/screens/view_luxuy_screen.dart';

class Luxury_cars_Screen extends StatefulWidget {
  const Luxury_cars_Screen({Key? key}) : super(key: key);

  @override
  State<Luxury_cars_Screen> createState() => _Luxury_cars_ScreenState();
}

class _Luxury_cars_ScreenState extends State<Luxury_cars_Screen> {
  String search = "";
  List<CarsModel> searchedList = [];

  void searchListUpdate() {
    getAllCars();
    searchedList = carsListNotifier.value
        .where((CarsModel) =>
            CarsModel.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    searchListUpdate();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 90, 72, 72),
        title: SizedBox(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  search = value;
                  searchListUpdate();
                  print(value);
                });
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search Luxury cars',
                  suffixIcon: Icon(Icons.qr_code_scanner)),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsListNotifier,
              builder: (BuildContext ctx, List<CarsModel> studentList,
                  Widget? child) {
                return search.isNotEmpty
                    ? searchedList.isEmpty
                        ? Center(child: Text('No results found'))
                        : buildCArList(searchedList)
                    : buildCArList(searchedList);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCArList(List<CarsModel> carsList) {
    return carsList.isEmpty
        ? Center(
            child: Text('No cars available'),
          )
        : ListView.separated(
            itemCount: carsList.length,
            itemBuilder: (context, index) {
              CarsModel car = carsList[index];
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewLuxuryScreen(
                            name: car.name,
                            model: car.model,
                            km: car.km,
                            index: index,
                            dlnbr: car.dlnumber,
                            owner: car.owner,
                            price: car.price,
                            future: car.future,
                            imagepath: car.image)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(car.name),
                            Text(car.dlnumber),
                            Container(
                              width: 150,
                              height: 130,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: car.image != null
                                      ? FileImage(File(car.image!))
                                      : const AssetImage("image/carr1.png")
                                          as ImageProvider,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Confirm Deletion'),
                                          content: Text(
                                              'Are you sure you want to delete this car?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deletCarsL(index);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditLuxury_Screen(
                                                    name: car.name,
                                                    model: car.model,
                                                    km: car.km,
                                                    index: index,
                                                    dlnbr: car.dlnumber,
                                                    owner: car.owner,
                                                    price: car.price,
                                                    future: car.future,
                                                    imagepath: car.image ?? "",
                                                  )));
                                    },
                                    icon: Icon(Icons.edit_document)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Colors.white,
                ),
              );
            },
          );
  }
}
