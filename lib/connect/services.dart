import 'dart:convert' show json;
import 'dart:io';
import 'dart:js';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

const URL = "http://192.168.137.1:5000/api/";
var loginAuthToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYzNTQ5NTMxOSwianRpIjoiYTY1ZTY4MWItMTBlMi00OTNkLWIxMDUtNWMyNDEzMGJjOWVlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Imx1Y2lmM3IiLCJuYmYiOjE2MzU0OTUzMTksImNzcmYiOiI3YjNmMzBjOS02MmU3LTRjMzctYmZlZi0wOThlM2EwMzU1MzYiLCJleHAiOjE2NDYyOTUzMTl9.KgTxu50nKb3auiyIaXpTEvX6k2qs79uQWLysrAFh6QA';
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
