import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:used_caer/model/cars_model.dart';
import 'package:used_caer/model/low_cars_model.dart';
import 'package:used_caer/model/medium_cars_model.dart';
import 'package:used_caer/screens/vehicles_screen.dart';
import 'package:used_caer/screens/widgets/sign_in.dart';
import 'package:used_caer/subscreen/about.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> itemNames = [
    'LOGOUT',
    'EXIT',
    'RESET',
    'ABOUT',
    'POLICY',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Center(child: Text('SETTINGS')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Chart_Screen()));
              },
              icon: Icon(Icons.bar_chart))
        ],
      ),
      body: ListView.builder(
        itemCount: itemNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemNames[index]),
            onTap: () {
              _handleListItemTap(index);
            },
          );
        },
      ),
    );
  }

  void _handleListItemTap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Sing_in()));
        break;
      case 1:
        _showExitConfirmationDialog();
        break;
      case 2:
        _showResetConfirmationDialog();
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutScreen()));
        break;
      case 4:
        break;
    }
  }

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit"),
          content: Text("Are you sure you want to exit the application?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Exit"),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
  }

  void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Reset"),
          content: Text("Are you sure you want to reset all data?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Reset"),
              onPressed: () {
                _resetData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetData() async {
    final carslDB = await Hive.openBox<CarsModel>('carsl_db');
    carslDB.clear();
    final carslDBl = await Hive.openBox<LowCarsModel>('carsll_db');
    carslDBl.clear();
    final carslDBm = await Hive.openBox<MediumCarsModel>('carsm_db');
    carslDBm.clear();
  }
}
