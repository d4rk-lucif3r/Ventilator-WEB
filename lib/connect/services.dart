import 'dart:convert' show json;
import 'dart:io';
import 'dart:js';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

const URL = "http://192.168.137.1:5000/api/";

const secret = String.fromEnvironment('secret');
// const url = String.fromEnvironment('url');

Future<List<dynamic>> fetchData(String api) async {
  final Response response = await get(
    Uri.parse(URL + api),
    headers: <String, String>{
      'x-access-tokens': secret,
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return json.decode(response.statusCode.toString());
  }
}

void getPatientData() async {
  String name;
  String age;
  String height;
  String weight;
  String bloodGroup;
  List<dynamic> data = await fetchData("patient?stream=1");
  name = data[0]['name'].toString();
  age = data[0]['age'].toString();
  height = data[0]['height'].toString();
  weight = data[0]['weight'].toString();
  bloodGroup = data[0]['bloodgroup'].toString();
  print("$name, $age, $height, $weight, $bloodGroup");

  // print(data.length.toString());
}


