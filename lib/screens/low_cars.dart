import 'package:flutter/material.dart';
import 'package:used_caer/screens/add_screen.dart';

class Low_cars extends StatelessWidget {
  const Low_cars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddScrees()));
      }),
    );
  }
  
}
