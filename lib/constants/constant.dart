import 'package:flutter/material.dart';

class UpdateAlarm extends ChangeNotifier {
  final Map _alarmName = {
    0: [
      [null, null],
      ['default', null]
    ],
    1: [
      [100, 60],
      ['PR', null]
    ],
    2: [
      [101, 93],
      ['SpO', '2']
    ],
    3: [
      [30, 20],
      ['PIP', null]
    ],
    4: [
      [6, 4],
      ['PEEP', null]
    ],
    11: [
      [180, 120],
      ['SYS', null]
    ],
    12: [
      [150, 180],
      ['DIA', null]
    ],
  };

  Map get alarmName => _alarmName;

  int _isWhichSwitch = 0;
  int get isWhichSwitch => _isWhichSwitch;

  void notify() {
    notifyListeners();
  }

  void updateAlarmWhich(int index) {
    _isWhichSwitch = index;
    notifyListeners();
  }

  // void updateAlarmWhich(int index, Function function) {
  //   _isWhichSwitch = index;
  //   notifyListeners();
  //   function;
  // }
}
