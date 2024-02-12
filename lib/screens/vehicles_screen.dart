import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:used_caer/functions/function.dart';
import 'package:used_caer/functions/lowcars_functions.dart';
import 'package:used_caer/functions/medium_functions.dart';

class Chart_Screen extends StatelessWidget {
  const Chart_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      Pie(color: Color.fromARGB(255, 249, 63, 63), proportion: ttm.toDouble()),
      Pie(
          color: Color.fromARGB(255, 131, 255, 100),
          proportion: ttl.toDouble()),
      Pie(
          color: Color.fromARGB(255, 104, 147, 255),
          proportion: ttlow.toDouble()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(228, 34, 5, 15),
        title: Center(child: const Text('Pie Chart')),
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
                  Text('medium cars'),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                  Text('Luxury cars'),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.green,
                  ),
                  Text('Low cars'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
