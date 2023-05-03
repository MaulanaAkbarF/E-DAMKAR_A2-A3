import 'dart:convert';

import 'package:edamkar_1/models/LoginModel.dart';

DataArtikel dataArtikelFromJson(String str) =>
    DataArtikel.fromJson(json.decode(str));

class DataArtikel {
  DataArtikel({
    required this.kondisi,
    required this.dataArtikel,
  });

  bool kondisi;
  List<DataArtikelElement>? dataArtikel;

  factory DataArtikel.fromJson(Map<String, dynamic> json) => DataArtikel(
        kondisi: json["kondisi"],
        dataArtikel: List<DataArtikelElement>.from(
            json["dataArtikel"].map((x) => DataArtikelElement.fromJson(x))),
      );
}

class DataArtikelElement {
  DataArtikelElement({
    this.idArtikel,
    this.judulArtikel,
    this.artikelIdKat,
    this.artikelTgl,
    this.artikelIdDamkar,
    this.deksripsiArtikel,
    this.namaLengkapDamkar,
    this.namaArtikel,
  });

  String? idArtikel;
  String? judulArtikel;
  String? artikelIdKat;
  String? artikelTgl;
  String? artikelIdDamkar;
  String? deksripsiArtikel;
  String? namaLengkapDamkar;
  String? namaArtikel;

  factory DataArtikelElement.fromJson(Map<String, dynamic> json) =>
      DataArtikelElement(
        idArtikel: json["id_artikel"],
        judulArtikel: json["judul_artikel"],
        artikelIdKat: json["artikel_idKat"],
        artikelTgl: json["artikel_tgl"],
        artikelIdDamkar: json["artikel_idDamkar"],
        deksripsiArtikel: json["deskripsi_artikel"],
        namaLengkapDamkar: json["nama_lengkapDamkar"],
        namaArtikel: json["nama_artikel"],
      );
}
