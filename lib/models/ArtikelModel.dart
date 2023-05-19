// To parse this JSON data, do
//
//     final dataArtikel = dataArtikelFromJson(jsonString);

import 'dart:convert';

DataArtikel dataArtikelFromJson(String str) =>
    DataArtikel.fromJson(json.decode(str));

class DataArtikel {
  List<ArtikelDatum> data;

  DataArtikel({
    required this.data,
  });

  factory DataArtikel.fromJson(Map<String, dynamic> json) => DataArtikel(
        data: List<ArtikelDatum>.from(
            json["data"].map((x) => ArtikelDatum.fromJson(x))),
      );
}

class ArtikelDatum {
  int idBerita;
  String adminDamkar;
  String fotoBerita;
  String judulBerita;
  String deskripsiBerita;
  String tanggalBerita;

  ArtikelDatum({
    required this.idBerita,
    required this.adminDamkar,
    required this.fotoBerita,
    required this.judulBerita,
    required this.deskripsiBerita,
    required this.tanggalBerita,
  });

  factory ArtikelDatum.fromJson(Map<String, dynamic> json) => ArtikelDatum(
        idBerita: json["id_berita"],
        adminDamkar: json["admin_damkar"],
        fotoBerita: json["foto_berita"],
        judulBerita: json["judul_berita"],
        deskripsiBerita: json["deskripsi_berita"],
        tanggalBerita: json["tanggal_berita"],
      );
}
