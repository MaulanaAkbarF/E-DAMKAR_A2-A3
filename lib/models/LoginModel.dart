
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.kondisi,
        this.data,
    });

    bool? kondisi;
    Data? data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        kondisi: json["kondisi"],
        data: Data.fromJson(json["data"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "kondisi": kondisi,
    //     "data": data!.toJson(),
    // };
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

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "email": email,
    //     "namaLengkap": namaLengkap,
    // };
}
