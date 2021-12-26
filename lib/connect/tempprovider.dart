import 'package:flutter/material.dart';

class TempProvider extends ChangeNotifier {
  int _tempValueMax = 0;
  int _tempValueMin = 0;
  double _animatedWidth = 0.0;
  late bool _isSettingsEnabled = false;

  int get tempValueMax => _tempValueMax;
  int get tempValueMin => _tempValueMin;
  double get animatedWidth => _animatedWidth;
  bool get isSettingsEnabled => _isSettingsEnabled;

  void updateAnimatedWidth(double value) {
    _animatedWidth = value;
    notifyListeners();
  }

  void updateSettings(bool value) {
    _isSettingsEnabled = value;
    // debugPrint("in temp");
    notifyListeners();
  }

  void setValue(int valueMax, int valueMin) {
    _tempValueMax = valueMax;
    _tempValueMin = valueMin;
    // notifyListeners();
  }

  void increValueMax(int value) {
    _tempValueMax = value;
    notifyListeners();
    debugPrint('$_tempValueMax');
  }

  void decreValueMax() {
    _tempValueMax--;
    print(_tempValueMax);

    notifyListeners();
  }

  void increValueMin() {
    _tempValueMin++;
    print(_tempValueMin);

    notifyListeners();
  }

  void decreValueMin() {
    _tempValueMin--;
    print(_tempValueMin);

    notifyListeners();
  }
}
