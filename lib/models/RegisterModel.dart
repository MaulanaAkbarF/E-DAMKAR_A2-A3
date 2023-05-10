import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  bool? kondisi;
  String? message;
  // Errors? errors;

  RegisterModel({
    this.kondisi,
    this.message,
    // this.errors,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        kondisi: json["kondisi"],
        message: json["message"],
        // errors: json["errors"].isEmpty ? {json} : Errors.fromJson(json["errors"]),
      );
}
