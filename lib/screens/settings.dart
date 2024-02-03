import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:used_caer/screens/widgets/sign_in.dart';

class Setings extends StatelessWidget {
  const Setings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SETTINGS')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('about'))),
                  Container(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text('privacy and security'))),
                  Container(
                      child: TextButton(
                          onPressed: () {
                            // setState(() {
                            //   Hive.box('carsl_db').clear();
                            //   Hive.box('carsll_db').clear();
                            //   Hive.box('carsm_db').clear();
                            // });
                          },
                          child: Text('reset'))),
                  Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Sing_in()),
                                (route) => false);
                          },
                          child: Text('LOGOUT'))),
                  Container(
                      child: ElevatedButton(
                          onPressed: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          child: Text('EXIT')))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
