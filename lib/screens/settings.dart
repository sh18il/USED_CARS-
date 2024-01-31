import 'package:flutter/material.dart';

class Setings extends StatelessWidget {
  const Setings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SETTINGS')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Text('about'),
                  Text('privacy and security'),
                  Text('reset')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
