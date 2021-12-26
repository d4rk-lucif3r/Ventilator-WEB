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
  ChartSeriesController? _chartOneSeriesController;
  ChartSeriesController? _chartTwoSeriesController;
  ChartSeriesController? _chartSeriesController;

  var tempValue = <double>[0, 0, 0, 0, 0];
  var tempNextIndex = [0, 1, 2, 3, 4];
  late int _seriesSelector;
  bool listIsFull = false;

  // List listOne = [];
  // List listTwo = [];

  final List<ChartData> _chartData = <ChartData>[
    (ChartData(-1, 0)),
    (ChartData(0, 20)),
    (ChartData(1, 40)),
    (ChartData(2, 60)),
    (ChartData(3, 80)),
    (ChartData(4, 0)),
    (ChartData(5, 20)),
    (ChartData(6, 40)),
    (ChartData(7, 60)),
    (ChartData(8, 80)),
    (ChartData(9, 0)),
    (ChartData(10, 20)),
    (ChartData(11, 40)),
    (ChartData(12, 60)),
    (ChartData(13, 80)),
    (ChartData(14, 0)),
    (ChartData(15, 20)),
    (ChartData(16, 40)),
    (ChartData(17, 60)),
    (ChartData(18, 80)),
    (ChartData(19, 0)),
    (ChartData(20, 20)),
    (ChartData(21, 40)),
    (ChartData(22, 60)),
    (ChartData(23, 80)),
    (ChartData(24, 0)),
    (ChartData(25, 20)),
    (ChartData(26, 40)),
    (ChartData(27, 60)),
    (ChartData(28, 80)),
    (ChartData(29, 0)),
    (ChartData(30, 20)),
    (ChartData(31, 40)),
    (ChartData(32, 60)),
    (ChartData(33, 80)),
    (ChartData(34, 0)),
    (ChartData(35, 20)),
    (ChartData(36, 40)),
  ];
  // final List<ChartData> _chartDataOne = [
  //   // (ChartData(-1, 0)),
  //   // (ChartData(0, 20)),
  //   // (ChartData(1, 40)),
  //   // (ChartData(2, 60)),
  //   // (ChartData(3, 80)),
  //   // (ChartData(4, 0)),
  //   // (ChartData(5, 20)),
  //   // (ChartData(6, 40)),
  //   // (ChartData(7, 60)),
  //   // (ChartData(8, 80)),
  //   // (ChartData(9, 0)),
  //   // (ChartData(10, 20)),
  //   // (ChartData(11, 40)),
  //   // (ChartData(12, 60)),
  //   // (ChartData(13, 80)),
  // ];
  // final List<ChartData> _chartDataTwo = [
  //   // // (ChartData(14, 0)),
  //   // (ChartData(15, 20)),
  //   // (ChartData(16, 40)),
  //   // (ChartData(17, 60)),
  //   // (ChartData(18, 80)),
  //   // (ChartData(19, 0)),
  //   // (ChartData(20, 20)),
  //   // (ChartData(21, 40)),
  //   // (ChartData(22, 60)),
  //   // (ChartData(23, 80)),
  //   // (ChartData(24, 0)),
  //   // (ChartData(25, 20)),
  //   // (ChartData(26, 40)),
  //   // (ChartData(27, 60)),
  //   // (ChartData(28, 80)),
  //   // (ChartData(29, 0)),
  //   // (ChartData(30, 20)),
  //   // // (ChartData(31, 40)),
  //   // // (ChartData(32, 60)),
  //   // // (ChartData(33, 80)),
  //   // // (ChartData(34, 0)),
  //   // // (ChartData(35, 20)),
  //   // // (ChartData(36, 40)),
  // ];
  final List<ChartData> _chartDataOne = [];
  final List<ChartData> _chartDataTwo = [];

  List<ChartData> get chartDataOne => _chartDataOne;
  List<ChartData> get chartDataTwo => _chartDataTwo;

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

  void _addToChartOne(int index, double value) {
    _chartDataOne.add(ChartData(index, value));
    _chartSeriesController?.updateDataSource(
      addedDataIndex: _chartDataOne.length - 1,
      // updatedDataIndex: _chartDataOne.length - 1,
    );
    debugPrint("ChartOne : $index $value ");
  }

  void _addToChartTwo(int index, double value) {
    _chartDataTwo.add(ChartData(index, value));
    _chartSeriesController?.updateDataSource(
      addedDataIndex: _chartDataTwo.length - 1,
      // updatedDataIndex: _chartDataTwo.length - 1,
    );
    debugPrint("ChartTwo : $index $value ");
  }

  void _removeFromChartOne(int index) {
    if (_chartDataOne.isNotEmpty) {
      if (_chartDataOne.length == 1) {
        debugPrint("ONE_ELEMENT_IS_LEFT_IN_LIST_ONE");
      } else {
        _chartDataOne.removeAt(index);
        _chartSeriesController?.updateDataSource(
          // updatedDataIndex: 0,
          removedDataIndex: index,
        );
        _chartSeriesController?.animate();
      }
    }
    // debugPrint("ChartTwo : $index $value ");
  }

  void _removeAllChartData() {
    _chartDataOne.clear();
    _chartSeriesController?.updateDataSource(
      removedDataIndexes: <int>[
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
        29
      ],
    );
  }

  void _removeFromChartTwo(int index) {
    _chartDataOne.removeAt(index);
    _chartSeriesController?.updateDataSource(
      // updatedDataIndex: 0,
      removedDataIndex: index,
    );
  }

  void getChartData(Timer timer) {
    try {
      fetch();
    } catch (e) {
      debugPrint("$e  Fetch");
    }
    try {
      update(0);
    } catch (e) {
      debugPrint("$e  UPDATE_0");
    }
    try {
      update(1);
    } catch (e) {
      debugPrint("$e  UPDATE_1");
    }
    try {
      update(2);
    } catch (e) {
      debugPrint("$e  UPDATE_2");
    }
    try {
      update(3);
    } catch (e) {
      debugPrint("$e  UPDATE_3");
    }
    try {
      update(4);
    } catch (e) {
      debugPrint("$e  UPDATE_4");
    }

    timer.cancel();
  }

  void update(int identifier) {
    int index = tempNextIndex[identifier];
    double value = tempValue[identifier];
    // int series = seriesSelector;

    if (listIsFull == false) {
      _addToChartOne(index, value);
      debugPrint("List is not full");
      if (_chartDataOne.length >= 30) {
        listIsFull = true;
        _seriesSelector = 2;
        debugPrint("$_seriesSelector");
        debugPrint("LIST_FULL_CASE_1_SERIES_SWITCH");

        if (_chartDataTwo.isEmpty) {
          _removeFromChartOne(0);
          debugPrint("CASE_1_REMOVE_ONE");
        }
      }
      debugPrint("CASE_1_ENDS_HERE");
    } else {
      switch (_seriesSelector) {
        case 1:
          // if ((listOne.length + listTwo.length) <= 29) {
          //   if ((listOne.length + listTwo.length) == 29) {
          //     listTwo.removeAt(0);
          //     listOne.add(value);
          //   } else {
          //     print("Something might be wrong in CASE_1");
          //   }
          // } else {
          //   listTwo.removeAt(0);
          //   listOne.add(value);
          // }
          // if (listOne.length == 30 && listTwo.isEmpty) {
          //   seriesSelector = 2;
          //   if (listOne.length < 30) {
          //     listOne.removeAt(0);
          //   }
          // }
          debugPrint("$_seriesSelector");

          if ((_chartDataOne.length + _chartDataTwo.length) <= 29) {
            if ((_chartDataOne.length + _chartDataTwo.length) == 29) {
              _removeFromChartTwo(index + 1);
              _addToChartOne(index, value);
              debugPrint("CASE_1_29");
            } else {
              print("Something might be wrong in CASE_1");
            }
          } else {
            _removeFromChartTwo(index + 1);
            _addToChartOne(index, value);
            debugPrint("CASE_1_MORE_THAN_29");
          }
          if (_chartDataOne.length == 30 && _chartDataTwo.isEmpty) {
            _seriesSelector = 2;
            debugPrint("CASE_1_SERIES_SWITCH");
            if (_chartDataOne.length > 29) {
              _removeFromChartOne(0);
              debugPrint("CASE_1_REMOVE_ONE");
            }
          }
          debugPrint("CASE_1_ENDS_HERE");
          break;
        case 2:
//           if ((listOne.length + listTwo.length) <= 29) {
//             if ((listOne.length + listTwo.length) == 29) {
//               listOne.removeAt(0);
//               listTwo.add(value);
//             } else {
//               print("Something might be wrong in CASE_2");
//             }
//           } else {
//             listOne.removeAt(0);
//             listTwo.add(value);
// //           print("SELECT 2");
//           }
//           if (listTwo.length == 30 && listOne.isEmpty) {
//             seriesSelector = 1;
//             if (listTwo.length < 30) {
//               listTwo.removeAt(0);
//             }
//           }

          if ((_chartDataOne.length + _chartDataTwo.length) <= 29) {
            if ((_chartDataOne.length + _chartDataTwo.length) == 29) {
              if (_chartDataOne.isNotEmpty) {
                _removeFromChartOne(index + 1);
              }
              _addToChartTwo(index, value);
              debugPrint("CASE_2_29");
            } else {
              print("Something might be wrong in CASE_2");
            }
          } else {
            if (_chartDataOne.isNotEmpty) {
              if (chartDataTwo.length == 1) {
                debugPrint("ONE_ELEMENT_IS_LEFT_IN_LIST_ONE");
              } else {
                _removeFromChartOne(index + 1);
              }
            }

            _addToChartTwo(index, value);
            debugPrint("CASE_2_MORE_THAN_29");
          }
          // if (_chartDataTwo.length >= 29 && _chartDataOne.isEmpty) {
          if (_chartDataTwo.length >= 30 && _chartDataOne.isEmpty) {
            _seriesSelector = 1;
            debugPrint("CASE_2_SERIES_SWITCH");
            debugPrint("Element at INDEX_0${_chartDataTwo.elementAt(0).y}");

            _removeFromChartTwo(0);
            debugPrint("CASE_2_REMOVE_TWO");
          }
          //   else if (_chartDataTwo.length == 29 && _chartDataOne.isEmpty) {
          //     _seriesSelector = 1;
          //     debugPrint("CASE_2_SERIES_SWITCH");

          //     _removeFromChartTwo();
          //     debugPrint("CASE_2_REMOVE_TWO_29");
          //   }
          // }
          // debugPrint(
          //     "Element at                               INDEX_$index : ${_chartDataTwo.elementAt(index).y}");

          debugPrint("CASE_2_ENDS_HERE");
          break;
        default:
          print("Something is wrong in UPADTE");
      }
    }
    debugPrint(
        "                        ${_chartDataOne.length}  ${_chartDataTwo.length}");
    // debugPrint("${tempNextIndex[identifier]}");
    for (int ii = 0; ii < _chartDataOne.length; ii++) {
      print("${_chartDataOne.elementAt(ii).y},");
    }
    // stdout.write("\n");
    for (int ii = 0; ii < _chartDataTwo.length; ii++) {
      print(" --- ${_chartDataTwo.elementAt(ii).y}");
    }
    tempNextIndex[identifier] = index > 24 ? index - 25 : index + 5;
    // debugPrint("${tempNextIndex[identifier]}");

    // print("${listOne} --- ${listTwo}");
    // debugPrint("${_chartDataOne.length} --- ${_chartDataTwo.length}");
  }

