import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:gap/gap.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/functions/lowcars_functions.dart';
import 'package:used_caer/functions/medium_functions.dart';

class Chart_Screen extends StatefulWidget {
  const Chart_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Chart_Screen> createState() => _Chart_ScreenState();
}

class _Chart_ScreenState extends State<Chart_Screen> {
  late int ttm;
  late int ttl;
  late int ttlow;

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  void updateValues() {
    setState(() {
      ttm = carsMediumListNotifier.value.length;
      ttl = carsListNotifier.value.length;
      ttlow = carsLowListNotifier.value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final List<Pie> pies = [
      Pie(
          color: const Color.fromARGB(255, 249, 63, 63),
          proportion: ttm.toDouble()),
      Pie(
          color: const Color.fromARGB(255, 131, 255, 100),
          proportion: ttl.toDouble()),
      Pie(
          color: const Color.fromARGB(255, 104, 147, 255),
          proportion: ttlow.toDouble()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Pie Chart')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceSize.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterPieChart(
                      pies: pies,
                      selected: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  const Text('medium cars'),
                  Text(ttm.toString())
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                  const Text('Luxury cars'),
                  Text(ttl.toString())
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.green,
                  ),
                  const Text('Low cars '),
                  Text(ttlow.toString())
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  
}
