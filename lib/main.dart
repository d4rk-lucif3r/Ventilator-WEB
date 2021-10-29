import 'dart:io';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/login/loginpage.dart';

import 'home/display.dart';

void main() {
  // List<dynamic> data = await fetchData("data?stream=1");
  // print(data[0]['6'].toString());
  // print(data[0].toString());

  // List<dynamic> streamData = await fetchData("data?stream=1");
  // print(streamData.toString());
  // getRealtimeData();
  // getData();
  runApp(const App());
}

//

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Display(),
      debugShowCheckedModeBanner: false,
    );
  }
}
