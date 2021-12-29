import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_2_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_4_graph.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/home/informationtab/graphs/ecg2.dart';
import 'package:ventilator_ui/home/informationtab/graphs/ecg4.dart';
import 'package:ventilator_ui/home/informationtab/graphs/graph_window.dart';
import 'ecg1.dart';
import 'ecg3.dart';

bool newGraph = true;

class Graphs extends StatelessWidget {
  const Graphs({
    Key? key,
    required this.syncprovider,
    // required this.providerecg1,
    // required this.providerecg2,
    // required this.providerecg3,
    // required this.providerecg4,
  }) : super(key: key);

  // final RealTimeGraph providerg;
  // final ECG1 providerecg1;
  // final ECG2 providerecg2;
  // final ECG3 providerecg3;
  // final ECG4 providerecg4;
  final ChartSync syncprovider;

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
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: GraphWindow(
              syncprovider: syncprovider,
              graphName: 'g1',
              unit: 'mV',
              title: 'ECG(II)',
              enableDefault: false,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphWindow(
              syncprovider: syncprovider,
              graphName: 'g2',
              unit: 'mV',
              title: 'ECG(V)',
              enableDefault: false,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphWindow(
              syncprovider: syncprovider,
              graphName: 'g3',
              unit: 'O2 %',
              title: 'SpO2',
              enableDefault: false,
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Expanded(
            flex: 1,
            child: GraphWindow(
              syncprovider: syncprovider,
              graphName: 'g4',
              unit: 'L',
              title: 'FLOW',
              enableDefault: false,
            ),
          ),
        ],
      ),
    );
  }
}

    // Widget _getColumn() {
    //   return newGraph
    //       ? Column(
    //           children: [
    //             Expanded(
    //               flex: 1,
    //               child: GraphWindow(
    //                 syncprovider: syncprovider,
    //                 graphName: 'g1',
    //                 unit: 'mV',
    //                 title: 'ECG(II)',
    //                 enableDefault: false,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphWindow(
    //                 syncprovider: syncprovider,
    //                 graphName: 'g2',
    //                 unit: 'mV',
    //                 title: 'ECG(V)',
    //                 enableDefault: false,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphWindow(
    //                 syncprovider: syncprovider,
    //                 graphName: 'g3',
    //                 unit: 'O2 %',
    //                 title: 'SpO2',
    //                 enableDefault: false,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphWindow(
    //                 syncprovider: syncprovider,
    //                 graphName: 'g4',
    //                 unit: 'L',
    //                 title: 'FLOW',
    //                 enableDefault: false,
    //               ),
    //             ),
    //           ],
    //         )
    //       : Column(
    //           children: [
    //             Expanded(
    //               flex: 1,
    //               child: GraphECG1(
    //                 providerg: providerecg1,
    //                 enableDefault: false,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphECG2(
    //                 provider: providerecg2,
    //                 enableDefault: true,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphECG3(
    //                 provider: providerecg3,
    //                 enableDefault: true,
    //               ),
    //             ),
    //             SizedBox(
    //               height: h / 60,
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: GraphECG4(
    //                 provider: providerecg4,
    //                 enableDefault: true,
    //               ),
    //             ),
    //           ],
    //         );
    // }
