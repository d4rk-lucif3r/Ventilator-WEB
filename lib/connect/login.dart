// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'services.dart';
import 'package:http/http.dart' as http;

const String tenawa = '192.168.137.76'; //192.168.137.76
const String lucifer = '192.168.137.1';
const String URL = "http://$lucifer:5000/";
const api = "login";

Future<int> login(String evalue, String pvalue) async {
  const finalURL = "$URL$api";
  var credentials = {"username": evalue, "password": pvalue};
  var body = json.encode(credentials);
  // print("$finalURL");
  debugPrint("$body");
  final http.Response response = await http.post(
    Uri.parse(finalURL),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: body,
  );
  // debugPrint("dent");
  if (response.statusCode == 200) {
    debugPrint("Data arrived");
    var data = json.decode(response.body);

    loginAuthToken = data["access_token"] as String;
    debugPrint(data["access_token"]);
    return response.statusCode;
  } else {
    // print("\n\nError\n\n");
    var data = json.decode(response.body);
    debugPrint(data);
    return response.statusCode;
  }
}

// dynamic getCredToken(String evalue, String pvalue) async {
//   var data = login(evalue, pvalue);
//   return data;
// }
