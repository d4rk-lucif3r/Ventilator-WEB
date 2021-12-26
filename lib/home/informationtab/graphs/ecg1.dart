import 'dart:math';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/constants/graph_constants.dart';

class GraphECG1 extends StatelessWidget {
  const GraphECG1({
    Key? key,
    required this.providerg,
    this.enableDefault,
  }) : super(key: key);

  final ECG1 providerg;
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
                width: 30,
                child: const Padding(
                  padding: EdgeInsets.only(
                    right: 0,
                    left: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'mV',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: constraints.maxHeight * .85,
              //   width: 1,
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 2,
              //     ),
              //     color: Colors.black,
              //   ),
              // ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(children: [
                    Positioned(
                      top: 15,
                      left: 25,
                      child: Container(
                        color: Colors.transparent,
                        width: 70,
                        height: 20,
                        child: const Text(
                          'ECG1 (II)',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ECG1Graph(
                      provider: providerg,
                      enableDefault: enableDefault,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ECG1Graph extends StatefulWidget {
  const ECG1Graph({
    Key? key,
    required this.provider,
    this.enableDefault,
  }) : super(key: key);

  final ECG1 provider;
  final bool? enableDefault;

  @override
  _ECG1GraphState createState() => _ECG1GraphState();
}

class _ECG1GraphState extends State<ECG1Graph> {
  // late SalesData chartData;

  // void _updateDataSource(Timer timer) {
  //   chartData.add(SalesData(count.toString(), _getRandomInt(10, 100)));
  //   if (chartData.length == 20) {
  //     chartData.removeAt(0);
  //     _chartSeriesController?.updateDataSource(
  //       addedDataIndexes: <int>[chartData.length - 1],
  //       removedDataIndexes: <int>[0],
  //     );
  //   } else {
  //     _chartSeriesController?.updateDataSource(
  //       addedDataIndexes: <int>[chartData.length - 1],
  //     );
  //   }
  //   count = count! + 1.0;
  // }
  // late Timer timer;
  // int count = 0;
  // Duration duration = const Duration(milliseconds: 1);
  @override
  Widget build(BuildContext context) {
    // timer = Timer.periodic(
    //   duration,
    //   (timer) => setState(
    //     () {
    //       widget.provider.getChartData(timer);
    //       count++;
    //       // debugPrint(count.toString());
    //       timer.cancel();
    //     },
    //   ),
    // );
    return _buildAnimationSplineChart();
  }

  /// get the spline chart sample with dynamically updated data points.
  LayoutBuilder _buildAnimationSplineChart() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SfCartesianChart(
          enableSideBySideSeriesPlacement: true,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 5,
            right: 15,
          ),
          plotAreaBorderWidth: 0,
          primaryXAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
            isVisible: true,
            interval: graphViewXInterval,
            minimum: 0,
            maximum: graphViewXRangemax,
            placeLabelsNearAxisLine: false,
            // axisLine: const AxisLine(
            //   width: 0,
            //   color: Colors.transparent,
            // ),
            majorGridLines: const MajorGridLines(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
            isVisible: true,
            majorTickLines: const MajorTickLines(
              color: Colors.transparent,
              // width: 0,
            ),
            majorGridLines: const MajorGridLines(
              color: Colors.black,
              width: 0,
            ),
            // axisLine: const AxisLine(width: 0),
            minimum: -10,
            maximum: 110,
          ),
          enableAxisAnimation: false,
          series: _getDefaultSplineSeries(widget.provider),
        );
      },
    );
  }

  /// get the spline series sample with dynamically updated data points.
  List<LineSeries<ChartData, num>> _getDefaultSplineSeries(ECG1 provider) {
    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
        animationDuration: 2500,
        animationDelay: 0,
        onRendererCreated: (ChartSeriesController controller) {
          provider.chartSeriesController = controller;
        },
        width: 2,
        dataSource: provider.chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: false),
        // emptyPointSettings: EmptyPointSettings(
        //     mode: EmptyPointMode.gap,
        //     color: Colors.transparent,
        //     borderColor: Colors.transparent,
        //     borderWidth: 0),
        // dataLabelSettings: const DataLabelSettings(
        //   isVisible: false,
        // ),
      ),
    ];
  }

  // List<SplineSeries<ChartData, num>> _getStaticSplineSeries(ECG1 provider) {
  //   return <SplineSeries<ChartData, num>>[
  //     SplineSeries<ChartData, num>(
  //       animationDuration: .1,
  //       dataSource: provider.chartData,
  //       xValueMapper: (ChartData sales, _) => sales.x,
  //       yValueMapper: (ChartData sales, _) => sales.y,
  //       markerSettings: const MarkerSettings(isVisible: false),
  //       // dataLabelSettings: const DataLabelSettings(
  //       //   isVisible: false,
  //       // ),
  //     ),
  //   ];
  // }

  @override
  void dispose() {
    super.dispose();
    // timer.cancel();
  }
}
