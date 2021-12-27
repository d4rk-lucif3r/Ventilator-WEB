import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/constants/graph_constants.dart';

class GraphDisplay extends ChangeNotifier {
  bool g1Count = false;
  bool g2Count = false;
  bool g3Count = false;
  bool g4Count = false;

  late ChartSeriesController g1ChartSeriesController;
  late ChartSeriesController g2ChartSeriesController;
  late ChartSeriesController g3ChartSeriesController;
  late ChartSeriesController g4ChartSeriesController;

  final List<double> _g1List = [];
  final List<double> _g2List = [];
  final List<double> _g3List = [];
  final List<double> _g4List = [];

  final List<double> _g1TempList = [];
  final List<double> _g2TempList = [];
  final List<double> _g3TempList = [];
  final List<double> _g4TempList = [];

  final List<ChartData> _g1ChartData = [];
  final List<ChartData> _g2ChartData = [];
  final List<ChartData> _g3ChartData = [];
  final List<ChartData> _g4ChartData = [];

  var _g1PreviousValue = 10000;
  var _g2PreviousValue = 10000;
  var _g3PreviousValue = 10000;
  var _g4PreviousValue = 10000;

  int g1MaxIndexLength = graphViewRange;
  int g2MaxIndexLength = graphViewRange;
  int g3MaxIndexLength = graphViewRange;
  int g4MaxIndexLength = graphViewRange;

  double _g1YAxisRangeMax = 130000;
  double _g2YAxisRangeMax = 130000;
  double _g3YAxisRangeMax = 130000;
  double _g4YAxisRangeMax = 130000;

  double _g1YAxisRangeMin = 10000;
  double _g2YAxisRangeMin = 10000;
  double _g3YAxisRangeMin = 10000;
  double _g4YAxisRangeMin = 10000;

  bool g1ListIsFull = false;
  bool g2ListIsFull = false;
  bool g3ListIsFull = false;
  bool g4ListIsFull = false;

  double get g1YAxisRangeMax => _g1YAxisRangeMax;
  double get g2YAxisRangeMax => _g2YAxisRangeMax;
  double get g3YAxisRangeMax => _g3YAxisRangeMax;
  double get g4YAxisRangeMax => _g4YAxisRangeMax;

  double get g1YAxisRangeMin => _g1YAxisRangeMin;
  double get g2YAxisRangeMin => _g1YAxisRangeMin;
  double get g3YAxisRangeMin => _g3YAxisRangeMin;
  double get g4YAxisRangeMin => _g4YAxisRangeMin;

