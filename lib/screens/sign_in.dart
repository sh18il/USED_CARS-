import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:used_caer/screens/home_screen.dart';
import 'package:used_caer/screens/widgets/bottombar.dart';

class Sing_in extends StatelessWidget {
  const Sing_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: Alignment(-0.8, 0.6),
              child: Text("ROYAL CARS ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )),
            ),
            Gap(30),
            SizedBox(
              height: 350,
              child: Image.asset(
                "image/carr1.png",
                width: 524,
                height: 210,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 305,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Icon(Icons.person_3),
                        hintText: 'USER NAME ',
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 305,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Icon(Icons.hide_source_rounded),
                        hintText: 'PASSWORD ',
                      ),
                    ),
                  ),
                ),
                Gap(20),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black87),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BottomNav()));
                    },
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text('Sing up')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
