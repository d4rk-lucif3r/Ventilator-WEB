import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/login.dart';
import 'package:ventilator_ui/connect/plusminusprovider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import '../constants/constant.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_2_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_4_graph.dart';
import 'informationtab/informationtab.dart';
import 'informationtab/settings/settings.dart';
import 'navbar/navbar.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late Timer timer;
  late Timer timerGraph;
  // late Timer timertwo;
  var count = 0;
  Duration duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    // TODO: implement initState
    print("Display Created");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Display Dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    // print("Height: $h   Width: $w");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UpdateAlarm(),
        ),
        ChangeNotifierProvider(
          create: (_) => RealTimeClass(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlarmSync(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlusMinusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TempProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RealTimeGraph(),
        ),
        ChangeNotifierProvider(
          create: (_) => ECG1(),
        ),
        ChangeNotifierProvider(
          create: (_) => ECG2(),
        ),
        ChangeNotifierProvider(
          create: (_) => ECG3(),
        ),
        ChangeNotifierProvider(
          create: (_) => ECG4(),
        ),
      ],
      child: Consumer6<RealTimeClass, RealTimeGraph, ECG1, ECG2, ECG3, ECG4>(
          builder: (context, provider, providerg, providerecg1, providerecg2,
              providerecg3, providerecg4, child) {
        // timer = Timer.periodic(duration, (timer) {
        //   provider.updateStreamedData(timer);
        //   setState(
        //     () {
        //       debugPrint("Before Counting : $count\n");
        //       if (count >= 29) {
        //         duration = const Duration(milliseconds: 500);
        //         debugPrint("$duration");

        //         if (count >= 59) {
        //           if (count % 10 == 0) {
        //             // debugPrint("Graphs");
        //             debugPrint("Greater than 59");
        //             providerecg1.getChartData(timer);
        //             providerecg2.getChartData(timer);
        //             providerecg3.getChartData(timer);
        //             providerecg4.getChartData(timer);
        //           }
        //         } else if (count < 59) {
        //           if (count % 2 == 0) {
        //             // debugPrint("Graphs");
        //             debugPrint("Lesser than 59");
        //             providerecg1.getChartData(timer);
        //             providerecg2.getChartData(timer);
        //             providerecg3.getChartData(timer);
        //             providerecg4.getChartData(timer);
        //           }
        //         }
        //         count++;
        //       } else {
        //         // debugPrint("Graphs");
        //         debugPrint("Lesser than 29");
        //         providerecg1.getChartData(timer);
        //         providerecg2.getChartData(timer);
        //         providerecg3.getChartData(timer);
        //         providerecg4.getChartData(timer);
        //         count++;
        //       }

        //       // debugPrint("Realtime");

        //       debugPrint("After Counting : $count");
        //     },
        //   );
        // });
        // timerGraph = Timer.periodic(
        //   duration,
        //   (timer) => setState(
        //     () {
        //       providerecg1.getChartData(timer);
        //       providerecg2.getChartData(timer);
        //       providerecg3.getChartData(timer);
        //       providerecg4.getChartData(timer);
        //       // debugPrint(count.toString());
        //       timer.cancel();
        //     },
        //   ),
        // );

        // timertwo = Timer.periodic(
        //   duration,
        //   (timertwo) => setState(
        //     () {
        //       // widget.provider.chartData.length < 20
        //       //     ? widget.provider.getStaticGraph(timer)
        //       // :
        //       if (count >= 29) duration = const Duration(seconds: 1);
        //       if (count >= 59) duration = const Duration(seconds: 5);

        //       debugPrint("Graphs");
        //       providerecg1.getChartData(timertwo);
        //       providerecg2.getChartData(timertwo);
        //       providerecg3.getChartData(timertwo);
        //       providerecg4.getChartData(timertwo);
        //       count++;
        //       // debugPrint(count.toString());

        //       // timer.cancel();
        //     },
        //   ),
        // );
        // return StreamBuilder(
        // stream: Stream.periodic(
        //   const Duration(
        //     milliseconds: 500,
        //   ),
        //   (event) => provider.updateStreamedData(),
        // ),
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     debugPrint("Waiting");
        //   }

        //   if (snapshot.connectionState == ConnectionState.active) {
        //     debugPrint("Active");
        //   }

        //   if (snapshot.connectionState == ConnectionState.done) {
        //     debugPrint("Done");
        //   }
        return DefaultTextStyle(
          style: TextStyle(inherit: false),
          child: Container(
            width: double.infinity,
            height: double.maxFinite,
            // margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffd0ffff),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     const Color(0xffd0ffff),
              //     Colors.grey.shade300,
              //   ],
              //   stops: const [
              //     .01,
              //     .7,
              //   ],
              // ),
              borderRadius: BorderRadius.circular(0),
            ),
            alignment: Alignment.center,
            child: w <= 1300 || h <= 750
                ? DefaultTextStyle(
                    style: const TextStyle(
                      inherit: false,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 400,
                        minHeight: 100,
                        maxWidth: w * .8,
                        minWidth: 200,
                      ),
                      child: Container(
                        // color: Colors.red[700],
                        color: Colors.transparent,
                        child: Center(
                            child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Need Bigger Screen",
                              style: TextStyle(
                                fontSize: w * .07,
                                color: Colors.black,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "\n\nYour screen should be minimum 750 x 1300 pixel.",
                              style: TextStyle(
                                fontSize: w * .019,
                                color: Colors.black,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w200,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ]),
                        )),
                      ),
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Consumer<TempProvider>(
                      builder: (context, tempprovider, child) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Colors.black45,
                            //     blurRadius: 7,
                            //     // spreadRadius: 2,
                            //     offset: Offset(7, 7),
                            //   ),
                            //   BoxShadow(
                            //     color: Colors.black26,
                            //     blurRadius: 2,
                            //     // spreadRadius: 2,
                            //     offset: Offset(-2, -2),
                            //   ),
                            // ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Container(
                                  // width: double.infinity,
                                  // height: double.maxFinite,
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: double.infinity,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'VENTO MONITOR',
                                            style: TextStyle(
                                              fontFamily: 'Candara',
                                              fontSize: 48,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //TODO: NavBar
                                      const Expanded(
                                        flex: 1,
                                        child: NavBar(),
                                      ),
                                      SizedBox(
                                        height: 5,
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
                                      ),

                                      //TODO: InformationTab
                                      Expanded(
                                        flex: 10,
                                        child: InformationTab(
                                          providerg: providerg,
                                          providerecg1: providerecg1,
                                          providerecg2: providerecg2,
                                          providerecg3: providerecg3,
                                          providerecg4: providerecg4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                width: tempprovider.animatedWidth,
                                curve: Curves.linearToEaseOut,
                                duration: Duration(milliseconds: 1000),
                                child: Settings(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        );
      }
          // );
          // },
          ),
    );
  }
}
