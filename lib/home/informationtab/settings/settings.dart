import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/login/loginpage.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool connectionState = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DefaultTextStyle(
          style: const TextStyle(inherit: false),
          // child: ClipRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Consumer<TempProvider>(
            builder: (context, tempprovider, child) {
              //         return Container(
              //           width: constraints.maxWidth,
              //           height: constraints.maxHeight,
              //           decoration: BoxDecoration(
              //             color: Colors.grey.shade200.withOpacity(0.6),
              //           ),
              //           alignment: Alignment.bottomCenter,
              return LayoutBuilder(builder: (context, constraints) {
                return constraints.maxWidth < 150
                    ? SizedBox.expand(
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )
                    : Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 0,
                          bottom: 10,
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Color(0xffECF2FE),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.2),
                              offset: const Offset(0, 4),
                              blurRadius: 100,
                              spreadRadius: 10000,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: 70,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //       top: 10,
                            //       right: 10,
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         GestureDetector(
                            //           onTap: () {
                            //             tempprovider.updateAnimatedWidth(0);
                            //           },
                            //           child: Icon(
                            //             Icons.arrow_back,
                            //             size: 26,
                            //             color: Colors.black,
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Expanded(
                              flex: 2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image:
                                      AssetImage("assets/logo/female-logo.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Dr. Sharukh Khan",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      connectionState
                                          ? "Connected"
                                          : "Disconnected",
                                      style: TextStyle(
                                        color: connectionState
                                            ? Colors.green[600]
                                            : Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Container(
                                      width: constraints.maxWidth * .6,
                                      height: constraints.maxHeight * .1 <= 50
                                          ? 50
                                          : constraints.maxWidth * .15,
                                      child: MaterialButton(
                                        color: Color(0xffd0ffff),
                                        splashColor: const Color(0xffd0ffff),
                                        focusColor: const Color(0xffd0ffff),
                                        highlightColor: Colors.transparent,
                                        hoverColor: const Color(0xffd0ffff),
                                        hoverElevation: 16,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: Color(0xff9ecccc),
                                          ),
                                        ),
                                        onPressed: () {
                                          // tempprovider.updateAnimatedWidth(0);
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LogInPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "LOG OUT",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      color: Colors.transparent,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Center(
                                              child: Text(
                                                "Download Report",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(
                                            //   width: 10,
                                            // ),
                                            // SvgPicture.asset(
                                            //   'assets/logo/svg_icons/report.svg',
                                            //   color: Colors.black,
                                            //   width: 25,
                                            //   height: 25,
                                            // ),
                                            // SvgPicture.asset(
                                            //   'assets/logo/svg_icons/download.svg',
                                            //   color: Colors.black,
                                            //   width: 25,
                                            //   height: 25,
                                            // ),
                                            // SvgPicture.asset(
                                            //   'assets/logo/svg_icons/print.svg',
                                            //   color: Colors.black,
                                            //   width: 25,
                                            //   height: 25,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        // ),
                      );
              });
            },
          ),
          //     ),
          //   ),
        );
      },
    );
  }
}
