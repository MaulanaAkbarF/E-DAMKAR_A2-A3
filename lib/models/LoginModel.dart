import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginModel {

  String kondisi;
  String username;
  String namaLengkap;
  String email;
  String noTelp;

  LoginModel(
      {required this.kondisi,
      required this.username,
      required this.namaLengkap,
      required this.email,
      required this.noTelp});

  factory LoginModel.createResult(Map<String, dynamic> object) {
    return LoginModel(
        kondisi: object['kondisi'],
        username: object['username'],
        namaLengkap: object['nama_lengkap'],
        email: object['email'], 
        noTelp: object['notelp']);
  }

  static Future<LoginModel> postData(String username, String pass) async {
    String url = 'http://188.10.10.254:8080/belajarphp/login.php';
    Uri ur = Uri.parse(url);
    var result = await http.post(ur, body: {"username": username, "pass": pass});
    var jsonobj = json.decode(result.body);
    return LoginModel.createResult(jsonobj);
  }
}
