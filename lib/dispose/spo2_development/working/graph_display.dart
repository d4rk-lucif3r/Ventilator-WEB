import 'dart:math';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/dispose/spo2_development/connect_graph_2.dart';

class GraphECG extends StatelessWidget {
  const GraphECG({
    Key? key,
    required this.provider,
    this.enableDefault,
  }) : super(key: key);

  final ECG provider;
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
                    children: const [
                      AutoSizeText(
                        'SpO2',
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
                child: ECGGraph(
                  provider: provider,
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

class ECGGraph extends StatefulWidget {
  const ECGGraph({
    Key? key,
    required this.provider,
    this.enableDefault,
  }) : super(key: key);

  final ECG provider;
  final bool? enableDefault;

  @override
  _ECGGraphState createState() => _ECGGraphState();
}

class _ECGGraphState extends State<ECGGraph> {
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
  late Timer timer;
  int count = 0;
  Duration duration = const Duration(milliseconds: 1);
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

  // ignore: todo
  //TODO: get the line chart sample with dynamically updated data points.
  LayoutBuilder _buildAnimationSplineChart() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SfCartesianChart(
          enableSideBySideSeriesPlacement: true,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 10,
            right: 15,
          ),
          plotAreaBorderWidth: 0,
          primaryXAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 1,
            ),
            isVisible: true,
            interval: 1,
            minimum: 0,
            maximum: 36,
            placeLabelsNearAxisLine: false,
            majorGridLines: const MajorGridLines(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 1,
            ),
            isVisible: true,
            majorTickLines: const MajorTickLines(
              color: Colors.transparent,
            ),
            majorGridLines: const MajorGridLines(
              color: Colors.black,
              width: .1,
            ),
            axisLine: const AxisLine(width: 0),
            minimum: -10,
            maximum: 110,
          ),
          enableAxisAnimation: false,
          series: _getDefaultSplineSeries(widget.provider),
        );
      },
    );
  }

  List<LineSeries<ChartData, num>> _getDefaultSplineSeries(ECG provider) {
    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
        animationDuration: 10000,
        animationDelay: 0,
        // onRendererCreated: (ChartSeriesController controller) {
        //   provider.chartSeriesController = controller;
        // },
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
      // LineSeries<ChartData, num>(
      //   animationDuration: 1500,
      //   animationDelay: 1500,
      //   width: 2,
      //   dataSource: provider.chartDataTwo,
      //   xValueMapper: (ChartData sales, _) => sales.x,
      //   yValueMapper: (ChartData sales, _) => sales.y,
      //   markerSettings: const MarkerSettings(isVisible: false),
      //   emptyPointSettings: EmptyPointSettings(
      //       mode: EmptyPointMode.gap,
      //       color: Colors.black,
      //       borderColor: Colors.black,
      //       borderWidth: 0),
      //   // dataLabelSettings: const DataLabelSettings(
      //   //   isVisible: false,
      //   // ),
      // ),
    ];
  }

  /// get the spline series sample with dynamically updated data points.

  // List<SplineSeries<ChartData, num>> _getStaticSplineSeries(ECG provider) {
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
    timer.cancel();
  }
}
