//import 'dart:convert';

import 'package:http/http.dart' as http;

const String _baseUrl = 'http://172.16.103.4:8000/api/';

class APIClient {
  var client = http.Client();

  static String gambar = 'http://172.16.103.4:8000/';
  Future<dynamic> getData(String api) async {
    var url = Uri.parse(_baseUrl + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var url = Uri.parse(_baseUrl + api);

    var response = await client.post(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return false;
    }
  }

  Future<dynamic> putData(String api, dynamic object) async {
    var url = Uri.parse(_baseUrl + api);
    var response = await client.put(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> deleteData(String api) async {
    var url = Uri.parse(_baseUrl + api);
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}
