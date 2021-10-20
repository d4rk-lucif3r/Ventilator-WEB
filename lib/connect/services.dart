import 'dart:convert' show json;
import 'dart:io';
import 'dart:js';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

const URL = "http://192.168.137.1:5000/api/";
var loginAuthToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYzNDU0MDkzOCwianRpIjoiODc1MzI3M2EtMTBhNy00MDkyLTk0NzItZGRiYjQ3ZjRjZjczIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Imx1Y2lmM3IiLCJuYmYiOjE2MzQ1NDA5MzgsImNzcmYiOiI3NDE3NWRiZi01YjNjLTRkYmEtYmEzMi0xY2FiMTg0ZDc5NWQiLCJleHAiOjE5NjM0NTQwOTM4fQ.4_ggIFSLMl8QJMeCm61OOYDRgSLm63fVzVL9bFbjjDAz';
const secret = String.fromEnvironment('secret');
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
