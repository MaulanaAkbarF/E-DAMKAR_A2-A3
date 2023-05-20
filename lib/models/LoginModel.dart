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

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"] ?? '',
        data: json["data"] != null
            ? Data.fromJson(json["data"])
            : Data(
                id: 0, username: "", namaLengkap: "", noHp: "", fotoUser: ""),
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
