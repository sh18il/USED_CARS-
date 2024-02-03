import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MediumViewScreen extends StatelessWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  MediumViewScreen({
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
                child: Container(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: FileImage(File(imagepath)),
                  ),
                ),
              ),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 172,
                        height: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(name),
                      ),
                      Container(
                          width: 107,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(model)),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 121,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(km),
                      ),
                      Container(
                          width: 146,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(dlnbr)),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 107,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(owner)),
                      Container(
                          width: 174,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(price)),
                    ],
                  ),
                  const Gap(30),
                  Container(
                      width: 223,
                      height: 68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Text(future)),
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
