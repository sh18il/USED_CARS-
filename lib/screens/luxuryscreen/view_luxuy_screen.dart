import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ViewLuxuryScreen extends StatelessWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  ViewLuxuryScreen({
    super.key,
    required this.name,
    required this.model,
    required this.km,
    required this.index,
    required this.dlnbr,
    required this.owner,
    required this.price,
    required this.future,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text("PROFILE CARS",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(40),
              Center(
                  child: Image(
                image: FileImage(File(imagepath)),
              )),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('CarName :'),
                                Text(
                                  name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('MODEL :'),
                                Text(
                                  model,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('KM :'),
                                Text(
                                  km,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('DL NUMBER :'),
                                Text(
                                  dlnbr,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('OWNER :'),
                                Text(
                                  owner,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                Text('PRICE :'),
                                Text(
                                  price,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Card(
                    child: Container(
                        width: 180,
                        height: 70,
                        child: Column(
                          children: [
                            Text('FUTURE :'),
                            Text(
                              future,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                  const Gap(30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