  List<ChartData> get g1ChartData => _g1ChartData;
  List<ChartData> get g2ChartData => _g2ChartData;
  List<ChartData> get g3ChartData => _g3ChartData;
  List<ChartData> get g4ChartData => _g4ChartData;

//TODO: Function starts from here
//Updating Y-axis  range values from the giver data using indentifier
  void updateYAxisRange(dynamic data, String gIdentifier) {
    switch (gIdentifier) {
      case 'g1':
        _g1TempList.add(data);
        _g1YAxisRangeMin =
            _g1TempList.reduce(min).toDouble() - (_g1TempList.reduce(max) / 20);
        _g1YAxisRangeMax =
            _g1TempList.reduce(max).toDouble() + (_g1TempList.reduce(max) / 20);
        break;
      case 'g2':
        _g2TempList.add(data);
        _g2YAxisRangeMin =
            _g2TempList.reduce(min).toDouble() - (_g2TempList.reduce(max) / 20);
        _g3YAxisRangeMax =
            _g2TempList.reduce(max).toDouble() + (_g2TempList.reduce(max) / 20);
        break;
      case 'g3':
        _g3TempList.add(data);
        _g3YAxisRangeMin =
            _g3TempList.reduce(min).toDouble() - (_g3TempList.reduce(max) / 20);
        _g3YAxisRangeMax =
            _g3TempList.reduce(max).toDouble() + (_g3TempList.reduce(max) / 20);
        break;
      case 'g4':
        _g4TempList.add(data);
        _g4YAxisRangeMin =
            _g4TempList.reduce(min).toDouble() - (_g4TempList.reduce(max) / 20);
        _g4YAxisRangeMax =
            _g4TempList.reduce(max).toDouble() + (_g4TempList.reduce(max) / 20);
        break;
      default:
        debugPrint("SOmething might be wrong in UpdateYAxisRange");
    }
    notifyListeners();
  }

//Remove chartData elements using identifier
  void _removeAllChartData(String gIdentifier) {
    switch (gIdentifier) {
      case 'g1':
        _g1ChartData.clear();
        g1ChartSeriesController.updateDataSource(
          removedDataIndexes: g1IndexList,
        );
        _g1TempList.clear();
        break;
      case 'g2':
        _g2ChartData.clear();
        g2ChartSeriesController.updateDataSource(
          removedDataIndexes: g2IndexList,
        );
        _g2TempList.clear();
        break;
      case 'g3':
        _g3ChartData.clear();
        g3ChartSeriesController.updateDataSource(
          removedDataIndexes: g3IndexList,
        );
        _g3TempList.clear();
        break;
      case 'g4':
        _g4ChartData.clear();
        g4ChartSeriesController.updateDataSource(
          removedDataIndexes: g4IndexList,
        );
        _g4TempList.clear();
        break;
      default:
        debugPrint("Something might be wrong in REMOVE_ALL_CHART_DATA");
    }
  }

//CHecking data of dead value using identifier
  void deadDataCheck(dynamic data, String gIdentifier) {
    switch (gIdentifier) {
      case 'g1':
        if (_g1PreviousValue == _g1YAxisRangeMin * .7 && _g1List.isEmpty) {
          _g1PreviousValue = data;
        } else {
          if (_g1PreviousValue == data) {
            _g1List.add(data);
            if (_g1List.length >= 3) {
              data = _g1YAxisRangeMin;
            }
          } else {
            if (_g1List.isNotEmpty) {
              _g1List.clear();
            }
          }
        }
        break;
      case 'g2':
        if (_g2PreviousValue == _g2YAxisRangeMin * .7 && _g2List.isEmpty) {
          _g2PreviousValue = data;
        } else {
          if (_g2PreviousValue == data) {
            _g2List.add(data);
            if (_g2List.length >= 3) {
              data = _g2YAxisRangeMin;
            }
          } else {
            if (_g2List.isNotEmpty) {
              _g2List.clear();
            }
          }
        }
        break;
      case 'g3':
        if (_g3PreviousValue == _g3YAxisRangeMin * .7 && _g3List.isEmpty) {
          _g3PreviousValue = data;
        } else {
          if (_g3PreviousValue == data) {
            _g3List.add(data);
            if (_g3List.length >= 3) {
              data = _g3YAxisRangeMin;
            }
          } else {
            if (_g3List.isNotEmpty) {
              _g3List.clear();
            }
          }
        }
        break;
      case 'g4':
        if (_g4PreviousValue == _g4YAxisRangeMin * .7 && _g4List.isEmpty) {
          _g4PreviousValue = data;
        } else {
          if (_g4PreviousValue == data) {
            _g4List.add(data);
            if (_g4List.length >= 3) {
              data = _g4YAxisRangeMin;
            }
          } else {
            if (_g4List.isNotEmpty) {
              _g4List.clear();
            }
          }
        }
        break;
      default:
        debugPrint("Something might be wrong DEAD_DATA_CHECK");
    }
  }

//Updating chart points from data at index using identifier
  void _updateChartPoints(int index, dynamic data, String gIdentifier) {
    switch (gIdentifier) {
      case 'g1':
        if (g1ListIsFull == false) {
          _addToChart(index, data, gIdentifier);
          if (index >= g1MaxIndexLength - 1) {
            g1ListIsFull = true;
          }
          debugPrint("index : $index data : $data");
        } else {
          Future.delayed(const Duration(milliseconds: 200));
          _removeAllChartData(gIdentifier);
          debugPrint("Upon Removal : ${_g1ChartData.length}");
          Future.delayed(const Duration(milliseconds: 9000));
          debugPrint("LIST_IS_EMPTY");
          g1ListIsFull = false;
        }
        break;
      case 'g2':
        if (g2ListIsFull == false) {
          _addToChart(index, data, gIdentifier);
          if (index >= g2MaxIndexLength - 1) {
            g2ListIsFull = true;
          }
          debugPrint("index : $index data : $data");
        } else {
          Future.delayed(const Duration(milliseconds: 200));
          _removeAllChartData(gIdentifier);
          debugPrint("Upon Removal : ${_g2ChartData.length}");
          Future.delayed(const Duration(milliseconds: 9000));
          debugPrint("LIST_IS_EMPTY");
          g2ListIsFull = false;
        }
        break;
      case 'g3':
        if (g3ListIsFull == false) {
          _addToChart(index, data, gIdentifier);
          if (index >= g3MaxIndexLength - 1) {
            g3ListIsFull = true;
          }
          debugPrint("index : $index data : $data");
        } else {
          Future.delayed(const Duration(milliseconds: 200));
          _removeAllChartData(gIdentifier);
          debugPrint("Upon Removal : ${_g3ChartData.length}");
          Future.delayed(const Duration(milliseconds: 9000));
          debugPrint("LIST_IS_EMPTY");
          g3ListIsFull = false;
        }
        break;
      case 'g4':
        if (g4ListIsFull == false) {
          _addToChart(index, data, gIdentifier);
          if (index >= g4MaxIndexLength - 1) {
            g4ListIsFull = true;
          }
          debugPrint("index : $index data : $data");
        } else {
          Future.delayed(const Duration(milliseconds: 200));
          _removeAllChartData(gIdentifier);
          debugPrint("Upon Removal : ${_g4ChartData.length}");
          Future.delayed(const Duration(milliseconds: 9000));
          debugPrint("LIST_IS_EMPTY");
          g4ListIsFull = false;
        }
        break;
      default:
        debugPrint("Something might be wrong in UPDATE_CHART_POINTs");
    }
  }

//Function for generating random values
  double _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min) as double;
  }

