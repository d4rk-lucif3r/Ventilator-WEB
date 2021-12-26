// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:ventilator_ui/connect/services.dart';

class PatientInfo extends ChangeNotifier {
  late String _name = '';
  late String _age = '';
  late String _sex = '';
  late String _height = '';
  late String _weight = '';
  late String _bloodGroup = '';

  String get name => _name;
  String get age => _age;
  String get sex => _sex;
  String get height => _height;
  String get weight => _weight;
  String get bloodGroup => _bloodGroup;

  void getPatientData() async {
    // List<dynamic> data = await fetchData("patient?stream=1");
    // _name = data[0]['name'].toString();
    // _age = data[0]['age'].toString();
    // _height = data[0]['height'].toString();
    // _weight = data[0]['weight'].toString();
    // _bloodGroup = data[0]['bloodgroup'].toString();

    //TODO: Sample Patient Info
    _name = "Rishikesh Salam";
    _age = "23";
    _sex = "female";
    _height = "163";
    _weight = "72";
    _bloodGroup = "A-";
    // print("$name, $age, $height, $weight, $bloodGroup");

    // print(data.length.toString());
  }
}