// void updateZero(int identifier) {
//   int index = tempNextIndex[identifier];
//   double value = tempValue[identifier];
//   int series = seriesSelector;

//   switch (series) {
//     case 1:
//       if ((listOne.length + listTwo.length) <= 29) {
//         print("Something might be wrong in CASE_1_ZERO");
//       } else {
//         listTwo.removeAt(0);
//         listOne.add(value);
//       }

//       if (listOne.length == 31) {
//         seriesSelector = 2;
//         listOne.removeAt(0);
//       }
//       break;
//     case 2:
//       if ((listOne.length + listTwo.length) <= 29) {
//         print("Something might be wrong in CASE_1_ZERO");
//       } else {
//         listTwo.removeAt(0);
//         listTwo.add(value);
//       }

//       if (listTwo.length == 31) {
//         seriesSelector = 1;
//         listTwo.removeAt(0);
//       }
//       break;
//     default:
//       print("Something might wrong in UPDATE_ZERO");
//   }
//   tempNextIndex[identifier] = index > 25 ? index - 25 : index + 5;
//   print("${listOne} ---- ${listTwo}");
// }

  void fetch() {
    var data = _getRandomInt(80, 100);
    tempValue[1] = data * .25;
    tempValue[2] = data * .50;
    tempValue[3] = data * .75;
    tempValue[4] = data * 1.0;
  }

  // List<LineSeries<ChartData, num>> getDefaultSplineSeries() {
  //   return <LineSeries<ChartData, num>>[
  //     LineSeries<ChartData, num>(
  //       animationDuration: 10,
  //       animationDelay: 0,
  //       dataSource: chartData,
  //       xValueMapper: (ChartData sales, _) => sales.x,
  //       yValueMapper: (ChartData sales, _) => sales.y,
  //       markerSettings: const MarkerSettings(isVisible: false),
  //       // dataLabelSettings: const DataLabelSettings(
  //       //   isVisible: false,
  //       // ),
  //     ),
  //   ];
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
