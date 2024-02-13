import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:used_caer/functions/medium_functions.dart';

import 'package:used_caer/model/medium_cars_model.dart';

import 'package:used_caer/screens/medium_budjet_screen/medium_edit.dart';
import 'package:used_caer/screens/medium_budjet_screen/view_medium_screen.dart';

class Midium_cars extends StatefulWidget {
  const Midium_cars({super.key});

  @override
  State<Midium_cars> createState() => _Midium_carsState();
}

class _Midium_carsState extends State<Midium_cars> {
  String searchm = "";
  List<MediumCarsModel> searchedListm = [];

  void searchListUpdatem() {
    getAllCarsm();
    searchedListm = carsMediumListNotifier.value
        .where((MediumCarsModel) =>
            MediumCarsModel.name.toLowerCase().contains(searchm.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getAllCarsm();
    searchListUpdatem();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(228, 34, 5, 15),
        title: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
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
                      searchm = value;
                      searchListUpdatem();
                      print(value);
                    });
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'Search Medium cars',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                searchListUpdatem();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsMediumListNotifier,
              builder: (context, value, child) {
                List<MediumCarsModel> carsList = value;

                return searchm.isNotEmpty
                    ? searchedListm.isEmpty
                        ? const Center(child: Text('No results found'))
                        : medium_build(carsList: carsList)
                    : medium_build(carsList: carsList);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class medium_build extends StatelessWidget {

  const medium_build({
    super.key,
    required this.carsList,
  });

  final List<MediumCarsModel> carsList;

  @override
  Widget build(BuildContext context) {

    return  carsList.isEmpty
        ? const Center(
            child: Text('No cars available'),
          ) : ListView.separated(
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
                            image: carm.image != null
                                ? FileImage(File(carm.image!))
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
                                          deletCarsm(index);
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MediumEditScreen(
                                          name: carm.name,
                                          model: carm.model,
                                          km: carm.km,
                                          index: index,
                                          dlnbr: carm.dlnumber,
                                          owner: carm.owner,
                                          price: carm.price,
                                          future: carm.future,
                                          imagepath: carm.image ?? "",
                                        )));
                              },
                              icon: const Icon(Icons.edit_document)),
                        ],
                      )
                    ],
                  ),
                  const Gap(10),
                  Text(carm.name),
                  const Gap(20),
                  Text(carm.dlnumber),
                  const Gap(10),
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
  }
}
