// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:used_caer/screens/home_screen.dart';
// import 'package:used_caer/screens/vehicles_screen.dart';

// class BottomScreen extends StatefulWidget {
//   const BottomScreen({super.key});

//   @override
//   State<BottomScreen> createState() => _BottomScreenState();
// }

// class _BottomScreenState extends State<BottomScreen> {
//   final selectedIndex = [
//    const HomeScreen(),
//    const Vehicles_screen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: 0,
//           onDestinationSelected: (index) {},
//           destinations: [
//             NavigationDestination(icon: Icon(Icons.home), label: 'home'),
//             NavigationDestination(
//                 icon: Icon(Icons.car_crash), label: 'vehicles'),
//             NavigationDestination(icon: Icon(Icons.person), label: 'person'),
//           ]),
//     );
//     // BottomAppBar(
//     //   child: ConvexAppBar(
//     //       backgroundColor: const Color.fromARGB(255, 92, 97, 102),
//     //       items: [
//     //         TabItem(icon: Icon(Icons.home), title: 'home'),
//     //         TabItem(icon: Icon(Icons.car_crash_rounded), title: 'cars'),
//     //         TabItem(icon: Icon(Icons.person_2), title: 'person'),
//     //       ]),
//     // );
//   }
// }
