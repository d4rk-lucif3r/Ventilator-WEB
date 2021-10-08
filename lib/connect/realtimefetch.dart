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

  String get pr => _pr;
  String get spo2 => _spo2;
  String get pip => _pip;
  String get peep => _peep;
  String get i_e => _i_e;
  String get dia => _dia;
  String get sys => _sys;

  Stream updateStreamedData() async* {
    while (true) {
      List<dynamic> streamData = await fetchData("data?stream=1");

      _pr = streamData[0]['1'].toString();
      _spo2 = streamData[0]['2'].toString();
      _pip = streamData[0]['3'].toString();
      _peep = streamData[0]['4'].toString();
      _i_e = streamData[0]['5'].toString();
      _dia = streamData[0]['8'].toString();
      _sys = streamData[0]['9'].toString();

      notifyListeners();

      print("$pr, $spo2, $pip, $peep, $i_e, $dia, $sys");
      await Future.delayed(Duration(milliseconds: 500));
    }
    // await Future.delayed(Duration(milliseconds: 500));
  }
}
