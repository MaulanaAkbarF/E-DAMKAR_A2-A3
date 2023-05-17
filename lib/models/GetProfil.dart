import 'dart:convert';

import 'package:http/http.dart' as http;

class ModelProfile {
  final String namaLengkap;
  final String noHp;
  final String email;
  final String foto_user;

  ModelProfile(
      {required this.namaLengkap,
      required this.noHp,
      required this.email,
      required this.foto_user});

  factory ModelProfile.fromJson(Map<String, dynamic> json) {
    return ModelProfile(
        namaLengkap: json['data']['namaLengkap'],
        noHp: json['data']['noHp'],
        email: json['data']['email'],
        foto_user: json['data']['foto_user']);
  }

  static Future<ModelProfile> getData({String? id}) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.17:8000/api/user/akun/{id}'),
        body: {'id': id});
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("data: ${jsonResponse}");
      return ModelProfile.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
