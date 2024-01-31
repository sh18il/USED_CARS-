import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:used_caer/model/medium_cars_model.dart';

import '../../functions/medium_functions.dart';

class MediumAddScreen extends StatefulWidget {
  const MediumAddScreen({super.key});

  @override
  State<MediumAddScreen> createState() => _MediumAddScreenState();
}

class _MediumAddScreenState extends State<MediumAddScreen> {
 
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
        title: Center(
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
              Gap(40),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundImage: _selectImage != null
                        ? FileImage(_selectImage!)
                        : const AssetImage("image/carr1.png") as ImageProvider,
                  ),
                ),
              ),
              Text('ADD CAR PHOTO'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 161, 133, 168)),
                      onPressed: () {
                        _pickImgGallery();
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("GALLERY")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 184, 151, 192)),
                      onPressed: () {
                        _pickImageFromCam();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("CAMERA")),
                ],
              ),
              Gap(30),
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
                    Gap(30),
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
                    Gap(30),
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
                    Gap(30),
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
                    Gap(30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            onAddCarsButn();
                            Navigator.pop(context);
                          }
                        },
                        child: Text('SUBMIT'))
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
    final _name = nameContrl.text;
    final _model = modelContrl.text;
    final _km = kmContrl.text;
    final _dlnbr = dlNumberContrl.text;
    final _owner = ownerContrl.text;
    final _price = priceContrl.text;
    final _future = priceContrl.text;

    if (_name.isEmpty ||
        _model.isEmpty ||
        _km.isEmpty ||
        _dlnbr.isEmpty ||
        _owner.isEmpty ||
        _price.isEmpty ||
        _future.isEmpty) {
      return;
    }

    final _cars = MediumCarsModel(
        name: _name,
        model: _model,
        km: _km,
        dlnumber: _dlnbr,
        owner: _owner,
        price: _price,
        future: _future,
        image: _selectImage!.path);
    addcarsm(_cars);
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