import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/screens/add_screen.dart';

class EditLuxury_Screen extends StatefulWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  EditLuxury_Screen({
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
  State<EditLuxury_Screen> createState() => _EditLuxury_ScreenState();
}

class _EditLuxury_ScreenState extends State<EditLuxury_Screen> {
  TextEditingController nameContrl = TextEditingController();
  TextEditingController modelContrl = TextEditingController();
  TextEditingController kmContrl = TextEditingController();
  TextEditingController dlNumberContrl = TextEditingController();
  TextEditingController ownerContrl = TextEditingController();
  TextEditingController priceContrl = TextEditingController();
  TextEditingController futureContrl = TextEditingController();

  File? _selectImage;

  @override
  void initState() {
    nameContrl = TextEditingController(text: widget.name);
    modelContrl = TextEditingController(text: widget.model);
    kmContrl = TextEditingController(text: widget.km);
    dlNumberContrl = TextEditingController(text: widget.dlnbr);
    ownerContrl = TextEditingController(text: widget.owner);
    priceContrl = TextEditingController(text: widget.price);
    futureContrl = TextEditingController(text: widget.future);
    _selectImage = widget.imagepath != '' ? File(widget.imagepath) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text("EDIT CARS",
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
              const Gap(20),
              Center(
                child: SizedBox(
                  height: 200,
                  child: Container(
                    child: Image(
                      image: _selectImage != null
                          ? FileImage(_selectImage!)
                          : const AssetImage("image/carr1.png")
                              as ImageProvider,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              const Text('EDIT CAR PHOTO'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 161, 133, 168)),
                      onPressed: () {
                        _pickImgGallery();
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("GALLERY")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 184, 151, 192)),
                      onPressed: () {
                        _pickImageFromCam();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("CAMERA")),
                ],
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
                        child: TextFormField(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
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
                  const Gap(30),
                  Container(
                    width: 223,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
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
                        updateAll();
                        Navigator.pop(context);
                      },
                      child: const Text('SUBMIT'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateAll() async {
    final namelx = nameContrl.text;
    final modellx = modelContrl.text;
    final kmlx = kmContrl.text;
    final dlnbrlx = dlNumberContrl.text;
    final ownerlx = ownerContrl.text;
    final pricelx = priceContrl.text;
    final futurelx = futureContrl.text;
    final imagelx = _selectImage!.path;

    if (namelx.isEmpty ||
        modellx.isEmpty ||
        kmlx.isEmpty ||
        dlnbrlx.isEmpty ||
        ownerlx.isEmpty ||
        pricelx.isEmpty ||
        futurelx.isEmpty ||
        imagelx.isEmpty) {
      return;
    } else {
      final update = CarsModel(
          name: namelx,
          model: modellx,
          km: kmlx,
          dlnumber: dlnbrlx,
          owner: ownerlx,
          price: pricelx,
          future: futurelx,
          image: imagelx);
      editCar(DataBases.LuxuryDb, widget.index, update);
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
