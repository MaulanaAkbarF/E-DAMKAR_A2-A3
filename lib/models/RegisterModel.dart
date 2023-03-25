import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterModel {
  bool kondisi;

  RegisterModel({required this.kondisi});

  factory RegisterModel.fetchDataAfterRegister(Map<String, dynamic> object) {
    return RegisterModel(kondisi: object['kondisi']);
  }

  static Future<RegisterModel> postRegister(
      String email, String password, String nama) async {
    String url = 'http://188.10.10.253/MobileAPI/E_DamkarRestAPI/register.php';
    Uri ur = Uri.parse(url);
    var result = await http.post(ur,
        body: {"email": email, "password": password, "namaLengkap": nama});
    var jsonobj = json.decode(result.body);
    print('berhasil melakukan post');
    return RegisterModel.fetchDataAfterRegister(jsonobj);
  }
}
