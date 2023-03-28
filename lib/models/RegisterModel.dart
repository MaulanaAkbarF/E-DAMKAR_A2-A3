import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

class Register {
    Register({
      required this.kondisi,
    });

    bool kondisi;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        kondisi: json["kondisi"],
    );

}
