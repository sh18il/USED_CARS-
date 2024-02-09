import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';

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
  final List<Pie> pies = [
    Pie(color: Color.fromARGB(255, 249, 63, 63), proportion: 40),
    Pie(color: Color.fromARGB(255, 131, 255, 100), proportion: 40),
    Pie(color: Color.fromARGB(255, 104, 147, 255), proportion: 20),
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(228, 34, 5, 15),
        title: Center(child: const Text(' pie chart')),
      ),
      body: Center(
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
    );
  }
}
