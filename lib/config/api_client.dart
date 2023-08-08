import 'package:edamkar_1/config/url_static.dart';
import 'package:http/http.dart' as http;

final _headers = {"Accept": "application/json"};

class APIClient {
  var client = http.Client();

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(URLWEBAPI.apiUrl + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var url = Uri.parse(URLWEBAPI.apiUrl + api);
    print(URLWEBAPI.apiUrl + api);
    var response = await client.post(url, headers: _headers, body: object);

    if (response.statusCode == 200 || response.statusCode == 422) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postMulti(
      String api, image, String path, String imageTitle) async {
    var stream = http.ByteStream(image!.value.openRead());
    stream.cast();
    // var length = await image!.length();
    var uri = Uri.parse(URLWEBAPI.apiUrl + api);
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
      // print(await response.stream.bytesToString());
    } else {
      // print(response.statusCode);
    }
  }

  Future<dynamic> putData(String api, dynamic object) async {
    var url = Uri.parse(URLWEBAPI.apiUrl + api);
    var response = await client.put(url, body: object);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> deleteData(String api) async {
    var url = Uri.parse(URLWEBAPI.apiUrl + api);
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}
