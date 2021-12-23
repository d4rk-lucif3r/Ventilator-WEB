// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:ventilator_ui/connect/services.dart';

class RealTimeClass extends ChangeNotifier {
  late String _pr = '0';
  late String _spo2 = '0';
  late String _pip = '0';
  late String _peep = '0';
  late String _i_e = '00';
  late String _dia = '0';
  late String _sys = '0';
  late double _ecg1 = 0.0;
  late bool _ispralarm = false;
  late bool _isspo2alarm = false;
  late bool _ispipalarm = false;
  late bool _ispeepalarm = false;
  late bool _issysalarm = false;
  late bool _isdiaalarm = false;
  late bool _isi_ealarm = false;
  final LatLng _lastUpdatedLocation =
      LatLng(28.479261666666666, 76.90485166666667);

  String get pr => _pr;
  String get spo2 => _spo2;
  String get pip => _pip;
  String get peep => _peep;
  String get i_e => _i_e;
  String get dia => _dia;
  String get sys => _sys;
  double get ecg1 => _ecg1;
  bool get ispralarm => _ispralarm;
  bool get isspo2alarm => _isspo2alarm;
  bool get ispipalarm => _ispipalarm;
  bool get ispeepalarm => _ispeepalarm;
  bool get issysalarm => _issysalarm;
  bool get isdiaalarm => _isdiaalarm;
  bool get isi_ealarm => _isi_ealarm;
  LatLng get lastUpdatedLocation => _lastUpdatedLocation;

  // final StreamController _controller = StreamController();

  void notify() {
    notifyListeners();
  }

  void updateStreamedData(Timer timer) async {
    // print('Hello');
    // while (true) {
    // List<dynamic> streamData = await fetchData("data?stream=1");

    // _pr = streamData[0]['1'].toString();
    // _spo2 = streamData[0]['2'].toString();
    // _pip = streamData[0]['3'].toString();
    // _peep = streamData[0]['4'].toString();
    // _i_e = streamData[0]['5'].toString();
    // _sys = streamData[0]['8'].toString();
    // _dia = streamData[0]['9'].toString();
    // _ecg1 = streamData[0]['6'];
    // await Future.delayed(const Duration(milliseconds: 3000));
    _pr = _getRandomDouble(60, 150).toString();
    _spo2 = _getRandomDouble(60, 150).toString();
    _pip = _getRandomDouble(60, 150).toString();
    _peep = _getRandomDouble(60, 150).toString();
    _i_e = _getRandomDouble(11, 16).toString();
    _dia = _getRandomDouble(60, 150).toString();
    _sys = _getRandomDouble(60, 150).toString();
    _ecg1 = _getRandomDouble(60, 150);
    notifyListeners();

    // print(
    //     "ID : ${streamData[0]['0'].toString()}, $pr, $spo2, $pip, $peep, $i_e, $dia, $sys");

    print(" $pr, $spo2, $pip, $peep, $i_e, $dia, $sys");
    timer.cancel();
    // yield 1;
    // await Future.delayed(const Duration(milliseconds: 3000));
    // ignore: await_only_futures
    // await sleep(const Duration(seconds: 1));
    // }
  }

  double _getRandomDouble(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min) as double;
  }

  void pralarm(bool active) {
    if (active) {
      _ispralarm = true;
    } else {
      _ispralarm = false;
    }
    notify();
  }

  void spo2alarm(bool active) {
    if (active) {
      _isspo2alarm = true;
    } else {
      _isspo2alarm = false;
    }
    notify();
  }

  void pipalarm(bool active) {
    if (active) {
      _ispipalarm = true;
    } else {
      _ispipalarm = false;
    }
    notify();
  }

  void peepalarm(bool active) {
    if (active) {
      _ispeepalarm = true;
    } else {
      _ispeepalarm = false;
    }
    notify();
  }

  void sysalarm(bool active) {
    if (active) {
      _issysalarm = true;
    } else {
      _ispralarm = false;
    }
    notify();
  }

  void diaalarm(bool active) {
    if (active) {
      _isdiaalarm = true;
    } else {
      _isdiaalarm = false;
    }
    notify();
  }

  void i_ealarm(bool active) {
    if (active) {
      _isi_ealarm = true;
    } else {
      _isi_ealarm = false;
    }
    notify();
  }
}
