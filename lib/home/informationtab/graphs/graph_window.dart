import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/constants/graph_constants.dart';

class GraphWindow extends StatefulWidget {
  GraphWindow({
    Key? key,
    required this.graphName,
    this.unit = '',
    this.title = '',
    required this.syncprovider,
    this.enableDefault,
  }) : super(key: key);

  final String graphName;
  final String unit;
  final String title;
  final ChartSync syncprovider;
  final bool? enableDefault;

  @override
  State<GraphWindow> createState() => _GraphWindowState();
}

class _GraphWindowState extends State<GraphWindow> {
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 0,
                    left: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      widget.unit,
                      style: const TextStyle(
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
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    GraphInWindow(
                      syncprovider: widget.syncprovider,
                      graphName: widget.graphName,
                      // enableDefault: enableDefault,
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

class GraphInWindow extends StatefulWidget {
  const GraphInWindow({
    Key? key,
    required this.syncprovider,
    required this.graphName,
    this.enableDefault,
  }) : super(key: key);

  final ChartSync syncprovider;
  final String graphName;
  final bool? enableDefault;

  @override
  _GraphInWindowState createState() => _GraphInWindowState();
}

class _GraphInWindowState extends State<GraphInWindow> {
  @override
  Widget build(BuildContext context) {
    return _buildAnimationSplineChart(widget.graphName);
  }

//Getting graph name using graphName
  double getInterval(String graphName) {
    switch (graphName) {
      case 'g1':
        return graphViewXInterval;
      case 'g2':
        return graphViewXInterval;
      case 'g3':
        return graphViewXInterval;
      case 'g4':
        return graphViewXInterval;
      default:
        debugPrint("Something might be wring in GET_INTERVAL");
        return 0;
    }
  }

//Getting maximum range of X-axis using graphName
  double getXRangeMax(String graphName) {
    switch (graphName) {
      case 'g1':
        return graphViewXRangemax + 1;
      case 'g2':
        return graphViewXRangemax + 1;
      case 'g3':
        return graphViewXRangemax + 1;
      case 'g4':
        return graphViewXRangemax + 1;
      default:
        debugPrint("Something might be wring in GET_X_RANGE_MAX");
        return 0;
    }
  }

//Getting minimum range of Y-axis using graphName
  double getYRangeMax(String graphName) {
    switch (graphName) {
      case 'g1':
        return widget.syncprovider.g1YAxisRangeMax;
      case 'g2':
        return widget.syncprovider.g2YAxisRangeMax;
      case 'g3':
        return widget.syncprovider.g3YAxisRangeMax;
      case 'g4':
        return widget.syncprovider.g4YAxisRangeMax;
      default:
        debugPrint("Something might be wring in GET_Y_RANGE_MAX");
        return 0;
    }
  }

//Getting minimum range of Y-axis using graphName
  double getYRangeMin(String graphName) {
    switch (graphName) {
      case 'g1':
        return widget.syncprovider.g1YAxisRangeMin;
      case 'g2':
        return widget.syncprovider.g2YAxisRangeMin;
      case 'g3':
        return widget.syncprovider.g3YAxisRangeMin;
      case 'g4':
        return widget.syncprovider.g4YAxisRangeMin;
      default:
        debugPrint("Something might be wring in GET_Y_RANGE_MIN");
        return 0;
    }
  }

//Getting chartSeriesController using graphName
  // ChartSeriesController getChartSeriesController(String graphName, ChartSeriesController controller) {
  //   switch (graphName) {
  //     case 'g1':
  //       return widget.syncprovider.g1ChartSeriesController = ;
  //     case 'g2':
  //       return widget.syncprovider.g2ChartSeriesController;
  //     case 'g3':
  //       return widget.syncprovider.g3ChartSeriesController;
  //     case 'g4':
  //       return widget.syncprovider.g4ChartSeriesController;
  //     default:
  //       debugPrint(
  //           "Something might be wring in GET_GET_CHART_SERIES_CONTROLLER");
  //       return widget.syncprovider.g1ChartSeriesController;
  //   }
  // }

//Getting chartData {Object} using graphName
  List<ChartData> getChartData(String graphName) {
    switch (graphName) {
      case 'g1':
        return widget.syncprovider.g1ChartData;
      case 'g2':
        return widget.syncprovider.g2ChartData;
      case 'g3':
        return widget.syncprovider.g3ChartData;
      case 'g4':
        return widget.syncprovider.g4ChartData;
      default:
        debugPrint("Something might be wring in GET_CHART_DATA");
        return [ChartData(0, 0)];
    }
  }

  LayoutBuilder _buildAnimationSplineChart(String graphName) {
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
            interval: getInterval(graphName),
            minimum: -1,
            maximum: getXRangeMax(graphName),
            placeLabelsNearAxisLine: false,
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
            minimum: getYRangeMin(graphName),
            maximum: getYRangeMax(graphName),
          ),
          enableAxisAnimation: true,
          series: _getDefaultSplineSeries(widget.syncprovider, graphName),
        );
      },
    );
  }

  // get the spline series sample with dynamically updated data points.
  List<SplineSeries<ChartData, num>> _getDefaultSplineSeries(
      ChartSync provider, String graphName) {
    return <SplineSeries<ChartData, num>>[
      SplineSeries<ChartData, num>(
        animationDuration: 0,
        animationDelay: 0,
        onRendererCreated: (ChartSeriesController controller) {
          switch (graphName) {
            case 'g1':
              widget.syncprovider.g1ChartSeriesController = controller;
              break;
            case 'g2':
              widget.syncprovider.g2ChartSeriesController = controller;
              break;
            case 'g3':
              widget.syncprovider.g3ChartSeriesController = controller;
              break;
            case 'g4':
              widget.syncprovider.g4ChartSeriesController = controller;
              break;
            default:
              debugPrint(
                  "Something might be wring in GET_GET_CHART_SERIES_CONTROLLER");
          }
        },
        width: 2,
        dataSource: getChartData(graphName),
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: false),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    // timer.cancel();
  }
}
