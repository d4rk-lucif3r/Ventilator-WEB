// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_2_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_4_graph.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/constants/constant.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_alarms.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_modes.dart';
import 'package:ventilator_ui/home/informationtab/settings/settings.dart';
import 'package:ventilator_ui/ui_control_center/transition_manager.dart';
import 'graphs/graphs.dart';
import 'indicators/indicators.dart';
import 'plusminusbp/plusminusbp.dart';
import 'profile/profile.dart';

class InformationTab extends StatefulWidget {
  const InformationTab({
    Key? key,
    // required this.providerg,
    required this.providerecg1,
    required this.providerecg2,
    required this.providerecg3,
    required this.providerecg4,
    required this.updateState,
  }) : super(key: key);
  // final RealTimeGraph providerg;
  final ECG1 providerecg1;
  final ECG2 providerecg2;
  final ECG3 providerecg3;
  final ECG4 providerecg4;
  final Function updateState;

  @override
  State<InformationTab> createState() => _InformationTabState();
}

class _InformationTabState extends State<InformationTab> {
  bool _showSettings = false;
  bool _showAlarms = false;
  bool _showModes = false;

  void showSettingsFunc() {
    setState(() {
      _showSettings = !_showSettings;
      _showAlarms = false;
      _showModes = false;
    });
  }

  void showAlarmsFunc() {
    setState(() {
      _showAlarms = !_showAlarms;
      _showModes = false;
      _showSettings = false;
    });
  }

