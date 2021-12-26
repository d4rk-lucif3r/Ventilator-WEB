import 'package:flutter/material.dart';

class PlusMinusProvider extends ChangeNotifier {
  late int _vt = 600;
  late int _rr = 12;
  late int _fio2 = 21;

  int get vt => _vt;
  int get rr => _rr;
  int get fio2 => _fio2;

  void updateVT(String value) {
    switch (value) {
      case 'incr':
        _vt += 1;
        break;
      default:
        _vt -= 1;
    }
    notifyListeners();
  }

  void updateRR(String value) {
    switch (value) {
      case 'incr':
        _rr += 1;
        break;
      default:
        _rr -= 1;
    }
    notifyListeners();
  }

  void updateFIO2(String value) {
    switch (value) {
      case 'incr':
        _fio2 += 1;
        break;
      default:
        _fio2 -= 1;
    }
    notifyListeners();
  }
}
