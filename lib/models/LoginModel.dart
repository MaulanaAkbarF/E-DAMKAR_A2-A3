import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  String? token;
  Data? data;

  LoginModel({
    this.token,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? id;
  String? username;
  String? password;
  String? namaLengkap;
  String? noHp;
  String? message;
  String? gambar;


  Data({
    this.id,
    this.username,
    this.password,
    this.namaLengkap,
    this.noHp,
    this.gambar,
    this.message
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        gambar: json['foto_user'],
        password: json["password"],
        namaLengkap: json["namaLengkap"],
        noHp: json["noHp"],
        message: json["message"]
      );
}
