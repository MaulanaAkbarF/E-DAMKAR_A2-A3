import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

const String _baseUrl = 'http://188.10.10.254:8000/api/';

class APIClient {
  var client = http.Client();

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(_baseUrl + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return false;
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var url = Uri.parse(_baseUrl + api);

    var response = await client.post(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postMulti(String api, image, String path, String imageTitle) async {
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse(_baseUrl + api);
    final request = http.MultipartRequest('POST', uri);
    request.fields['title'] = imageTitle;
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        path,
      ),
    );
    final response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.statusCode);
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
