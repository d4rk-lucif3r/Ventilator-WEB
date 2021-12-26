import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_alarms.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_modes.dart';
import 'package:ventilator_ui/home/informationtab/settings/settings.dart';

class ShowHideDemo extends StatefulWidget {
  @override
  _ShowHideDemoState createState() {
    return _ShowHideDemoState();
  }
}

class _ShowHideDemoState extends State {
  bool _isVisible = false;
  bool showSettings = false;
  bool showAlarms = false;
  bool showModes = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _showSettings() {
    setState(() {
      showSettings = !showSettings;
    });
  }

  void _showAlarms() {
    setState(() {
      showAlarms = !showAlarms;
    });
  }

  void _showModes() {
    setState(() {
      showModes = !showModes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TempProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan,
          title: const Text('Flutter Show/Hide Widget Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.maxFinite,
            color: Colors.yellow,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              alignment: Alignment.centerRight,
              children: [
                Visibility(
                  visible: _isVisible,
                  child: Container(
                    width: 500,
                    height: 600,
                    color: Colors.white,
                    child: const Text(
                        "FlutterDevs is a protruding flutter app development company with an extensive "
                        "in-house team of 30+ seasoned professionals who know exactly what you need "
                        "to strengthen your business across various dimensions. With more than 10+ years "
                        "of experience in mobile applications, we know your needs very well.",
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                Visibility(
                  visible: showSettings,
                  child: Positioned(
                    right: 300,
                    child: Container(
                      width: 300,
                      height: 600,
                      color: Colors.transparent,
                      child: Settings(),
                    ),
                  ),
                ),
                Visibility(
                  visible: showModes,
                  child: Positioned(
                    right: 300,
                    child: Container(
                      width: 300,
                      height: 600,
                      color: Colors.transparent,
                      child: PopUpModes(),
                    ),
                  ),
                ),
                Visibility(
                  visible: showAlarms,
                  child: Positioned(
                    right: 300,
                    child: Container(
                      width: 400,
                      height: 400,
                      color: Colors.transparent,
                      // child: PopUpAlarms(),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                Container(
                  width: 200,
                  height: 700,
                  color: Colors.red,
                  child: Column(
                    children: [
                      OutlinedButton(
                        onPressed: showToast,
                        child: const Text("Show/Hide"),
                      ),
                      OutlinedButton(
                        onPressed: _showSettings,
                        child: const Text("Show Settings"),
                      ),
                      OutlinedButton(
                        onPressed: _showModes,
                        child: const Text("Show Modes"),
                      ),
                      OutlinedButton(
                        onPressed: _showAlarms,
                        child: const Text("Show Alarms"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
