import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  bool? kondisi;
  String? message;

  RegisterModel({
    this.kondisi,
    this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        kondisi: json["status"] ?? false,
        message: json["message"] ?? '',
      );
}
