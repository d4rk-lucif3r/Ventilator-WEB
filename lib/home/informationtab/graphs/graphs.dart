import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_2_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_4_graph.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/home/informationtab/graphs/ecg2.dart';
import 'package:ventilator_ui/home/informationtab/graphs/ecg4.dart';
import 'ecg1.dart';
import 'ecg3.dart';

class Graphs extends StatelessWidget {
  const Graphs({
    Key? key,
    required this.providerg,
    required this.providerecg1,
    required this.providerecg2,
    required this.providerecg3,
    required this.providerecg4,
  }) : super(key: key);

  final RealTimeGraph providerg;
  final ECG1 providerecg1;
  final ECG2 providerecg2;
  final ECG3 providerecg3;
  final ECG4 providerecg4;

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      color: Colors.transparent,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Colors.black45,
      //       blurRadius: 2,
      //       offset: Offset(4, 4),
      //     ),
      //     BoxShadow(
      //       color: Colors.black26,
      //       blurRadius: 1,
      //       offset: Offset(-1, -1),
      //     ),
      //   ],
      // ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: GraphECG1(
              providerg: providerecg1,
              enableDefault: false,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphECG2(
              provider: providerecg2,
              enableDefault: true,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphECG3(
              provider: providerecg3,
              enableDefault: true,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphECG4(
              provider: providerecg4,
              enableDefault: true,
            ),
          ),
        ],
      ),
    );
  }
}
