import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_alarms.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/popup_modes.dart';
import 'package:ventilator_ui/home/informationtab/settings/settings.dart';

class TransitionManager extends ChangeNotifier {
  bool _showSettings = false;
  bool _showModes = false;
  bool _showAlarms = false;
  bool _showPatientInfo = false;
  bool _showMapWindow = false;

  bool get showSettings => _showSettings;
  bool get showModes => _showModes;
  bool get showAlarms => _showAlarms;
  bool get showPatienInfo => _showPatientInfo;
  bool get showMapWindow => _showMapWindow;

  // void showSettingsDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Settings();
  //     },
  //   );
  // }

  // void showAlarmsDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return  PopUpAlarms();
  //     },
  //   );
  // }

  // void showModesDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const PopUpModes();
  //     },
  //   );
  // }

  popUpCheck(String value, bool boolValue) {
    switch (value) {
      case 'settings':
        _showSettings = boolValue;
        _showModes = false;
        _showAlarms = false;
        _showMapWindow = false;
        _showPatientInfo = false;
        break;
      case 'alarms':
        _showAlarms = boolValue;
        _showModes = false;
        _showSettings = false;
        _showMapWindow = false;
        _showPatientInfo = false;
        break;
      case 'modes':
        _showModes = boolValue;
        _showAlarms = false;
        _showSettings = false;
        _showPatientInfo = false;
        _showMapWindow = false;
        break;
      case 'patientinfo':
        _showPatientInfo = boolValue;
        _showModes = false;
        _showAlarms = false;
        _showSettings = false;
        _showMapWindow = false;
        break;
      case 'mapwindow':
        _showMapWindow = boolValue;
        _showModes = false;
        _showAlarms = false;
        _showSettings = false;
        _showPatientInfo = false;
        break;
      default:
        debugPrint("Something might be wrong");
    }
    notifyListeners();
    // debugPrint(
    // "$value : $_showSettings  $_showAlarms  $_showModes $_showPatientInfo $_showMapWindow");
  }

  void allFalse() {
    _showSettings = false;
    _showModes = false;
    _showAlarms = false;
    _showPatientInfo = false;
    _showMapWindow = false;
    notifyListeners();
  }
}
