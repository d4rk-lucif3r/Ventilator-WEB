import 'dart:io';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/dispose/popup-dev-for-settings/popup_window.dart';
import 'package:ventilator_ui/dispose/spo2_development/working/graph_test.dart';
import 'package:ventilator_ui/login/loginpage.dart';
import 'dispose/slider_test.dart';
import 'dispose/spo2_development/working/graph-algo-test.dart';
import 'dispose/slider_test.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopUpWindow(),
      debugShowCheckedModeBanner: false,
    );
  }
}
