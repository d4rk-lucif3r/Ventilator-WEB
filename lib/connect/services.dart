import 'dart:convert' show json;
import 'dart:io';
import 'dart:js';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

// const YAYA = "10.20.18.1";
const String YAYA = "127.0.0.1";

const URL = "http://$YAYA:5000/api/";
var loginAuthToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYzODU5NTk1NSwianRpIjoiYzNmMWFlNjEtNDVmZC00OGM3LWI5MWMtMTM1MTEwMWUyZjJmIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Imx1Y2lmM3IiLCJuYmYiOjE2Mzg1OTU5NTUsImNzcmYiOiI5M2IwYmRlMi05ZTdjLTQyM2YtYTI5NC1mZGRkYmY0MTdhNDUiLCJleHAiOjE2NDkzOTU5NTV9.en2smVo69oIlsIsQ3yqVWb-B8_yVPWk02HQIXJENkh8';
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
