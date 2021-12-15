import 'dart:html';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';
import 'package:http/http.dart';
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
  // final mapOptions = MapOptions()
  //   ..zoom = 8
  //   ..center = LatLng(-34.397, 150.644);
  // GMap(document.getElementById("map-canvas"), mapOptions);

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
