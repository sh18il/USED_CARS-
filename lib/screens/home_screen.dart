import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:used_caer/screens/low_cars_pages/low_cars.dart';
import 'package:used_caer/screens/luxury_cars_pages.dart';
import 'package:used_caer/screens/medium_budjet_screen/medium_pages.dart';
// import 'package:used_caer/widgets/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('CARS GAREGE')),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(228, 34, 5, 15),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Luxury_cars_Screen()));
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
                      Text(
                        'LUXURY CARS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      Gap(10),
                    ],
                  ),
                ),
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Midium_cars()));
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
                      Text(
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
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Low_cars()));
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
                      Text(
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
            Gap(20),
          ],
        ),
      ),
    );
  }
}
