import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/login.dart';
import 'package:ventilator_ui/connect/patientinfo.dart';
import 'package:ventilator_ui/connect/plusminusprovider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/home/home_pop_up_stacks/patient_profile.dart';
import 'package:ventilator_ui/home/home_pop_up_stacks/pop_up_map_window.dart';
import 'package:ventilator_ui/ui_control_center/transition_manager.dart';
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
  var count = 0;
  Duration duration = const Duration(milliseconds: 50);

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

    Widget widgetSwitcher(bool value, String name, String age, String sex) {
      return value == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AspectRatio(
                  aspectRatio: 1,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: Colors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '$age, $sex',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                AspectRatio(
                  aspectRatio: 4,
                  child: Center(
                    child: Text(
                      "Patient Info",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            );
    }

    return MultiProvider(
      //TODO : Providers
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
          create: (_) => ChartSync(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlusMinusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TempProvider(),
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
        ChangeNotifierProvider(
          create: (_) => TransitionManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => PatientInfo(),
        ),
      ],

      //TODO: Display children Starts from here
      child: Consumer6<RealTimeClass, PatientInfo, TransitionManager,
              TempProvider, ChartSync, AlarmSync>(

          //TODO : Display consumers are listed here
          builder: (context, provider, providerinfo, transprovider,
              tempprovider, syncprovider, alarmprovider, child) {
        //TODO: Display funtions are executed here
        providerinfo.getPatientData();
        // timer = Timer.periodic(duration, (timer) {
        //   provider.updateStreamedData(timer);
        //   // setState(
        //   //   () {
        //   //     debugPrint("Before Counting : $count\n");
        //   //     if (count >= 29) {
        //   //       duration = const Duration(milliseconds: 500);
        //   //       debugPrint("$duration");
        //   //       if (count >= 59) {
        //   //         if (count % 10 == 0) {
        //   //           // debugPrint("Graphs");
        //   //           debugPrint("Greater than 59");
        //   //           providerecg1.getChartData(timer);
        //   //           providerecg2.getChartData(timer);
        //   //           providerecg3.getChartData(timer);
        //   //           providerecg4.getChartData(timer);
        //   //         }
        //   //       } else if (count < 59) {
        //   //         if (count % 2 == 0) {
        //   //           // debugPrint("Graphs");
        //   //           debugPrint("Lesser than 59");
        //   //           providerecg1.getChartData(timer);
        //   //           providerecg2.getChartData(timer);
        //   //           providerecg3.getChartData(timer);
        //   //           providerecg4.getChartData(timer);
        //   //         }
        //   //       }
        //   //       count++;
        //   //     } else {
        //   //       // debugPrint("Graphs");
        //   //       debugPrint("Lesser than 29");
        //   //       providerecg1.getChartData(timer);
        //   //       providerecg2.getChartData(timer);
        //   //       providerecg3.getChartData(timer);
        //   //       providerecg4.getChartData(timer);
        //   //       count++;
        //   //     }
        //   //     // debugPrint("Realtime");
        //   //     debugPrint("After Counting : $count");
        //   //   },
        //   // );
        // });
        try {
          timerGraph = Timer.periodic(
            duration,
            (timer) => setState(
              () {
                syncprovider.getChartData(timer, 'g1');
                syncprovider.getChartData(timer, 'g2');
                syncprovider.getChartData(timer, 'g3');
                syncprovider.getChartData(timer, 'g4');
                // providerecg1.getChartData(timer);
                // providerecg2.getChartData(timer);
                // providerecg3.getChartData(timer);
                // providerecg4.getChartData(timer);
                // debugPrint(count.toString());
                timer.cancel();
              },
            ),
          );
        } catch (e) {
          debugPrint("Graph ERROR : $e");
        }

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
          style: const TextStyle(inherit: false),
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
                    child: Dashboard(
                      provider: provider,
                      providerinfo: providerinfo,
                      syncprovider: syncprovider,
                      alarmprovider: alarmprovider,
                      transprovider: transprovider,
                      tempProvider: tempprovider,
                      updateState: () {
                        setState(() {});
                        debugPrint("Parent State Refreshed");
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

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    required this.provider,
    required this.providerinfo,
    required this.syncprovider,
    required this.alarmprovider,
    required this.transprovider,
    required this.tempProvider,
    required this.updateState,
  }) : super(key: key);

  final RealTimeClass provider;
  final PatientInfo providerinfo;
  final ChartSync syncprovider;
  final AlarmSync alarmprovider;
  final TransitionManager transprovider;
  final TempProvider tempProvider;
  final Function updateState;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void updateState(TransitionManager provider) {}

  @override
  Widget build(BuildContext context) {
    // widget.updateState;
    // updateState(widget.transprovider);

    if (widget.transprovider.showSettings ||
        widget.transprovider.showModes ||
        widget.transprovider.showAlarms ||
        widget.transprovider.showPatienInfo ||
        widget.transprovider.showMapWindow) {
      widget.updateState;
    }

    //TODO: pr alarm
    int.parse(widget.provider.pr) <= widget.alarmprovider.prmax.toInt() &&
            int.parse(widget.provider.pr) >= widget.alarmprovider.prmin.toInt()
        ? widget.provider.ispralarm == true
            ? widget.provider.pralarm(false)
            : widget.provider.doNothing()
        : widget.provider.ispralarm == false
            ? widget.provider.pralarm(true)
            : widget.provider.doNothing();

    //TODO: spo2 alarm
    int.parse(widget.provider.spo2) <= widget.alarmprovider.spo2max.toInt() &&
            int.parse(widget.provider.spo2) >=
                widget.alarmprovider.spo2min.toInt()
        ? widget.provider.isspo2alarm == true
            ? widget.provider.spo2alarm(false)
            : widget.provider.doNothing()
        : widget.provider.isspo2alarm == false
            ? widget.provider.spo2alarm(true)
            : widget.provider.doNothing();

    //TODO: pip alarm
    int.parse(widget.provider.pip) <= widget.alarmprovider.pipmax.toInt() &&
            int.parse(widget.provider.pip) >=
                widget.alarmprovider.pipmin.toInt()
        ? widget.provider.ispipalarm == true
            ? widget.provider.pipalarm(false)
            : widget.provider.doNothing()
        : widget.provider.ispipalarm == false
            ? widget.provider.pipalarm(true)
            : widget.provider.doNothing();

    //TODO: peep alarm
    int.parse(widget.provider.peep) <= widget.alarmprovider.peepmax.toInt() &&
            int.parse(widget.provider.peep) >=
                widget.alarmprovider.peepmin.toInt()
        ? widget.provider.ispeepalarm == true
            ? widget.provider.peepalarm(false)
            : widget.provider.doNothing()
        : widget.provider.ispeepalarm == false
            ? widget.provider.peepalarm(true)
            : widget.provider.doNothing();

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
                  Expanded(
                    flex: 3,
                    child: Consumer<TempProvider>(
                      builder: (context, tempprovider, child) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            // color: Color(0xff81d4fa),
                            // color: Color(0xffECF2FE),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 4,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(-2, -2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.transprovider.popUpCheck(
                                          'patientinfo',
                                          !widget.transprovider.showPatienInfo);
                                    },
                                    child: AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        reverseDuration:
                                            const Duration(milliseconds: 500),
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation) {
                                          return ScaleTransition(
                                              scale: animation, child: child);
                                        },
                                        child: widget.transprovider
                                                    .showPatienInfo ==
                                                false
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 36,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget
                                                            .providerinfo.name,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${widget.providerinfo.age}, ${widget.providerinfo.sex}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  AspectRatio(
                                                    aspectRatio: 4,
                                                    child: Center(
                                                      child: Text(
                                                        "Patient Info",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    widget.transprovider.popUpCheck('mapwindow',
                                        !widget.transprovider.showMapWindow);
                                    // widget.updateState();
                                    // });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      AutoSizeText(
                                        'Badli Road, Gurugram, 122505',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        minFontSize: 12,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        size: 26,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 26,
                    child: Container(
                      color: Colors.transparent,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          var infWidth = constraints.maxWidth;
                          var infHeight = constraints.maxHeight;

                          return Stack(
                            children: [
                              SizedBox.expand(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),

                                    //TODO: InformationTab
                                    Expanded(
                                      // flex: 10,
                                      child: InformationTab(
                                        // providerg:
                                        //     provider,
                                        syncprovider: widget.syncprovider,
                                        // providerecg1: widget.providerecg1,
                                        // providerecg2: widget.providerecg2,
                                        // providerecg3: widget.providerecg3,
                                        // providerecg4: widget.providerecg4,
                                        // parentStateUpdate: widget.updateState,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: widget.transprovider.showMapWindow,
                                child: Positioned(
                                  right: 10,
                                  top: -2,
                                  child: Container(
                                    width: infWidth * .8 * .3,
                                    height: infWidth * .8 * .2,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        width: .5,
                                        style: BorderStyle.none,
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 30),
                                          color: Colors.black.withOpacity(.15),
                                          blurRadius: 30,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: PopUpMapWindow(
                                      getLatlng:
                                          widget.provider.lastUpdatedLocation,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.transprovider.showPatienInfo,
                                child: Positioned(
                                  left: 10,
                                  top: -5,
                                  child: Container(
                                    width: infWidth * .2,
                                    height: infHeight * .65,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        width: .5,
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 30),
                                          color: Colors.black.withOpacity(.25),
                                          blurRadius: 30,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: PatientProfile(
                                      pname: widget.providerinfo.name,
                                      page: widget.providerinfo.age,
                                      psex: widget.providerinfo.sex,
                                      pheight: widget.providerinfo.height,
                                      pweight: widget.providerinfo.weight,
                                      pbloodGroup:
                                          widget.providerinfo.bloodGroup,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // AnimatedContainer(
          //   width: tempprovider.animatedWidth,
          //   curve: Curves.linearToEaseOut,
          //   duration: Duration(milliseconds: 1000),
          //   child: Settings(),
          // ),
        ],
      ),
    );
  }
}
