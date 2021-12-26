// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ventilator_ui/ui_control_center/transition_manager.dart';

// class SettingButtons extends StatefulWidget {
//   const SettingButtons({Key? key}) : super(key: key);

//   @override
//   State<SettingButtons> createState() => _SettingButtonsState();
// }

// class _SettingButtonsState extends State<SettingButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Consumer<TransitionManager>(
//             builder: (context, transprovider, child) {
//           return DefaultTextStyle(
//             style: const TextStyle(inherit: false),
//             child: Container(
//               width: constraints.maxWidth,
//               height: constraints.maxHeight,
//               margin: const EdgeInsets.only(
//                 top: 20,
//                 right: 23,
//                 left: 5,
//                 bottom: 30,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         transprovider.popUpCheck('settings');
//                         debugPrint("${transprovider.showSettings}");
//                       },
//                       child: SettingButton(
//                         title: 'SETTINGS',
//                         onPressed: () {
//                           setState(() {
//                             transprovider.popUpCheck('settings');
//                           });
//                           debugPrint("${transprovider.showSettings}");
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: constraints.maxHeight / 18,
//                   ),
//                   Expanded(
//                     child: SettingButton(
//                       title: 'ALARM',
//                       onPressed: () {
//                         transprovider.popUpCheck('alarms');
//                         debugPrint("${transprovider.showAlarms}");
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: constraints.maxHeight / 18,
//                   ),
//                   Expanded(
//                     child: SettingButton(
//                       title: 'MODE',
//                       onPressed: () {
//                         transprovider.popUpCheck('modes');
//                         debugPrint("${transprovider.showModes}");
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: constraints.maxHeight / 18,
//                   ),
//                   Expanded(
//                     child: SettingButton(
//                       title: 'EMERGENCY',
//                       onPressed: () {
//                         debugPrint("Emergency is pressed");
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: constraints.maxHeight / 18,
//                   ),
//                   Expanded(
//                     child: SettingButton(
//                       title: 'RESET',
//                       onPressed: () {
//                         debugPrint("Reset is pressed");
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }

// class SettingButton extends StatelessWidget {
//   final String title;
//   final Function onPressed;

//   const SettingButton({
//     Key? key,
//     required this.title,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       margin: const EdgeInsets.symmetric(
//         horizontal: 45,
//         vertical: 5,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             offset: Offset(3, 3),
//             blurRadius: 1,
//             spreadRadius: .5,
//             color: Colors.black45,
//           ),
//         ],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 18,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
