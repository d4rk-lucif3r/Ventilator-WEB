import 'dart:convert' show json;
import 'dart:io';
import 'dart:js';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

// const YAYA = "10.20.18.1";
// const String YAYA = "127.0.0.1";
// const String luci = '192.168.137.1';
const String tenawa = '192.168.137.76';
// const String lucifer = '192.168.137.1';
const String lucifer = '192.168.137.1';

const URL = "http://$lucifer:5000/api/";
var loginAuthToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0MDA2MjQzNCwianRpIjoiYjUyMWMxNzMtOTFjNy00N2U2LWE3NDktYjE0ODVhNDA4ODBlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Imx1Y2lmM3IiLCJuYmYiOjE2NDAwNjI0MzQsImNzcmYiOiI4ZDFlMGU4Yy0wYjhhLTQyMDQtYmMzZC01Mjk2ZTIyYjRkOWIiLCJleHAiOjE2NTA4NjI0MzR9.ly6frpN8W2d0npFxdmv8xhG58jOf5GrV9uOjKsnNoT0';
// const secret = String.fromEnvironment('secret');
// const url = String.fromEnvironment('url');

Future<dynamic> fetchData(String api) async {
  final finalURL = "$URL$api";
  // print("$finalURL");
  final Response response = await get(
    Uri.parse(finalURL),
    headers: <String, String>{
      'Authorization': "Bearer " + loginAuthToken,
    },
  );
  if (response.statusCode == 200) {
    // print("Data arrived");
    return json.decode(response.body);
  } else {
    // print("\n\nError\n\n${json.decode(response.statusCode.toString())}");
    Future<dynamic> resCode = json.decode(response.statusCode.toString());
    return resCode;
  }
}

Future<String> postToStream(String api, dynamic value) async {
  final finalURL = "$URL$api";
  final Response response = await post(
    Uri.parse(finalURL),
    headers: <String, String>{
      'Authorization': "Bearer " + loginAuthToken,
    },
    body: json.encode(value),
  );
  if (response.statusCode == 200) {
    // print("Data arrived");
    return "Successful";
  } else {
    // print("\n\nError\n\n${json.decode(response.statusCode.toString())}");
    return "Failed";
  }
}
