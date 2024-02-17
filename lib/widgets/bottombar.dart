import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:royalcars/screens/add_screen.dart';
import 'package:royalcars/screens/chart_screen.dart';
import 'package:royalcars/screens/home_screen.dart';

import 'package:royalcars/screens/settings.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const AddScrees(),
    const ChartScreen(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        animationCurve: Curves.linear,
        backgroundColor: Colors.transparent,
        color: Colors.black,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const Icon(
            Icons.home,
            color: Colors.white,
          ),
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          const Icon(
            Icons.bar_chart,
            color: Colors.white,
          ),
          // ignore: prefer_const_constructors
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}
