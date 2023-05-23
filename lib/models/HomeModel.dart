// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

class HomeModel {
    List<Datum> data;

    HomeModel({
        required this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

  
}

class Datum {
    String? jenisArtikel;
    int? id;
    String? adminDamkar;
    String? foto;
    String? judul;
    String? deskripsi;
    String? tanggal;

    Datum({
        this.jenisArtikel,
        this.id,
        this.adminDamkar,
        this.foto,
        this.judul,
        this.deskripsi,
        this.tanggal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jenisArtikel: json["jenis_artikel"],
        id: json["id"],
        adminDamkar: json["admin_damkar"],
        foto: json["foto"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        tanggal: json["tanggal"],
    );

   
}
