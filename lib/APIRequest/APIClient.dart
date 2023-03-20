// import 'dart:convert';

// import 'package:edamkar_1/models/LoginModel.dart';
// import 'package:http/http.dart' as http;

// const String _baseUrl = 'http://188.10.10.254:8080/belajarphp/';

// class APIClient {
//   var client = http.Client();

//   Future<dynamic> getData(String api) async {
//     var url = Uri.parse(_baseUrl + api);
//     var headers = {'Content-Type': 'application/json; charset=UTF-8'};
//     var response = await client.get(url, headers: headers);
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {}
//   }

//   Future<dynamic> postData(String api, String username, String pass) async {
//     var url = Uri.parse(_baseUrl + api);
//     var _headers = {'Content-Type': 'application/json; charset=UTF-8'};
//     var msg = jsonEncode({"username": username, "pass": pass});
//     var response = await client.post(url,
//         body: msg, headers: _headers);
//     if (response.statusCode == 200) {
//       var jsonobj = json.decode(response.body);
//       return LoginModel.createResult(jsonobj);
//     } else {
//       throw Exception('gagal');
//     }
//   }
// }
