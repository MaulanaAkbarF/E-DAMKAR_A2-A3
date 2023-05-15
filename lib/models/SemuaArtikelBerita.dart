// To parse this JSON data, do
//
//     final semuaArtikelModel = semuaArtikelModelFromJson(jsonString);

import 'dart:convert';

List<SemuaArtikelModel> semuaArtikelModelFromJson(String str) => List<SemuaArtikelModel>.from(json.decode(str).map((x) => SemuaArtikelModel.fromJson(x)));


class SemuaArtikelModel {
    String? jenisArtikel;
    int? id;
    String? adminDamkar;
    String? foto;
    String? judul;
    String? deskripsi;
    String? tanggal;

    SemuaArtikelModel({
        this.jenisArtikel,
        this.id,
        this.adminDamkar,
        this.foto,
        this.judul,
        this.deskripsi,
        this.tanggal,
    });

    factory SemuaArtikelModel.fromJson(Map<String, dynamic> json) => SemuaArtikelModel(
        jenisArtikel: json["jenis_artikel"],
        id: json["id"],
        adminDamkar: json["admin_damkar"],
        foto: json["foto"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        tanggal: json["tanggal"],
    );

}


