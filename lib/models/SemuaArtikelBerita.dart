// To parse this JSON data, do
//
//     final semuaArtikelModel = semuaArtikelModelFromJson(jsonString);

import 'dart:convert';

List<SemuaArtikelModel> semuaArtikelModelFromJson(String str) => List<SemuaArtikelModel>.from(json.decode(str).map((x) => SemuaArtikelModel.fromJson(x)));

class SemuaArtikelModel {
    String jenisArtikel;
    int id;
    String adminDamkar;
    String foto;
    String judul;
    String deskripsi;
    String tanggal;

    SemuaArtikelModel({
        required this.jenisArtikel,
        required this.id,
        required this.adminDamkar,
        required this.foto,
        required this.judul,
        required this.deskripsi,
        required this.tanggal,
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
