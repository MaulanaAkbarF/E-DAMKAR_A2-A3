import 'dart:convert';

import 'package:http/http.dart' as http;

const String _baseUrl =
    'http://172.16.104.59:8080/percobaanv2/E_DamkarRestAPI/';


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
