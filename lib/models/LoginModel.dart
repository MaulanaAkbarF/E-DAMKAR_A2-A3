import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  bool status;
  String? message;
  String? token;
  Data? data;

  LoginModel({
    required this.status,
    this.message,
    this.token,
    this.data,
  });

  Map<String, dynamic> jsonNull = {
    "id": '',
    "username": '',
    "namaLengkap": '',
    "noHp": '',
    "foto_user": '',
  };
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"] ?? '',
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? id;
  String? username;
  String? namaLengkap;
  String? noHp;
  String? fotoUser;

  Data({
    this.id,
    this.username,
    this.namaLengkap,
    this.noHp,
    this.fotoUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
        namaLengkap: json["namaLengkap"] ?? '',
        noHp: json["noHp"] ?? '',
        fotoUser: json["foto_user"] ?? '',
      );
}
