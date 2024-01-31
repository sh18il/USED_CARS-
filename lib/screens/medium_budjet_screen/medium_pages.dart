import 'dart:io';

import 'package:flutter/material.dart';

import 'package:used_caer/functions/medium_functions.dart';
import 'package:used_caer/model/medium_cars_model.dart';
import 'package:used_caer/screens/medium_budjet_screen/medium_add_screen.dart';
import 'package:used_caer/screens/medium_budjet_screen/medium_edit.dart';
import 'package:used_caer/screens/medium_budjet_screen/view_medium_screen.dart';

class Midium_cars extends StatelessWidget {
  const Midium_cars({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCarsm();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text('MEDIUM CARS')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: Icon(Icons.add_to_photos_outlined),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MediumAddScreen()));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsMediumListNotifier,
              builder: (context, value, child) {
                List<MediumCarsModel> carsList = value;

                return ListView.separated(
                  itemBuilder: (context, index) {
                    MediumCarsModel carm = carsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MediumViewScreen(
                                  name: carm.name,
                                  model: carm.model,
                                  km: carm.km,
                                  index: index,
                                  dlnbr: carm.dlnumber,
                                  owner: carm.owner,
                                  price: carm.price,
                                  future: carm.future,
                                  imagepath: carm.image)));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(carm.name),
                                  Text(carm.dlnumber),
                                  Container(
                                    width: 150,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: carm.image != null
                                            ? FileImage(File(carm.image!))
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
                                                      deletCarsm(index);
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
                                                        MediumEditScreen(
                                                            name: carm.name,
                                                            model: carm.model,
                                                            km: carm.km,
                                                            index: index,
                                                            dlnbr:
                                                                carm.dlnumber,
                                                            owner: carm.owner,
                                                            price: carm.price,
                                                            future: carm.future,
                                                            imagepath:
                                                                carm.image)));
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