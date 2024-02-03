import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:used_caer/screens/add_screen.dart';
import 'package:used_caer/screens/low_cars_pages/low_cars.dart';
import 'package:used_caer/screens/luxury_cars_pages.dart';
import 'package:used_caer/screens/medium_budjet_screen/medium_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add_to_photos_outlined),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScrees()));
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('CARS GAREGE')),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(228, 34, 5, 15),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Luxury_cars_Screen()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190, child: Image.asset('image/rolss.png')),
                      const Text(
                        'LUXURY CARS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Midium_cars()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190,
                          child: Image.asset('image/mercedesbenz_.png')),
                      const Text(
                        'MEDIUM BUDGET',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Low_Cars()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190, child: Image.asset('image/carr1.png')),
                      const Text(
                        'low BUDGET',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
