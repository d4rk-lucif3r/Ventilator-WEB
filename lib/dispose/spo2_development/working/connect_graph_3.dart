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

  int maxIndexLength = 120;
  // int atleastIndexValue = 44;
  // int lastIndexValue = 45;
  // int incrementIndexValue = 9;

  // var tempValue = <double>[0, 0, 0, 0, 0, 0, 0, 0, 0];
  // var tempNextIndex = [0, 1, 2, 3, 4, 5, 6, 7, 8];
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
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119
  ];
  bool listIsFull = false;

  final List<ChartData> _chartData = [];
  List<ChartData> get chartData => _chartData;

  void _addToChart(int index, double value) {
    _chartData.add(ChartData(index, value));
    chartSeriesController.updateDataSource(
      addedDataIndex: _chartData.length - 1,
    );
    // debugPrint(
    //     "ChartOne :                                                   $index $value ");
  }

  void _removeAllChartData() {
    _chartData.clear();
    chartSeriesController.updateDataSource(
      removedDataIndexes: indexList,
    );
  }

  void getChartData(Timer timer) {
    // Future.delayed(const Duration(milliseconds: 400));
    updateTest(_chartData.length);
    timer.cancel();
  }

  Future<void> updateTest(int identifier) async {
    int index = identifier;
    if (listIsFull == false) {
      _addToChart(index, _getRandomInt(1, 100));
      // debugPrint("LIST_IS_NOT_FULL");
      if (_chartData.length >= maxIndexLength) {
        listIsFull = true;
        // debugPrint("LIST_FULL");

      }
      // debugPrint("CASE_1_ENDS_HERE_WITH_FALSE");
    } else {
      Future.delayed(const Duration(milliseconds: 200));
      _removeAllChartData();
      Future.delayed(const Duration(milliseconds: 9000));
      // _addToChart(index, value);
      debugPrint("LIST_IS_EMPTY");
      listIsFull = false;
    }
  }

  // void fetch() {
  //   var data = 80;
  //   tempValue[1] = data * .125;
  //   tempValue[2] = data * .25;
  //   tempValue[3] = data * .375;
  //   tempValue[4] = data * .5;
  //   tempValue[5] = data * .5;
  //   tempValue[6] = data * .625;
  //   tempValue[7] = data * .875;
  //   tempValue[8] = data * .1;
  // }

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
