import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/model/cars_model.dart';

import 'package:used_caer/screens/editscreen_luxury.dart';
import 'package:used_caer/screens/luxuryscreen/view_luxuy_screen.dart';

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
        .where(
          (CarsModel) =>
              CarsModel.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
    searchedList = carsListNotifier.value
        .where(
          (CarsModel) =>
              CarsModel.price.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    searchListUpdate();

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
                setState(() {
                  search = value;
                  searchListUpdate();
                  print(value);
                });
              },
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search Luxury cars',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                searchListUpdate();
              },
              icon: const Icon(Icons.refresh)),
        ],
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
                        ? const Center(child: Text('No results found'))
                        : buildCArList(searchedList)
                    : buildCArList(searchedList);
              },
            ),
          ),
          Text(
            'Total Luxury Cars Found: ${searchedList.length}',
          ),
        ],
      ),
    );
  }

  Widget buildCArList(List<CarsModel> carsList) {
    return carsList.isEmpty
        ? const Center(
            child: Text('No cars available'),
          )
        : ListView.separated(
            itemCount: carsList.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          title: const Text('Confirm Deletion'),
                                          content: const Text(
                                              'Are you sure you want to delete this car?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deletCarsL(index);
                                                Navigator.of(context).pop();
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
                                                    imagepath: car.image ?? "",
                                                  )));
                                    },
                                    icon: const Icon(Icons.edit_document)),
                              ],
                            )
                          ],
                        ),
                        Text(car.name),
                        const Gap(20),
                        Text(car.dlnumber),
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
          );
  }
}
