import 'dart:convert';

import 'package:http/http.dart' as http;

const String _baseUrl =
<<<<<<< HEAD
    'http://10.20.8.245:8080/percobaanv2/E_DamkarRestAPI/';
=======
    'http://172.16.106.161:8080/MobileAPI/E_DamkarRestAPI/';
>>>>>>> 11e2a4cf41204a433f832cc13e930a203854785c

class APIClient {
  var client = http.Client();

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(_baseUrl + api + ".php");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var url = Uri.parse(_baseUrl + api + ".php");

    var response = await client.post(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("post data err");
      return false;
    }
  }

  Future<dynamic> putData(String api, dynamic object) async {
    var url = Uri.parse(_baseUrl + api + ".php");
    var response = await client.put(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> deleteData(String api) async {
    var url = Uri.parse(_baseUrl + api + ".php");
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}
