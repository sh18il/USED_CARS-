import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:used_caer/functions/function.dart';


class Chart_Screen extends StatefulWidget {
  const Chart_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Chart_Screen> createState() => _Chart_ScreenState();
}

class _Chart_ScreenState extends State<Chart_Screen> {
  late double ttm;
  late double ttl;
  late double ttlow;

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  void updateValues() {
    setState(() {
      ttm = ChartfucntionMe.totalMedi;
      ttl = Chartfucntion.totals;
      ttlow = ChartfucntionLow.totalLow;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Low': ttlow,
      'Medium': ttm,
      'Luxury': ttl,
    };

    final List<Color> colorList = [
      const Color.fromARGB(255, 135, 155, 145),
      const Color.fromARGB(255, 8, 11, 15),
      Color.fromARGB(255, 101, 51, 51),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("CAR BUDJET ANALYSIS")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          ringStrokeWidth: 22,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartRadius: MediaQuery.of(context).size.width / 1.6,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
          ),
        ),
      ),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   // final deviceSize = MediaQuery.of(context).size;
  //   // final List<Pie> pies = [
  //   //   Pie(
  //   //       color: const Color.fromARGB(255, 249, 63, 63),
  //   //       proportion: ttm.toDouble()),
  //   //   Pie(
  //   //       color: const Color.fromARGB(255, 104, 147, 255),
  //   //       proportion: ttl.toDouble()),
  //   //   Pie(color: Colors.green, proportion: ttlow.toDouble()),
  //   // ];

  //   return Scaffold();
  //   // Scaffold(
  //   //   appBar: AppBar(
  //   //     backgroundColor: Colors.black,
  //   //     title: const Center(child: Text('Pie Chart')),
  //   //   ),
  //   //   body: Column(
  //   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   //     children: [
  //   //       Center(
  //   //         child: Column(
  //   //           mainAxisAlignment: MainAxisAlignment.center,
  //   //           children: [
  //   //             SizedBox(
  //   //               width: deviceSize.width * 0.7,
  //   //               child: Padding(
  //   //                 padding: const EdgeInsets.all(8.0),
  //   //                 child: FlutterPieChart(
  //   //                   pies: pies,
  //   //                   selected: 2,
  //   //                 ),
  //   //               ),
  //   //             ),
  //   //           ],
  //   //         ),
  //   //       ),
  //   //       Column(
  //   //         children: [
  //   //           Row(
  //   //             children: [
  //   //               Container(
  //   //                 width: 30,
  //   //                 height: 30,
  //   //                 color: Colors.red,
  //   //               ),
  //   //               const Text('medium cars'),
  //   //               Text(ttm.toString())
  //   //             ],
  //   //           ),
  //   //           const Gap(10),
  //   //           Row(
  //   //             children: [
  //   //               Container(
  //   //                 width: 30,
  //   //                 height: 30,
  //   //                 color: Colors.blue,
  //   //               ),
  //   //               const Text('Luxury cars'),
  //   //               Text(ttl.toString())
  //   //             ],
  //   //           ),
  //   //           const Gap(10),
  //   //           Row(
  //   //             children: [
  //   //               Container(
  //   //                 width: 30,
  //   //                 height: 30,
  //   //                 color: Colors.green,
  //   //               ),
  //   //               const Text('Low cars '),
  //   //               Text(ttlow.toString())
  //   //             ],
  //   //           ),
  //   //         ],
  //   //       )
  //   //     ],
  //   //   ),
  //   // );
  // }

