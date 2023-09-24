import 'dart:convert';

import 'package:http/http.dart' as http;

class Update {
  String? kode;
  String? status;

  Update({this.kode, this.status});

  static Future<Update> ubahSandi(
      String id, String passwordLama, String passwordBaru) async {
    Uri url = Uri.parse("http://10.20.8.184:8000/api/user/password");
    var HasilRespon = await http.post(url, body: {
      "id": id,
      "password_lama": passwordLama,
      "password_baru": passwordBaru
    });
    var data = json.decode(HasilRespon.body);
    return Update(kode: data['kode'], status: data['status']);
  }
}
