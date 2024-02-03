import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/model/low_cars_model.dart';
import 'package:used_caer/model/medium_cars_model.dart';

import '../functions/lowcars_functions.dart';
import '../functions/medium_functions.dart';

class AddScrees extends StatefulWidget {
  const AddScrees({super.key});

  @override
  State<AddScrees> createState() => _AddScreesState();
}

enum DataBases { LuxuryDb, MediumDb, LowDb }

class _AddScreesState extends State<AddScrees> {
  DataBases selectedDatabase = DataBases.LuxuryDb;
  final nameContrl = TextEditingController();
  final modelContrl = TextEditingController();
  final kmContrl = TextEditingController();
  final dlNumberContrl = TextEditingController();
  final ownerContrl = TextEditingController();
  final priceContrl = TextEditingController();
  final futureContrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text("ADD CARS",
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
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundImage: _selectImage != null
                        ? FileImage(_selectImage!)
                        : const AssetImage("image/carr1.png") as ImageProvider,
                  ),
                ),
              ),
              const Text('ADD CAR PHOTO'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 161, 133, 168)),
                      onPressed: () {
                        _pickImgGallery();
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("GALLERY")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 184, 151, 192)),
                      onPressed: () {
                        _pickImageFromCam();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("CAMERA")),
                ],
              ),
              const Gap(30),
              Form(
                key: _formKey,
                child: Column(
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter name';
                              } else {
                                return null;
                              }
                            },
                            controller: nameContrl,
                            decoration: InputDecoration(
                              hintText: 'NAME',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: 107,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter model';
                              } else {
                                return null;
                              }
                            },
                            controller: modelContrl,
                            decoration: InputDecoration(
                              hintText: 'MODEL',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter Km';
                              } else {
                                return null;
                              }
                            },
                            controller: kmContrl,
                            decoration: InputDecoration(
                              hintText: 'KM',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: 146,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter Dl number';
                              } else {
                                return null;
                              }
                            },
                            controller: dlNumberContrl,
                            decoration: InputDecoration(
                              hintText: 'DL NUMBER',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter ownership';
                              } else {
                                return null;
                              }
                            },
                            controller: ownerContrl,
                            decoration: InputDecoration(
                              hintText: 'OWNERSHIP',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: 174,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter price';
                              } else {
                                return null;
                              }
                            },
                            controller: priceContrl,
                            decoration: InputDecoration(
                              hintText: 'PRICE',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DropdownButton<DataBases>(
                          value: selectedDatabase,
                          items: const [
                            DropdownMenuItem(
                                value: DataBases.LuxuryDb,
                                child: Text('Luxury')),
                            DropdownMenuItem(
                                value: DataBases.MediumDb,
                                child: Text('MEDIUM')),
                            DropdownMenuItem(
                                value: DataBases.LowDb, child: Text('LOW')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDatabase = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const Gap(30),
                    Container(
                      width: 223,
                      height: 68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter futers';
                          } else {
                            return null;
                          }
                        },
                        controller: futureContrl,
                        decoration: InputDecoration(
                          hintText: 'FUETERS',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const Gap(30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            onAddCarsButn();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('SUBMIT'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddCarsButn() async {
    if (selectedDatabase == DataBases.LuxuryDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = priceContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = CarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: _selectImage!.path);
      addcarsl(cars);
    } else if (selectedDatabase == DataBases.MediumDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = priceContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = MediumCarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: _selectImage!.path);
      addcarsm(cars);
    } else if (selectedDatabase == DataBases.LowDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = priceContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = LowCarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: _selectImage!.path);
    
      addcarsll(cars);
    }
  }

  Future _pickImgGallery() async {
    final returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImg == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImg.path);
    });
  }

  _pickImageFromCam() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnImage == null) {
      return;
    }

    setState(() {
      _selectImage = File(returnImage.path);
    });
  }
}
