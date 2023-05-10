import 'dart:convert';

import 'package:http/http.dart' as http;

class Update {
  String? kode;
  String? status;

  Update({this.kode, this.status});

  static Future<Update> ubahSandi(
      String id, String password_lama, String password_baru) async {
    Uri url = Uri.parse("http://172.16.106.94:8000/api/users/password");
    var HasilRespon = await http.post(url, body: {
      "id": id,
      "password_lama": password_lama,
      "password_baru": password_baru
    });
    var data = json.decode(HasilRespon.body);
    return Update(kode: data['kode'], status: data['status']);
  }
}
