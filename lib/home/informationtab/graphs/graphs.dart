import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'ecg1.dart';

class Graphs extends StatelessWidget {
  const Graphs({
    Key? key,
    required this.providerg,
  }) : super(key: key);

  final RealTimeGraph providerg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 10,
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
            child: Graph(
              providerg: providerg,
              enableDefault: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(
              providerg: providerg,
              enableDefault: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(
              providerg: providerg,
              enableDefault: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(
              providerg: providerg,
              enableDefault: true,
            ),
          ),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({
    Key? key,
    required this.providerg,
    this.enableDefault,
  }) : super(key: key);

  final RealTimeGraph providerg;
  final bool? enableDefault;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTextStyle(
        style: const TextStyle(
          inherit: false,
        ),
        child: Container(
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.white,
            //#828388
            // color: Colors.blueGrey.shade300.withOpacity(.4),
            //#ECF2FE
            // color: const Color(0xffECF2FE),

            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(4, 4),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Colors.black12,
                offset: Offset(-1, -1),
                // spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: constraints.maxHeight,
                width: 40,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'ECG1',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        minFontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .85,
                width: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: ECG1(
                  provider: providerg,
                  enableDefault: enableDefault,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
