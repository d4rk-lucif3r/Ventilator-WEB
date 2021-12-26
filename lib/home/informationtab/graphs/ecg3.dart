import 'dart:math';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/constants/graph_constants.dart';

class GraphECG3 extends StatelessWidget {
  const GraphECG3({
    Key? key,
    required this.provider,
    this.enableDefault,
  }) : super(key: key);

  final ECG3 provider;
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
                      'O2 %',
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
                          'SpO2',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ECG3Graph(
                      provider: provider,
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

class ECG3Graph extends StatefulWidget {
  const ECG3Graph({
    Key? key,
    required this.provider,
    this.enableDefault,
  }) : super(key: key);

  final ECG3 provider;
  final bool? enableDefault;

  @override
  _ECG3GraphState createState() => _ECG3GraphState();
}

class _ECG3GraphState extends State<ECG3Graph> {
  @override
  Widget build(BuildContext context) {
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
            minimum: -1,
            maximum: graphViewXRangemax + 1,
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
            minimum: widget.provider.yAxisRangeMin,
            maximum: widget.provider.yAxisRangeMax,
          ),
          enableAxisAnimation: true,
          series: _getDefaultSplineSeries(widget.provider),
        );
      },
    );
  }

  /// get the spline series sample with dynamically updated data points.
  List<SplineSeries<ChartData, num>> _getDefaultSplineSeries(ECG3 provider) {
    return <SplineSeries<ChartData, num>>[
      SplineSeries<ChartData, num>(
        animationDuration: 0,
        animationDelay: 0,
        onRendererCreated: (ChartSeriesController controller) {
          provider.chartSeriesController = controller;
        },
        width: 2,
        dataSource: provider.chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: false),
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
