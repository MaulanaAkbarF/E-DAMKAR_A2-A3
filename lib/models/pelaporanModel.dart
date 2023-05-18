// To parse this JSON data, do
//
//     final laporanModel = laporanModelFromJson(jsonString);

import 'dart:convert';

LaporanModel laporanModelFromJson(String str) => LaporanModel.fromJson(json.decode(str));

// String laporanModelToJson(LaporanModel data) => json.encode(data.toJson());

class LaporanModel {
    String? message;

    LaporanModel({
        this.message,
    });

    factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
        message: json["message"],
    );

    // Map<String, dynamic> toJson() => {
    //     "message": message,
    // };
}
