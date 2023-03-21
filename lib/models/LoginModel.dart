import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginModel {
  bool kondisi;
  String? email;
  String? namaLengkap;

  LoginModel({required this.kondisi, this.email, this.namaLengkap});

  factory LoginModel.createResult(Map<String, dynamic> object) {
    print('berhasil di set');
    return LoginModel(
        kondisi: object['kondisi'],
        email: object['email'],
        namaLengkap: object['namaLengkap']);
  }

  static Future<LoginModel> postData(String email, String pass) async {
    String url = 'http://188.10.10.253:8080/belajarphp/login.php';
    Uri ur = Uri.parse(url);
    var result = await http.post(ur, body: {"email": email, "password": pass});
    var jsonobj = json.decode(result.body);
    print('berhasil melakukan post');
    return LoginModel.createResult(jsonobj);
  }
}
