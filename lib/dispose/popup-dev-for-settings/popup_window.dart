// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ventilator_ui/connect/tempprovider.dart';
// import 'package:ventilator_ui/home/home_pop_up_stacks/pop_up_map_window.dart';
// import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_alarms.dart';
// import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_modes.dart';
// import 'package:ventilator_ui/home/home_pop_up_stacks/patient_profile.dart';
// import 'package:ventilator_ui/home/informationtab/setting_buttons/setting_buttons.dart';
// import 'package:ventilator_ui/home/informationtab/settings/settings.dart';
// import 'package:ventilator_ui/ui_control_center/transition_manager.dart';

// class PopUpWindow extends StatefulWidget {
//   const PopUpWindow({Key? key}) : super(key: key);

//   @override
//   State<PopUpWindow> createState() => _PopUpWindowState();
// }

// class _PopUpWindowState extends State<PopUpWindow> {
//   bool showSettings = false;
//   bool showAlarms = false;
//   bool showModes = false;

//   void _showSettings() {
//     setState(() {
//       showSettings = !showSettings;
//     });
//   }

//   void _showAlarms() {
//     setState(() {
//       showAlarms = !showAlarms;
//     });
//   }

//   void _showModes() {
//     setState(() {
//       showModes = !showModes;
//     });
//   }

//   Widget _getWidget(Widget widget, bool isActive) {
//     return isActive == true
//         ? widget
//         : Container(
//             width: 0,
//             height: 0,
//             color: Colors.transparent,
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => TempProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => TransitionManager(),
//         )
//       ],
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return Consumer<TransitionManager>(
//             builder: (context, transprovider, child) {
//               return DefaultTextStyle(
//                 style: const TextStyle(inherit: false),
//                 child: Container(
//                   width: constraints.maxWidth,
//                   height: constraints.maxHeight,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [
//                           Colors.yellowAccent,
//                           Colors.tealAccent,
//                         ],
//                         stops: [
//                           .01,
//                           .99,
//                         ]),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: double.maxFinite,
//                     child: Stack(
//                       // alignment: Alignment.center,
//                       children: <Widget>[
//                         const Center(
//                           child: Text(
//                             'VENTO MONITOR',
//                             style: TextStyle(
//                               fontFamily: 'Candara',
//                               fontSize: 108,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         ClipRect(
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                             child: Container(
//                               width: double.infinity,
//                               height: double.maxFinite,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200.withOpacity(0.5),
//                               ),
//                             ),
//                           ),
//                         ),

//                         Center(
//                           child: Container(
//                             width: 500,
//                             height: 500,
//                             child: const PopUpMapWindow(),
//                           ),
//                         ),
//                         // Expanded(
//                         //   child: Container(
//                         //     margin: const EdgeInsets.all(8.0),
//                         //     width: constraints.maxWidth,
//                         //     height: constraints.maxHeight,
//                         //     child: Stack(
//                         //       children: [
//                         //         Visibility(
//                         //           visible: showSettings,
//                         //           child: Container(
//                         //             width: 300,
//                         //             height: 600,
//                         //             color: Colors.transparent,
//                         //             child:
//                         //                 // Stack(
//                         //                 // children: const [
//                         //                 Container(
//                         //               color: Colors.yellowAccent,
//                         //               width: 100,
//                         //               height: 100,
//                         //             ),
//                         //             //   ],
//                         //             // ),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: showModes,
//                         //           child: Container(
//                         //             width: 300,
//                         //             height: 600,
//                         //             color: Colors.transparent,
//                         //             child:
//                         //                 // Stack(
//                         //                 // children: const [
//                         //                 Container(
//                         //               color: Colors.green,
//                         //               width: 100,
//                         //               height: 100,
//                         //             ),
//                         //             //   ],
//                         //             // ),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: showAlarms,
//                         //           child: Container(
//                         //             width: 800,
//                         //             height: 400,
//                         //             color: Colors.transparent,
//                         //             child:
//                         //                 // Stack(
//                         //                 // children: const [
//                         //                 Container(
//                         //               color: Colors.amber,
//                         //               width: 100,
//                         //               height: 100,
//                         //             ),
//                         //             // ],
//                         //             // ),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: true,
//                         //           child: Center(
//                         //             child: Container(
//                         //               width: 200,
//                         //               height: 100,
//                         //               color: Colors.transparent,
//                         //               child: Stack(
//                         //                 children: const [
//                         //                   PopUpMapWindow(),
//                         //                 ],
//                         //               ),
//                         //             ),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: false,
//                         //           child: Center(
//                         //             child: Container(
//                         //               width: 200,
//                         //               height: 300,
//                         //               color: Colors.transparent,
//                         //               child: Stack(
//                         //                 children: const [
//                         //                   PatientProfile(),
//                         //                 ],
//                         //               ),
//                         //             ),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: false,
//                         //           child: Container(
//                         //             width: 250,
//                         //             height: 500,
//                         //             color: Colors.transparent,
//                         //             // child: const SettingButtons(),
//                         //           ),
//                         //         ),
//                         //         Visibility(
//                         //           visible: false,
//                         //           child: Container(
//                         //             width: 250,
//                         //             height: 500,
//                         //             color: Colors.transparent,
//                         //             child: Column(
//                         //               mainAxisAlignment:
//                         //                   MainAxisAlignment.spaceEvenly,
//                         //               children: [
//                         //                 OutlinedButton(
//                         //                   onPressed: _showSettings,
//                         //                   child: const Text(
//                         //                     "settings",
//                         //                     style: TextStyle(
//                         //                         color: Colors.redAccent,
//                         //                         fontSize: 36),
//                         //                   ),
//                         //                 ),
//                         //                 OutlinedButton(
//                         //                   onPressed: _showAlarms,
//                         //                   child: const Text(
//                         //                     "alarms",
//                         //                     style: TextStyle(
//                         //                         color: Colors.redAccent,
//                         //                         fontSize: 36),
//                         //                   ),
//                         //                 ),
//                         //                 OutlinedButton(
//                         //                   onPressed: _showModes,
//                         //                   child: const Text(
//                         //                     "modes",
//                         //                     style: TextStyle(
//                         //                         color: Colors.redAccent,
//                         //                         fontSize: 36),
//                         //                   ),
//                         //                 ),
//                         //               ],
//                         //             ),
//                         //           ),
//                         //         ),
//                         //       ],
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
