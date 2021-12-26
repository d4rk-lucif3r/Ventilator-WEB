import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/services.dart';

class ECG extends ChangeNotifier {
  double count = 0;
  late Random random;
  late ChartSeriesController chartSeriesController;

  // int maxIndexLength = 30;
  // int atleastIndexValue = 24;
  // int lastIndexValue = 25;
  // int incrementIndexValue = 5;

  int maxIndexLength = 54;
  int atleastIndexValue = 44;
  int lastIndexValue = 45;
  int incrementIndexValue = 9;

  var tempValue = <double>[0, 0, 0, 0, 0, 0, 0, 0, 0];
  var tempNextIndex = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  // late int _seriesSelector;
  List<int> indexList = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
  ];
  bool listIsFull = false;

  final List<ChartData> _chartData = [
    ChartData(0, 0),
    ChartData(1, 1),
    ChartData(2, 4),
    ChartData(3, 9),
    ChartData(4, 16),
    ChartData(5, 25),
    ChartData(6, 36),
    ChartData(7, 49),
    ChartData(8, 64),
    ChartData(9, 82),
    ChartData(10, 0),
    ChartData(11, 1),
    ChartData(12, 4),
    ChartData(13, 9),
    ChartData(14, 16),
    ChartData(15, 25),
    ChartData(16, 36),
    ChartData(17, 49),
    ChartData(18, 64),
    ChartData(19, 82),
    ChartData(20, 0),
    ChartData(21, 1),
    ChartData(22, 4),
    ChartData(23, 9),
    ChartData(24, 16),
    ChartData(25, 25),
    ChartData(26, 36),
    ChartData(27, 49),
    ChartData(28, 64),
    ChartData(29, 82),
    ChartData(30, 0),
    ChartData(31, 1),
    ChartData(32, 4),
    ChartData(33, 9),
    ChartData(34, 16),
    ChartData(35, 25),
    ChartData(36, 36),
    ChartData(37, 49),
    ChartData(38, 64),
    ChartData(39, 82),
    ChartData(40, 0),
    ChartData(41, 1),
    ChartData(42, 4),
    ChartData(43, 9),
    ChartData(44, 16),
    ChartData(45, 25),
    ChartData(46, 36),
    ChartData(47, 49),
    ChartData(48, 64),
    ChartData(49, 82),
    ChartData(50, 0),
    ChartData(51, 1),
    ChartData(52, 4),
    ChartData(53, 9),
  ];

  void removeAnimator() {
    // for (int i = 0; i < 10; i++) {
    //   _chartData.add(ChartData(i, (i * i).toDouble()));
    // }
    // _chartSeriesController?.updateDataSource(
    //   addedDataIndexes: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    // );
    _chartData.clear();
    chartSeriesController.updateDataSource(
      removedDataIndexes: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    );
    // _chartSeriesController?.animate();
  }

  final List<ChartData> _chartDataOne = [];
  final List<ChartData> _chartDataTwo = [];

  List<ChartData> get chartDataOne => _chartDataOne;
  List<ChartData> get chartDataTwo => _chartDataTwo;
  // ChartSeriesController? get chartSeriesController => chartSeriesController;
  List<ChartData> get chartData => _chartData;

  //Get the random data points
  // Future<void> getChartData(Timer timer) async {
  //   count += 1.0;
  //   var data = count % 5 == 0 ? _getRandomInt(25, 60) : 0.0;
  //   debugPrint("$count");
  //   // debugPrint("Values 3: ${data.toString()}, ${count.toString()}");
  //   sleep(Duration(milliseconds: 200));
  //   if (_chartData.length >= 30) {
  //     // if (count >= 30) {
  //     _chartData.add(ChartData(count, data));
  //     _chartData.removeAt(0);
  //     _chartSeriesController?.updateDataSource(
  //       addedDataIndex: _chartData.length - 1,
  //       removedDataIndexes: <int>[0],
  //     );
  //   } else {
  //     _chartData.add(ChartData(count, data));
  //     _chartSeriesController?.updateDataSource(
  //       addedDataIndex: _chartData.length - 1,
  //     );
  //   }
  //   timer.cancel();
  //   // debugPrint(testValue.toString());
  // }

  void _addToChart(int index, double value) {
    _chartData.add(ChartData(index, value));
    // chartSeriesController.updateDataSource(
    //   addedDataIndex: _chartData.length - 1,
    // );
    // _chartSeriesController?.animate();
    debugPrint(
        "ChartOne :                                                   $index $value ");
  }

  void _updateIndexes(List<int> indexes) {
    chartSeriesController.updateDataSource(
      addedDataIndexes: indexes,
    );
  }

  void _removeAllChartData() {
    _chartData.clear();
    chartSeriesController.updateDataSource(
      removedDataIndexes: indexList,
    );
  }

  Future<void> getChartData(Timer timer) async {
    fetch();
    // Future.delayed(const Duration(milliseconds: 400));
    updateTest(0);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(1);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(2);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(3);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(4);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(5);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(6);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(7);
    // Future.delayed(const Duration(milliseconds: 50));
    updateTest(8);
    // Future.delayed(const Duration(milliseconds: 50));
    _updateIndexes([
      tempNextIndex[0],
      tempNextIndex[1],
      tempNextIndex[2],
      tempNextIndex[3],
      tempNextIndex[4],
      tempNextIndex[5],
      tempNextIndex[6],
      tempNextIndex[7],
      tempNextIndex[8],
    ]);
    debugPrint(
        "........................................................${tempNextIndex[0]},${tempNextIndex[1]},${tempNextIndex[2]},${tempNextIndex[3]},${tempNextIndex[4]},${tempNextIndex[5]},${tempNextIndex[6]},${tempNextIndex[7]},${tempNextIndex[8]}");
    timer.cancel();
  }
  // void getChartData(Timer timer) {
  //   try {
  //     fetch();
  //   } catch (e) {
  //     debugPrint("$e  Fetch");
  //   }
  //   try {
  //     updateTest(0);
  //   } catch (e) {
  //     debugPrint("$e  UPDATE_0");
  //   }
  //   try {
  //     updateTest(1);
  //   } catch (e) {
  //     debugPrint("$e  UPDATE_1");
  //   }
  //   try {
  //     updateTest(2);
  //   } catch (e) {
  //     debugPrint("$e  UPDATE_2");
  //   }
  //   try {
  //     updateTest(3);
  //   } catch (e) {
  //     debugPrint("$e  UPDATE_3");
  //   }
  //   try {
  //     updateTest(4);
  //   } catch (e) {
  //     debugPrint("$e  UPDATE_4");
  //   }

  //   timer.cancel();
  // }

  void updateTest(int identifier) {
    int index = tempNextIndex[identifier];
    double value = tempValue[identifier];

    if (listIsFull == false) {
      _addToChart(index, value);
      debugPrint("LIST_IS_NOT_FULL");
      if (_chartData.length >= maxIndexLength) {
        listIsFull = true;
        debugPrint("LIST_FULL");
      }
      debugPrint("CASE_1_ENDS_HERE_WITH_FALSE");
    } else {
      _removeAllChartData();
      // _addToChart(index, value);
      debugPrint("LIST_IS_EMPTY");
      listIsFull = false;
      // debugPrint("LIST_EMPTY_INITIALIZE_SERIES");
      // debugPrint("CASE_1_ENDS_HERE_WITH_TRUE");
    }
    tempNextIndex[identifier] = index > atleastIndexValue
        ? index - lastIndexValue
        : index + incrementIndexValue;
  }

  // void update(int identifier) {
  //   int index = tempNextIndex[identifier];
  //   double value = tempValue[identifier];
  //   // int series = seriesSelector;

  //   if (listIsFull == false) {
  //     _addToChartOne(index, value);
  //     debugPrint("List is not full");
  //     if (_chartDataOne.length >= 30) {
  //       listIsFull = true;
  //       _seriesSelector = 2;
  //       debugPrint("$_seriesSelector");
  //       debugPrint("LIST_FULL_CASE_1_SERIES_SWITCH");

  //       if (_chartDataTwo.isEmpty) {
  //         _removeFromChartOne(0);
  //         debugPrint("CASE_1_REMOVE_ONE");
  //       }
  //     }
  //     debugPrint("CASE_1_ENDS_HERE");
  //   } else {
  //     switch (_seriesSelector) {
  //       case 1:
  //         debugPrint("$_seriesSelector");

  //         if ((_chartDataOne.length + _chartDataTwo.length) <= 29) {
  //           if ((_chartDataOne.length + _chartDataTwo.length) == 29) {
  //             _removeFromChartTwo(index + 1);
  //             _addToChartOne(index, value);
  //             debugPrint("CASE_1_29");
  //           } else {
  //             print("Something might be wrong in CASE_1");
  //           }
  //         } else {
  //           _removeFromChartTwo(index + 1);
  //           _addToChartOne(index, value);
  //           debugPrint("CASE_1_MORE_THAN_29");
  //         }
  //         if (_chartDataOne.length == 30 && _chartDataTwo.isEmpty) {
  //           _seriesSelector = 2;
  //           debugPrint("CASE_1_SERIES_SWITCH");
  //           if (_chartDataOne.length > 29) {
  //             _removeFromChartOne(0);
  //             debugPrint("CASE_1_REMOVE_ONE");
  //           }
  //         }
  //         debugPrint("CASE_1_ENDS_HERE");
  //         break;
  //       case 2:
  //         if ((_chartDataOne.length + _chartDataTwo.length) <= 29) {
  //           if ((_chartDataOne.length + _chartDataTwo.length) == 29) {
  //             if (_chartDataOne.isNotEmpty) {
  //               _removeFromChartOne(index + 1);
  //             }
  //             _addToChartTwo(index, value);
  //             debugPrint("CASE_2_29");
  //           } else {
  //             print("Something might be wrong in CASE_2");
  //           }
  //         } else {
  //           if (_chartDataOne.isNotEmpty) {
  //             if (chartDataTwo.length == 1) {
  //               debugPrint("ONE_ELEMENT_IS_LEFT_IN_LIST_ONE");
  //             } else {
  //               _removeFromChartOne(index + 1);
  //             }
  //           }

  //           _addToChartTwo(index, value);
  //           debugPrint("CASE_2_MORE_THAN_29");
  //         }
  //         // if (_chartDataTwo.length >= 29 && _chartDataOne.isEmpty) {
  //         if (_chartDataTwo.length >= 30 && _chartDataOne.isEmpty) {
  //           _seriesSelector = 1;
  //           debugPrint("CASE_2_SERIES_SWITCH");
  //           debugPrint("Element at INDEX_0${_chartDataTwo.elementAt(0).y}");

  //           _removeFromChartTwo(0);
  //           debugPrint("CASE_2_REMOVE_TWO");
  //         }
  //         debugPrint("CASE_2_ENDS_HERE");
  //         break;
  //       default:
  //         print("Something is wrong in UPADTE");
  //     }
  //   }
  //   debugPrint(
  //       "                        ${_chartDataOne.length}  ${_chartDataTwo.length}");
  //   // debugPrint("${tempNextIndex[identifier]}");
  //   for (int ii = 0; ii < _chartDataOne.length; ii++) {
  //     print("${_chartDataOne.elementAt(ii).y},");
  //   }
  //   // stdout.write("\n");
  //   for (int ii = 0; ii < _chartDataTwo.length; ii++) {
  //     print(" --- ${_chartDataTwo.elementAt(ii).y}");
  //   }
  //   tempNextIndex[identifier] = index > 24 ? index - 25 : index + 5;
  // }

  void fetch() {
    var data = 80;
    tempValue[1] = data * .125;
    tempValue[2] = data * .25;
    tempValue[3] = data * .375;
    tempValue[4] = data * .5;
    tempValue[5] = data * .5;
    tempValue[6] = data * .625;
    tempValue[7] = data * .875;
    tempValue[8] = data * .1;
  }

  //Get Random Data
  double _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min) as double;
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int? x;
  final double? y;
}
