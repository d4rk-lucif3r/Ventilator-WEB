import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/constants/constant.dart';
import 'package:ventilator_ui/dispose/spo2_development/connect_graph_2.dart';
import 'package:ventilator_ui/dispose/spo2_development/working/graph_display.dart';

class GraphTest extends StatefulWidget {
  const GraphTest({Key? key}) : super(key: key);

  @override
  _GraphTestState createState() => _GraphTestState();
}

class _GraphTestState extends State<GraphTest>
    with SingleTickerProviderStateMixin {
  // double _line1 = 0.0;
  // double _line2 = 0.0;
  // double _line3 = 0.0;
  // double _line4 = 0.0;
  // double _line5 = 0.0;
  // double _line6 = 0.0;
  // double _line7 = 0.0;
  // double _line8 = 0.0;
  // double _line9 = 0.0;
  // late Animation<double> line1,
  //     line2,
  //     line3,
  //     line4,
  //     line5,
  //     line6,
  //     line7,
  //     line8,
  //     line9;
  // late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 5000),
    // );
    // line1 = Tween<double>(begin: .01, end: 1).animate(controller)
    //   ..addListener(() {
    //     debugPrint("${line1.value}");
    //     setState(() {
    //       _line1 = line1.value;
    //     });
    //   })
    //   ..addStatusListener((status) {
    //     // debugPrint("$status");
    //     if (status == AnimationStatus.completed) {
    //       controller.reverse();
    //     } else {
    //       controller.forward(from: 0);
    //     }
    //   });

    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ECG(),
        ),
      ],
      child: Consumer<ECG>(
        builder: (context, provider, child) {
          return Container(
            width: double.infinity,
            height: double.maxFinite,
            color: Colors.transparent,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: GraphECG(provider: provider),
                ),
                MaterialButton(
                  onPressed: () {
                    // setState(() => provider.removeAnimator())
                  },
                  color: Colors.blueAccent,
                  child: const Text(
                    "Animate",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
