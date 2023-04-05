// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

class LoginModel {
    LoginModel({
        required this.kondisi,
        this.data,
    });

    bool kondisi;
    Data? data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        kondisi: json["kondisi"],
        data: Data.fromJson(json["data"]),
    );

    
}

class Data {
    Data({
        this.id,
        this.email,
        this.namaLengkap,
    });

    int? id;
    String? email;
    String? namaLengkap;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        namaLengkap: json["namaLengkap"],
    );

}
