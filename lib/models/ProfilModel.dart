import 'dart:convert';
import 'dart:io';

import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:mime/mime.dart';

class UpdateProfil {
  String? kode;
  String? status;

  UpdateProfil({this.kode, this.status});

  static Future<UpdateProfil> ubahProfil(
      String id, String namaLengkap, String noHp) async {
    Uri url = Uri.parse("${baseUrl}user");
    var HasilRespon = await http
        .post(url, body: {"id": id, "namaLengkap": namaLengkap, "noHp": noHp});
    var data = json.decode(HasilRespon.body);
    return UpdateProfil(kode: data['kode'], status: data['status']);
  }

  static Future<UpdateProfil> sendRequestWithFile(
      {String? id_akun,
      String? delPic,
      String? nama,
      String? nomorHp,
      File? file}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("${baseUrl}user/foto"));

    // tambahkan text sebagai field pada request
    request.fields['foto_user'] = delPic.toString();
    request.fields['id'] = id_akun.toString();
    request.fields['namaLengkap'] = nama.toString();
    request.fields['noHp'] = nomorHp.toString();

    // tambahkan file sebagai field pada request
    var mimeType = lookupMimeType(file!.path);
    var fileStream = http.ByteStream(Stream.castFrom(file.openRead()));
    var fileLength = await file.length();
    var multipartFile = http.MultipartFile(
      'file',
      fileStream,
      fileLength,
      filename: file.path.split('/').last,
      contentType: MediaType.parse(mimeType!),
    );
    request.files.add(multipartFile);

    // kirim request dan tunggu responsenya
    var response = await http.Response.fromStream(await request.send());
    var data = json.decode(response.body);
    print("Tes Image Bruh" + response.body);
    return UpdateProfil(kode: data['code'].toString(), status: data['message']);
  }
}
