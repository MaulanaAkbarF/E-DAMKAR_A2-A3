// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String token;
    Data data;

    LoginModel({
        required this.token,
        required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String email;
    String password;
    String namaLengkap;
    String noHp;

    Data({
        required this.id,
        required this.email,
        required this.password,
        required this.namaLengkap,
        required this.noHp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        namaLengkap: json["namaLengkap"],
        noHp: json["noHp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "namaLengkap": namaLengkap,
        "noHp": noHp,
    };
}
