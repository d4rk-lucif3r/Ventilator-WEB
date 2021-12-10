import 'dart:io';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/dispose/graph_test.dart';
import 'package:ventilator_ui/login/loginpage.dart';
import 'dispose/spo2_development/graph-algo-test.dart';
import 'home/display.dart';

void main() {
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
