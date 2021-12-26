import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/constants/graph_constants.dart';

class GraphDisplay extends ChangeNotifier {
  bool count = false;
  late ChartSeriesController chartSeriesController;
  final List<double> _list = [];
  final List<double> _tempList = [];
  final List<ChartData> _chartData = [];
  var _previousValue = 10000;
  int maxIndexLength = graphViewRange;
  double _yAxisRangeMax = 130000;
  double _yAxisRangeMin = 10000;
  bool listIsFull = false;

  double get yAxisRangeMax => _yAxisRangeMax;
  double get yAxisRangeMin => _yAxisRangeMin;
  List<ChartData> get chartData => _chartData;

  void updateYAxisRange(dynamic data) {
    _tempList.add(data);
    _yAxisRangeMin =
        _tempList.reduce(min).toDouble() - (_tempList.reduce(max) / 20);
    _yAxisRangeMax =
        _tempList.reduce(max).toDouble() + (_tempList.reduce(max) / 20);
    notifyListeners();
  }

  void _addToChart(int index, double value) {
    _chartData.add(ChartData(index, value));
    chartSeriesController.updateDataSource(
      addedDataIndex: _chartData.length,
    );
  }

  void _removeAllChartData() {
    _chartData.clear();
    chartSeriesController.updateDataSource(
      removedDataIndexes: indexList,
    );
    _tempList.clear();
  }

  void getChartData(Timer timer) {
    updateTest();
    timer.cancel();
  }

  void deadDataCheck(dynamic data) {
    if (_previousValue == _yAxisRangeMin * .7 && _list.isEmpty) {
      _previousValue = data;
    } else {
      if (_previousValue == data) {
        _list.add(data);
        if (_list.length >= 3) {
          data = _yAxisRangeMin;
        }
      } else {
        if (_list.isNotEmpty) {
          _list.clear();
        }
      }
    }
  }

  void _updateChartPoints(int index, dynamic data) {
    if (listIsFull == false) {
      _addToChart(index, data);
      if (index >= maxIndexLength - 1) {
        listIsFull = true;
      }
      debugPrint("index : $index data : $data");
    } else {
      Future.delayed(const Duration(milliseconds: 200));
      _removeAllChartData();
      debugPrint("Upon Removal : ${_chartData.length}");
      Future.delayed(const Duration(milliseconds: 9000));
      debugPrint("LIST_IS_EMPTY");
      listIsFull = false;
    }
  }

  double _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min) as double;
  }

  Future<void> updateTest() async {
    var data = _getRandomInt(10000, 200000);
    // List<dynamic> streamData = await fetchData("data?stream=1");
    // if (streamData[0]['2'] != null) {
    // int data =
    //     (streamData[0]['2'] != null && streamData[0]['2'] >= _yAxisRangeMin * .7
    //         ? streamData[0]['2']
    //         : _yAxisRangeMin * .7) as int;

    try {
      updateYAxisRange(data);
    } catch (e) {
      debugPrint("Y axis ERROR :$e");
    }

    deadDataCheck(data);
    _updateChartPoints(_chartData.length, data);
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}
