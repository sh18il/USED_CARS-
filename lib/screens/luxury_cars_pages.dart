import 'dart:io';

import 'package:flutter/material.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/screens/add_screen.dart';
import 'package:used_caer/screens/editscreen_luxury.dart';
import 'package:used_caer/screens/view_luxuy_screen.dart';

class Luxury_cars_Screen extends StatefulWidget {
  const Luxury_cars_Screen({Key? key}) : super(key: key);

  @override
  State<Luxury_cars_Screen> createState() => _Luxury_cars_ScreenState();
}

class _Luxury_cars_ScreenState extends State<Luxury_cars_Screen> {
  @override
  Widget build(BuildContext context) {
    getAllCars();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text('LUXURY CARS')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: Icon(Icons.add_to_photos_outlined),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddScrees()));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsListNotifier,
              builder: (context, value, child) {
                List<CarsModel> carsList = value;

                return ListView.separated(
                  itemBuilder: (context, index) {
                    CarsModel car = carsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(car.name),
                                  Text(car.dlnumber),
                                  Container(
                                    width: 150,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: car.image != null
                                            ? FileImage(File(car.image!))
                                            : AssetImage("image/carr1.png")
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
                                                title: const Text(
                                                    'Confirm Deletion'),
                                                content: const Text(
                                                    'Are you sure you want to delete this car?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      deletCarsL(index);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Delete'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
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
                                                          imagepath:
                                                              car.image ?? "",
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
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.white,
                      ),
                    );
                  },
                  itemCount: carsList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
