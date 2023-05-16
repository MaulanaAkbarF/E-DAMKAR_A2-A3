import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdateProfil {
  String? kode;
  String? status;

  UpdateProfil({this.kode, this.status});

  static Future<UpdateProfil> ubahProfil(
      String id, String namaLengkap, String noHp) async {
    Uri url = Uri.parse("http://172.16.103.188:8000/api/user");
    var HasilRespon = await http
        .post(url, body: {"id": id, "namaLengkap": namaLengkap, "noHp": noHp});
    var data = json.decode(HasilRespon.body);
    return UpdateProfil(kode: data['kode'], status: data['status']);
  }
}
