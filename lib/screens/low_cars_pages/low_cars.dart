import 'dart:io';

import 'package:flutter/material.dart';

import 'package:used_caer/model/low_cars_model.dart';

import 'package:used_caer/screens/low_cars_pages/edit_low_cars.dart';
import 'package:used_caer/screens/low_cars_pages/view_low_cars.dart';

import '../../functions/lowcars_functions.dart';

class Low_Cars extends StatelessWidget {
  const Low_Cars({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCarsll();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(child: Text('LOW CARS')),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black87,
      //   child: Icon(Icons.add_to_photos_outlined),
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => AddLowCars()));
      //   },
      // ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsLowListNotifier,
              builder: (context, value, child) {
                List<LowCarsModel> carsList = value;

                return ListView.separated(
                  itemBuilder: (context, index) {
                    LowCarsModel carlo = carsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewLowCars(
                                    name: carlo.name,
                                    model: carlo.model,
                                    km: carlo.km,
                                    index: index,
                                    dlnbr: carlo.dlnumber,
                                    owner: carlo.owner,
                                    price: carlo.price,
                                    future: carlo.future,
                                    imagepath: carlo.image,
                                  )));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(carlo.name),
                                  Text(carlo.dlnumber),
                                  Container(
                                    width: 150,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: carlo.image != null
                                            ? FileImage(File(carlo.image!))
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
                                                      deletCarsll(index);
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
                                                        EditLowCarScreen(
                                                          name: carlo.name,
                                                          model: carlo.model,
                                                          km: carlo.km,
                                                          index: index,
                                                          dlnbr: carlo.dlnumber,
                                                          owner: carlo.owner,
                                                          price: carlo.price,
                                                          future: carlo.future,
                                                          imagepath:
                                                              carlo.image,
                                                        )));
                                          },
                                          icon: const Icon(Icons.edit_document)),
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
