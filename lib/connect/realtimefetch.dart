import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:ventilator_ui/connect/services.dart';

class RealTimeClass extends ChangeNotifier {
  late String _pr = '0';
  late String _spo2 = '0';
  late String _pip = '0';
  late String _peep = '0';
  late String _i_e = '0:0';
  late String _dia = '0';
  late String _sys = '0';
  late double _ecg1 = 0.0;

  String get pr => _pr;
  String get spo2 => _spo2;
  String get pip => _pip;
  String get peep => _peep;
  String get i_e => _i_e;
  String get dia => _dia;
  String get sys => _sys;
  double get ecg1 => _ecg1;

  final StreamController _controller = StreamController();

  void notify() {
    notifyListeners();
  }

  Stream updateStreamedData() async* {
    print('Hello');
    // while (true) {
    List<dynamic> streamData = await fetchData("data?stream=1");

    _pr = streamData[0]['1'].toString();
    _spo2 = streamData[0]['2'].toString();
    _pip = streamData[0]['3'].toString();
    _peep = streamData[0]['4'].toString();
    _i_e = streamData[0]['5'].toString();
    _dia = streamData[0]['8'].toString();
    _sys = streamData[0]['9'].toString();
    _ecg1 = streamData[0]['6'];
    // await Future.delayed(const Duration(milliseconds: 3000));
    notifyListeners();

    print(
        "ID : ${streamData[0]['0'].toString()}, $pr, $spo2, $pip, $peep, $i_e, $dia, $sys");
    // yield 1;
    // await Future.delayed(const Duration(milliseconds: 3000));
    // ignore: await_only_futures
    // await sleep(const Duration(seconds: 1));
    // }
  }
}
