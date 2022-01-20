import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/services.dart';

class AlarmSync extends ChangeNotifier {
  //TODO: Alarm real data
  late int _prmax = 100;
  late int _prmin = 60;
  late int _spo2max = 100;
  late int _spo2min = 93;
  late int _pipmax = 30;
  late int _pipmin = 20;
  late int _peepmax = 6;
  late int _peepmin = 4;
  late int _sysmax = 180;
  late int _sysmin = 120;
  late int _diamax = 130;
  late int _diamin = 80;
  late int _tv = 600;
  late int _rr = 12;
  late int _fio2 = 10;

//TODO: Alarm temporary data
  late int _tempprmax = 100;
  late int _tempprmin = 60;
  late int _tempspo2max = 100;
  late int _tempspo2min = 93;
  late int _temppipmax = 30;
  late int _temppipmin = 20;
  late int _temppeepmax = 6;
  late int _temppeepmin = 4;
  late int _tempsysmax = 180;
  late int _tempsysmin = 120;
  late int _tempdiamax = 130;
  late int _tempdiamin = 80;
  late int _temptv = 600;
  late int _temprr = 12;
  late int _tempfio2 = 10;

//TODO: Alarm real data getter
  int get prmax => _prmax;
  int get prmin => _prmin;
  int get spo2max => _spo2max;
  int get spo2min => _spo2min;
  int get pipmax => _pipmax;
  int get pipmin => _pipmin;
  int get peepmax => _peepmax;
  int get peepmin => _peepmin;
  int get sysmax => _sysmax;
  int get sysmin => _sysmin;
  int get diamax => _diamax;
  int get diamin => _diamin;
  int get tv => _tv;
  int get rr => _rr;
  int get fio2 => _fio2;

//TODO: Alarm temporary data getter
  int get tempprmax => _tempprmax;
  int get tempprmin => _tempprmin;
  int get tempspo2max => _tempspo2max;
  int get tempspo2min => _tempspo2min;
  int get temppipmax => _temppipmax;
  int get temppipmin => _temppipmin;
  int get temppeepmax => _temppeepmax;
  int get temppeepmin => _temppeepmin;
  int get tempsysmax => _tempsysmax;
  int get tempsysmin => _tempsysmin;
  int get tempdiamax => _tempdiamax;
  int get tempdiamin => _tempdiamin;
  int get temptv => _temptv;
  int get temprr => _temprr;
  int get tempfio2 => _tempfio2;

//TODO: Alarm temp data update
  void tempAlarmUpdate(String value, int intValue) {
    switch (value) {
      case 'tempprmax':
        _tempprmax = intValue;
        break;
      case 'tempprmin':
        _tempprmin = intValue;
        break;
      case 'tempspo2min':
        _tempspo2min = intValue;
        break;
      case 'tempspo2max':
        _tempspo2max = intValue;
        break;
      case 'temppipmin':
        _temppipmin = intValue;
        break;
      case 'temppipmax':
        _temppipmax = intValue;
        break;
      case 'temppeepmin':
        _temppeepmin = intValue;
        break;
      case 'temppeepmax':
        _temppeepmax = intValue;
        break;
      case 'tempsysmin':
        _tempsysmin = intValue;
        break;
      case 'tempsysmax':
        _tempsysmax = intValue;
        break;
      case 'tempdiamin':
        _tempdiamin = intValue;
        break;
      case 'tempdiamax':
        _tempdiamax = intValue;
        break;
    }
  }

//TODO: Alarm three temp data update
  void tempUpdateThree(String value, int intValue) {
    switch (value) {
      case 'temptv':
        _temptv = intValue;
        break;
      case 'temprr':
        _temprr = intValue;
        break;
      case 'tempfio2':
        _tempfio2 = intValue;
        break;
    }
  }

//TODO: Alarm real data sending
  void pushAlarmUpdate() async {
    var alarmUpdateValue = <String, int>{
      "prmin": _prmin,
      "prmax": _prmax,
      "spo2min": _spo2min,
      "spo2max": _spo2max,
      "pipmin": _pipmin,
      "pipmax": _pipmax,
      "peepmin": _peepmin,
      "peepmax": _peepmax,
      "sysmin": _sysmin,
      "sysmax": _sysmax,
      "diamin": _diamin,
      "diamax": _diamax,
    };
    Future<String> postStatus = postToStream("alarms", alarmUpdateValue);
    debugPrint("$postStatus");
  }

//TODO: Alarm three data sending
  void pushUpdateThree() async {
    var threeUpdateValue = <String, int>{
      "tv": _tv,
      "rr": _rr,
      "fio2": _fio2,
    };
    Future<String> postStatus = postToStream("alarms", threeUpdateValue);
  }

//TODO: Fetching Alarm real data
  void fetchAlarm() async {
    List<dynamic> defaultAlarms = await fetchData("alarms?stream=1");

    _prmax = defaultAlarms[0]['1'];
    _prmin = defaultAlarms[0]['2'];
    _spo2max = defaultAlarms[0]['3'];
    _spo2min = defaultAlarms[0]['4'];
    _pipmax = defaultAlarms[0]['5'];
    _pipmin = defaultAlarms[0]['6'];
    _peepmax = defaultAlarms[0]['7'];
    _peepmin = defaultAlarms[0]['8'];
    _diamax = defaultAlarms[0]['9'];
    _diamin = defaultAlarms[0]['10'];
    _sysmax = defaultAlarms[0]['11'];
    _sysmin = defaultAlarms[0]['12'];
    _tv = defaultAlarms[0]['13'];
    _rr = defaultAlarms[0]['14'];
    _fio2 = defaultAlarms[0]['15'];

    print(
        "\nPR MAX: $prmax, \nPR MIN: $prmin, \nSpO2 MAX: $spo2max, \nSpO2 MIN: $spo2min, \nPIP MAX: $pipmax, \nPIP MIN: $pipmin, \nPEEP MAX: $peepmax, \nPEEP MIN: $peepmin, \nDIA MAX: $diamax, \nDIA MIN: $diamin, \nSYS MAX: $sysmax, \nSYS MIN: $diamin, \nTV: $tv, \nRR: $rr, \nFiO2: $fio2");
  }

//TODO: Local Update Alarm
  void localAlarmUpdate(
      int identifier, int updatedMaxAlarmData, int updatedMinAlarmData) {
    switch (identifier) {
      case 1:
        _prmax = updatedMaxAlarmData;
        _prmin = updatedMinAlarmData;
        break;
      case 2:
        _spo2max = updatedMaxAlarmData;
        _spo2min = updatedMinAlarmData;
        break;
      case 3:
        _pipmax = updatedMaxAlarmData;
        _pipmin = updatedMinAlarmData;
        break;
      case 4:
        _peepmax = updatedMaxAlarmData;
        _peepmin = updatedMinAlarmData;
        break;
      case 11:
        _sysmax = updatedMaxAlarmData;
        _sysmin = updatedMinAlarmData;
        break;
      case 12:
        _diamax = updatedMaxAlarmData;
        _diamin = updatedMinAlarmData;
        break;
    }
    notifyListeners();
  }

  int _isWhichSwitch = 0;
  int get isWhichSwitch => _isWhichSwitch;

  void notify() {
    notifyListeners();
  }

  void updateAlarmWhich(int index) {
    _isWhichSwitch = index;
    notifyListeners();
  }
}