  void showModesFunc() {
    setState(() {
      _showModes = !_showModes;
      _showAlarms = false;
      _showSettings = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print("Information Tab Created");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Information Tab Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var w = (MediaQuery.of(context).size.width) / 5.5;
      return Consumer2<TempProvider, TransitionManager>(
        builder: (context, tempprovider, transprovider, child) {
          return Container(
            margin: const EdgeInsets.only(
              bottom: 0,
              top: 10,
              left: 5,
              right: 5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              // color: Color(0xffd0ffff),
              // color: Colors.white,
              // color: Color(0xffECF2FE),
              //d4ffdf
              color: Color(0xffb3e5fc),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2,
                  offset: Offset(4, 4),
                ),
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: Offset(-2, -2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    //TODO: Indicator White
                    const Expanded(
                      flex: 2,
                      child: Indicators(),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            //TODO: PlusMinus
                            Expanded(
                              flex: 1,
                              child: PlusMinusBP(),
                            ),

                            //TODO: Graphs
                            Expanded(
                              flex: 3,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Container(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                    color: Colors.transparent,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Graphs(
                                          // providerg: widget.providerg,
                                          providerecg1: widget.providerecg1,
                                          providerecg2: widget.providerecg2,
                                          providerecg3: widget.providerecg3,
                                          providerecg4: widget.providerecg4,
                                        ),
                                        LayoutBuilder(
                                          builder: (context, constraints) {
                                            var h = constraints.maxHeight - 15;
                                            return Container(
                                              margin: EdgeInsets.only(
                                                top: 5,
                                                left: 20,
                                                right: 10,
                                                bottom: 10,
                                              ),
                                              color: Colors.transparent,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Visibility(
                                                      visible: transprovider
                                                          .showModes,
                                                      child: Container(
                                                        width: (2 / 3) * h,
                                                        height: h,
                                                        color:
                                                            Colors.transparent,
                                                        child: PopUpModes(),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: transprovider
                                                          .showSettings,
                                                      child: Container(
                                                        width: (2 / 3) * h,
                                                        height: h,
                                                        color:
                                                            Colors.transparent,
                                                        child: Settings(),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: transprovider
                                                          .showAlarms,
                                                      child: Container(
                                                        width: (3 / 2) * h,
                                                        height: h,
                                                        color:
                                                            Colors.transparent,
                                                        child: PopUpAlarms(
                                                          updateState: widget
                                                              .updateState,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                            //TODO: Profile
                            Expanded(
                              flex: 1,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Consumer<TransitionManager>(
                                      builder: (context, transprovider, child) {
                                    return DefaultTextStyle(
                                      style: const TextStyle(inherit: false),
                                      child: Container(
                                        width: constraints.maxWidth,
                                        height: constraints.maxHeight,
                                        margin: const EdgeInsets.only(
                                          top: 20,
                                          right: 23,
                                          left: 5,
                                          bottom: 30,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    transprovider.popUpCheck(
                                                        'settings',
                                                        !transprovider
                                                            .showSettings);
                                                    widget.updateState;
                                                  });
                                                },
                                                child: SettingButton(
                                                  title: 'SETTINGS',
                                                  colorValue:
                                                      transprovider.showSettings
                                                          ? Color(0xff29abe2)
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  constraints.maxHeight / 18,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    transprovider.popUpCheck(
                                                        'alarms',
                                                        !transprovider
                                                            .showAlarms);
                                                  });
                                                },
                                                child: SettingButton(
                                                  title: 'ALARM',
                                                  colorValue:
                                                      transprovider.showAlarms
                                                          ? Color(0xff29abe2)
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  constraints.maxHeight / 18,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    transprovider.popUpCheck(
                                                        'modes',
                                                        !transprovider
                                                            .showModes);
                                                  });
                                                },
                                                child: SettingButton(
                                                  title: 'MODE',
                                                  colorValue:
                                                      transprovider.showModes
                                                          ? Color(0xff29abe2)
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  constraints.maxHeight / 18,
                                            ),
                                            Expanded(
                                              child: SettingButton(
                                                title: 'EMERGENCY',
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  constraints.maxHeight / 18,
                                            ),
                                            Expanded(
                                              child: SettingButton(
                                                title: 'RESET',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Visibility(
                //   visible: false,
                //   // visible: _showModes,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: w),
                //     child: PopUpWindowTile(
                //         activeWidget: PopUpModes(),
                //         aspectHeight: 3,
                //         aspectWidth: 2),
                //   ),
                // ),
                // Visibility(
                //   visible: false,
                //   // visible: _showAlarms,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: w),
                //     child: PopUpWindowTile(
                //         activeWidget: PopUpAlarms(),
                //         aspectHeight: 2,
                //         aspectWidth: 3),
                //   ),
                // ),
                // Visibility(
                //   visible: false,
                //   // visible: _showAlarms,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: w),
                //     child: PopUpWindowTile(
                //         activeWidget: Settings(),
                //         aspectHeight: 3,
                //         aspectWidth: 2),
                //   ),
                // ),
                // Visibility(
                //   visible: false,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: w),
                //     child: Column(
                //       children: [
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         //TODO: Indicator White
                //         Expanded(
                //           flex: 2,
                //           child: Visibility(
                //             visible: false,
                //             maintainSize: true,
                //             maintainAnimation: true,
                //             maintainState: true,
                //             child: Container(
                //               color: Colors.transparent,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //           child: Container(
                //             color: Colors.transparent,
                //           ),
                //         ),
                //         Expanded(
                //           flex: 9,
                //           child: Container(
                //             color: Colors.transparent,
                //             child: Row(
                //               children: [
                //                 //TODO: PlusMinus
                //                 // Expanded(
                //                 //   flex: 1,
                //                 //   child: Container(
                //                 //     color: Colors.transparent,
                //                 //   ),
                //                 // ),

                //                 //TODO: Graphs
                //                 Expanded(
                //                   flex: 3,
                //                   child: Container(
                //                     color: Colors.transparent,
                //                   ),
                //                 ),

                //                 //TODO: Profile
                //                 Expanded(
                //                   flex: 1,
                //                   child: Container(),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      );
    });
  }
}

class POPUPWindows extends StatefulWidget {
  const POPUPWindows({Key? key}) : super(key: key);

  @override
  _POPUPWindowsState createState() => _POPUPWindowsState();
}

class _POPUPWindowsState extends State<POPUPWindows> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var h = constraints.maxHeight - 15;
        return Container(
          margin: EdgeInsets.only(
            top: 5,
            left: 20,
            right: 0,
            bottom: 10,
          ),
          color: Colors.lightGreenAccent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                  // visible: _showModes,
                  child: Container(
                    width: (2 / 3) * h,
                    height: h,
                    color: Colors.orange,
                    child: PopUpModes(),
                  ),
                ),
                Visibility(
                  // visible: _showAlarms,
                  child: Container(
                    width: (2 / 3) * h,
                    height: h,
                    color: Colors.orange,
                    child: Settings(),
                  ),
                ),
                Visibility(
                  // visible: _showAlarms,
                  child: Container(
                    width: (3 / 2) * h,
                    height: h,
                    color: Colors.orange,
                    // child: PopUpAlarms(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PopUpWindowTile extends StatefulWidget {
  const PopUpWindowTile({
    Key? key,
    required this.activeWidget,
    required this.aspectHeight,
    required this.aspectWidth,
  }) : super(key: key);

  final Widget activeWidget;
  final int aspectHeight, aspectWidth;

  @override
  _PopUpWindowTileState createState() => _PopUpWindowTileState();
}

class _PopUpWindowTileState extends State<PopUpWindowTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 16.0,
        //   ),
        //   child: ClipRect(
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(
        //         sigmaX: 3.0,
        //         sigmaY: 3.0,
        //         tileMode: TileMode.repeated,
        //       ),
        //       child: Container(
        //         width: double.infinity,
        //         height: double.maxFinite,
        //         decoration: BoxDecoration(
        //           color: Colors.grey.shade200.withOpacity(0.5),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox.expand(
        //   child: Container(
        //     // margin: const EdgeInsets.symmetric(
        //     //   horizontal: 16.0,
        //     // ),
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(.15),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            //TODO: Indicator White
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    //TODO: PlusMinus
                    // Expanded(
                    //   flex: 1,
                    //   child: Container(
                    //     color: Colors.lime,
                    //   ),
                    // ),

                    //TODO: Graphs
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 20,
                          top: 0,
                          bottom: 20,
                        ),
                        alignment: Alignment.centerRight,
                        child: AspectRatio(
                          aspectRatio: widget.aspectWidth / widget.aspectHeight,
                          child: widget.activeWidget,
                        ),
                      ),
                    ),

                    //TODO: Profile
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//TODO: SettingButton
class SettingButton extends StatelessWidget {
  final String title;
  final Color colorValue;

  const SettingButton({
    Key? key,
    required this.title,
    this.colorValue = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: colorValue,
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 1,
            spreadRadius: .5,
            color: Colors.black45,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: colorValue == Colors.white ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
