import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';

import 'home/display.dart';

void main() {
  // List<dynamic> streamData = await fetchData("data?stream=1");
  // print(streamData[0]['5'].toString());
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

class DisplayX extends StatelessWidget {
  const DisplayX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 10,
        right: 10,
        left: 10,
      ),
      width: double.infinity,
      height: double.maxFinite,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.transparent,

                              // ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: const [
                                  Graph(),
                                  Graph(),
                                  Graph(),
                                  Graph(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      color: Colors.transparent,
                      child: Row(
                        children: const [
                          BottomTab(),
                          BottomTab(),
                          BottomTab(),
                          BottomTab(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lime.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(.6),
              blurRadius: 3,
              offset: const Offset(5, 5),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  const BottomTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(.6),
                blurRadius: 3,
                offset: const Offset(5, 5),
              ),
            ]),
      ),
    );
  }
}
