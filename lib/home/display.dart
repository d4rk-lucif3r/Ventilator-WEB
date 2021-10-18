import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/plusminusprovider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import '../constants/constant.dart';
import 'informationtab/informationtab.dart';
import 'navbar/navbar.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
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
    print("Height: $h   Width: $w");

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
      ],
      child: Consumer2<RealTimeClass, RealTimeGraph>(
        builder: (context, provider, providerg, child) {
          // return StreamBuilder(
          //     stream: provider.updateStreamedData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         print("Waiting");
          //       }

          //       if (snapshot.connectionState == ConnectionState.active) {
          //         print("Active");
          //       }

          //       if (snapshot.connectionState == ConnectionState.done) {
          //         print("Done");
          //       }
          return Container(
            width: double.infinity,
            height: double.maxFinite,
            // margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.black,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xffd0ffff),
                    Colors.grey.shade300,
                  ],
                  stops: const [
                    .01,
                    .7,
                  ]),
              borderRadius: BorderRadius.circular(0),
            ),
            alignment: Alignment.center,
            child: w <= 1300 || h <= 750
                ? DefaultTextStyle(
                    style: TextStyle(
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
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 7,
                              // spreadRadius: 2,
                              offset: Offset(7, 7),
                            ),
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              // spreadRadius: 2,
                              offset: Offset(-2, -2),
                            ),
                          ]),
                      child: Container(
                        // width: double.infinity,
                        // height: double.maxFinite,
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          top: 30,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            //TODO: NavBar
                            const Expanded(
                              flex: 1,
                              child: NavBar(),
                            ),
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),

                            //TODO: InformationTab
                            Expanded(
                              flex: 9,
                              child: InformationTab(
                                providerg: providerg,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            //   );
            // }
          );
        },
      ),
    );
  }
}