//Updating and controlling graph layout
  Future<void> updateTest(String gIdentifier) async {
    switch (gIdentifier) {
      case 'g1':
        var data = _getRandomInt(10000, 200000);
        // List<dynamic> streamData = await fetchData("data?stream=1");
        // if (streamData[0]['2'] != null) {
        // int data =
        //     (streamData[0]['2'] != null && streamData[0]['2'] >= _yAxisRangeMin * .7
        //         ? streamData[0]['2']
        //         : _yAxisRangeMin * .7) as int;

        try {
          updateYAxisRange(data, gIdentifier);
        } catch (e) {
          debugPrint("---G1--- Y axis ERROR :$e");
        }
        deadDataCheck(data, gIdentifier);
        _updateChartPoints(_g1ChartData.length, data, gIdentifier);
        break;
      case 'g2':
        var data = _getRandomInt(10000, 200000);
        // List<dynamic> streamData = await fetchData("data?stream=1");
        // if (streamData[0]['2'] != null) {
        // int data =
        //     (streamData[0]['2'] != null && streamData[0]['2'] >= _yAxisRangeMin * .7
        //         ? streamData[0]['2']
        //         : _yAxisRangeMin * .7) as int;

        try {
          updateYAxisRange(data, gIdentifier);
        } catch (e) {
          debugPrint("---G2--- Y axis ERROR :$e");
        }
        deadDataCheck(data, gIdentifier);
        _updateChartPoints(_g2ChartData.length, data, gIdentifier);

        break;
      case 'g3':
        var data = _getRandomInt(10000, 200000);
        // List<dynamic> streamData = await fetchData("data?stream=1");
        // if (streamData[0]['2'] != null) {
        // int data =
        //     (streamData[0]['2'] != null && streamData[0]['2'] >= _yAxisRangeMin * .7
        //         ? streamData[0]['2']
        //         : _yAxisRangeMin * .7) as int;

        try {
          updateYAxisRange(data, gIdentifier);
        } catch (e) {
          debugPrint("---G3--- Y axis ERROR :$e");
        }
        deadDataCheck(data, gIdentifier);
        _updateChartPoints(_g3ChartData.length, data, gIdentifier);

        break;
      case 'g4':
        var data = _getRandomInt(10000, 200000);
        // List<dynamic> streamData = await fetchData("data?stream=1");
        // if (streamData[0]['2'] != null) {
        // int data =
        //     (streamData[0]['2'] != null && streamData[0]['2'] >= _yAxisRangeMin * .7
        //         ? streamData[0]['2']
        //         : _yAxisRangeMin * .7) as int;

        try {
          updateYAxisRange(data, gIdentifier);
        } catch (e) {
          debugPrint("---G4--- Y axis ERROR :$e");
        }
        deadDataCheck(data, gIdentifier);
        _updateChartPoints(_g4ChartData.length, data, gIdentifier);

        break;
      default:
        debugPrint("SOmething might be wrong in UPDATE_TEST");
    }
  }

//Fetching and Updating chart data from API using identifier
  void getChartData(Timer timer, String gIdentifier) {
    switch (gIdentifier) {
      case 'g1':
        updateTest('g1');
        break;
      case 'g2':
        updateTest('g2');
        break;
      case 'g3':
        updateTest('g3');
        break;
      case 'g4':
        updateTest('g4');
        break;
      default:
        debugPrint("Something might be wrong in GET_CHART_DATA");
    }
    timer.cancel();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}
