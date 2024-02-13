import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
        backgroundColor: const Color.fromARGB(228, 34, 5, 15),
        title: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                // setState(() {
                //   search = value;
                //   searchListUpdate();
                //   print(value);
                // });
              },
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search here.. LoW cars',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // searchListUpdate();
              },
              icon: const Icon(Icons.refresh)),
        ],
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
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(30)),
                                      color: Color.fromARGB(255, 224, 149, 144),
                                    ),
                                    width: 30,
                                    child: const Column(
                                      children: [
                                        Text('R'),
                                        Text('o'),
                                        Text('Y'),
                                        Text('A'),
                                        Text('L'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color.fromARGB(255, 213, 201, 201),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: carlo.image != null
                                            ? FileImage(File(carlo.image!))
                                            : const AssetImage(
                                                    "image/carr1.png")
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
                                                title: const Text('Confirm Deletion'),
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
                                                              carlo.image ?? "",
                                                        )));
                                          },
                                          icon: const Icon(Icons.edit_document)),
                                    ],
                                  )
                                ],
                              ),
                              const Gap(20),
                              Text(carlo.name),
                              const Gap(20),
                              Text(carlo.dlnumber),
                              const Gap(20),
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
          Text(
            'Total Low Cars Found: ${carsLowListNotifier.value.length}',
          ),
        ],
      ),
    );
  }
}
