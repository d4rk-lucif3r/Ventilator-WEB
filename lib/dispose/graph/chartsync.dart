// import 'dart:math';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:ventilator_ui/connect/realtimefetch.dart';
// import 'package:ventilator_ui/connect/services.dart';

// class RealTimeGraph extends ChangeNotifier {
//   double count = 0;
//   Timer? _timer;
//   late Random? random;
//   ChartSeriesController? _chartSeriesController;

//   final List<ChartData> _chartData = [
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//     ChartData(0, 0),
//   ];

//   List<ChartData> get chartData => _chartData;

//   // void getInitialChartData() {
//   //   _chartData.add(ChartData(0, 0)); //1
//   //   _chartData.add(ChartData(0, 0)); //2
//   //   _chartData.add(ChartData(0, 0)); //3
//   //   _chartData.add(ChartData(0, 0)); //4
//   //   _chartData.add(ChartData(0, 0)); //5
//   //   _chartData.add(ChartData(0, 0)); //6
//   //   _chartData.add(ChartData(0, 0)); //7
//   //   _chartData.add(ChartData(0, 0)); //8
//   //   _chartData.add(ChartData(0, 0)); //9
//   //   _chartData.add(ChartData(0, 0)); //10
//   //   _chartData.add(ChartData(0, 0)); //11
//   //   _chartData.add(ChartData(0, 0)); //12
//   //   _chartData.add(ChartData(0, 0)); //13
//   //   _chartData.add(ChartData(0, 0)); //14
//   //   _chartData.add(ChartData(0, 0)); //15
//   //   _chartData.add(ChartData(0, 0)); //16
//   //   _chartData.add(ChartData(0, 0)); //17
//   //   _chartData.add(ChartData(0, 0)); //18
//   //   _chartData.add(ChartData(0, 0)); //19
//   //   _chartData.add(ChartData(0, 0)); //20
//   // }

//   //Get the random data points
//   Future<void> getChartData() async {
//     var testValue = 1;
//     count += 1.0;
//     // if (chartData.length > 20) {
//     List<dynamic> streamData = await fetchData("data?stream=1");
//     // var data = count % 5 == 0 ? _getRandomInt(60, 100) : 0.0;
//     // _chartData.add(ChartData(count, data));
//     // debugPrint("${data.toString()}, ${count.toString()}");

//     _chartData.add(ChartData(count, streamData[0]['6']));
//     debugPrint(streamData[0]['6'].toString());
//     // if (_chartData.length <= 20) {
//     _chartData.removeAt(0);
//     _chartSeriesController?.updateDataSource(
//       addedDataIndexes: <int>[_chartData.length - 1],
//       removedDataIndexes: <int>[0],
//     );
//     // } else {
//     //   if (_chartData.length < 1) {
//     //     for (int n = 0; n < 20; n++) {
//     //       _chartSeriesController?.updateDataSource(
//     //         addedDataIndexes: <int>[_chartData.length - 1],
//     //       );
//     //     }
//     //   } else {
//     //     _chartSeriesController?.updateDataSource(
//     //       addedDataIndexes: <int>[_chartData.length - 1],
//     //     );
//     //   }
//     // }
//     // } else {
//     //   // for (int i = 0; i < 1; i++) {
//     //   //   _chartData.add(ChartData(0, 0));
//     //   //   if (i == 20) count = i.toDouble();
//     //   // }

//     //   _chartData.add(ChartData(0, 0)); //1
//     //   _chartData.add(ChartData(0, 0)); //2
//     //   _chartData.add(ChartData(0, 0)); //3
//     //   _chartData.add(ChartData(0, 0)); //4
//     //   _chartData.add(ChartData(0, 0)); //5
//     //   _chartData.add(ChartData(0, 0)); //6
//     //   _chartData.add(ChartData(0, 0)); //7
//     //   _chartData.add(ChartData(0, 0)); //8
//     //   _chartData.add(ChartData(0, 0)); //9
//     //   _chartData.add(ChartData(0, 0)); //10
//     //   _chartData.add(ChartData(0, 0)); //11
//     //   _chartData.add(ChartData(0, 0)); //12
//     //   _chartData.add(ChartData(0, 0)); //13
//     //   _chartData.add(ChartData(0, 0)); //14
//     //   _chartData.add(ChartData(0, 0)); //15
//     //   _chartData.add(ChartData(0, 0)); //16
//     //   _chartData.add(ChartData(0, 0)); //17
//     //   _chartData.add(ChartData(0, 0)); //18
//     //   _chartData.add(ChartData(0, 0)); //19
//     //   _chartData.add(ChartData(0, 0)); //20

//     // }
//     _timer?.cancel();
//     debugPrint(testValue.toString());
//   }

//   List<ChartData> getStaticGraph() {
//     List<ChartData> data = [];
//     for (int i = 0; i < 20; i++) {
//       data.add(ChartData(0, 0));
//     }
//     return data;
//   }

// //Get Random Data
//   double _getRandomInt(int min, int max) {
//     final Random random = Random();
//     return min + random.nextInt(max - min) as double;
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y);

//   final double x;
//   final double y;
// }
