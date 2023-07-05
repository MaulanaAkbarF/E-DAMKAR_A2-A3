// To parse this JSON data, do
//
//     final allArtikelModel = allArtikelModelFromJson(jsonString);

import 'dart:convert';

List<AllArtikelModel> allArtikelModelFromJson(String str) => List<AllArtikelModel>.from(json.decode(str).map((x) => AllArtikelModel.fromJson(x)));



class AllArtikelModel {
    String jenisArtikel;
    int id;
    String adminDamkar;
    String? fotoBerita;
    String? judulBerita;
    String? deskripsiBerita;
    DateTime? tanggalBerita;
    String? fotoEdukasi;
    String? judulEdukasi;
    String? deskripsiEdukasi;
    DateTime? tanggalEdukasi;

    AllArtikelModel({
        required this.jenisArtikel,
        required this.id,
        required this.adminDamkar,
        this.fotoBerita,
        this.judulBerita,
        this.deskripsiBerita,
        this.tanggalBerita,
        this.fotoEdukasi,
        this.judulEdukasi,
        this.deskripsiEdukasi,
        this.tanggalEdukasi,
    });

    factory AllArtikelModel.fromJson(Map<String, dynamic> json) => AllArtikelModel(
        jenisArtikel: json["jenis_artikel"],
        id: json["id"],
        adminDamkar: json["admin_damkar"],
        fotoBerita: json["foto_berita"],
        judulBerita: json["judul_berita"],
        deskripsiBerita: json["deskripsi_berita"],
        tanggalBerita: json["tanggal_berita"] == null ? null : DateTime.parse(json["tanggal_berita"]),
        fotoEdukasi: json["foto_edukasi"],
        judulEdukasi: json["judul_edukasi"],
        deskripsiEdukasi: json["deskripsi_edukasi"],
        tanggalEdukasi: json["tanggal_edukasi"] == null ? null : DateTime.parse(json["tanggal_edukasi"]),
    );

    
}



