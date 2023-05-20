// To parse this JSON data, do
//
//     final changePw = changePwFromJson(jsonString);

import 'dart:convert';

ChangePw changePwFromJson(String str) => ChangePw.fromJson(json.decode(str));

String changePwToJson(ChangePw data) => json.encode(data.toJson());

class ChangePw {
    String status;
    String kode;

    ChangePw({
        required this.status,
        required this.kode,
    });

    factory ChangePw.fromJson(Map<String, dynamic> json) => ChangePw(
        status: json["status"],
        kode: json["kode"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "kode": kode,
    };
}
