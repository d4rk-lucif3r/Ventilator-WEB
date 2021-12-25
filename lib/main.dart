import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';
import 'package:http/http.dart';
import 'package:ventilator_ui/connect/login.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/dispose/popup-dev-for-settings/popup_window.dart';
import 'package:ventilator_ui/dispose/spo2_development/working/data.dart';
import 'package:ventilator_ui/dispose/spo2_development/working/graph_test.dart';
import 'package:ventilator_ui/home/display.dart';
import 'package:ventilator_ui/login/loginpage.dart';
import 'dispose/slider_test.dart';
import 'dispose/spo2_development/working/graph-algo-test.dart';
import 'dispose/slider_test.dart';

void main() async {
  var bing = await login('lucif3r', 'lucif3r');
  print("${bing}");
  // while (true) {
  //   // List<dynamic> streamData = await fetchData("alarms");
  //   List<dynamic> streamData = await fetchData("data?stream=1");

  //   try {
  //     var data = streamData[0]['2'];
  //     debugPrint("$streamData");
  //   } catch (e) {
  //     debugPrint('$e');
  //   }
  // }

  js.context['my_var'] = const String.fromEnvironment('api');

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
      home: DefaultTextStyle(
        style: TextStyle(inherit: false),
        child: Display(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
