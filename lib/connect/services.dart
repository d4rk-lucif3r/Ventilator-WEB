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
  final finalURL = "$URL$api";
  // print("$finalURL");
  final Response response = await get(
    Uri.parse(finalURL),
    headers: <String, String>{
      'x-access-tokens': secret,
    },
  );
  if (response.statusCode == 200) {
    // print("Data arrived");
    return json.decode(response.body);
  } else {
    // print("\n\nError\n\n");
    return json.decode(response.statusCode.toString());
  }
}

