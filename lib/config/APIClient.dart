import 'dart:io';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://172.16.106.138:8000/';
const String apiUrl = "${baseUrl}api/";

class APIClient {
  var client = http.Client();

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }

  final _headers = {"Accept": "application/json"};

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(apiUrl + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var url = Uri.parse(apiUrl + api);

    var response = await client.post(url, headers: _headers, body: object);

    if (response.statusCode == 200 || response.statusCode == 422) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postMulti(
      String api, image, String path, String imageTitle) async {
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    // var length = await image!.length();
    var uri = Uri.parse(apiUrl + api);
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
    var url = Uri.parse(apiUrl + api);
    var response = await client.put(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> deleteData(String api) async {
    var url = Uri.parse(apiUrl + api);
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}