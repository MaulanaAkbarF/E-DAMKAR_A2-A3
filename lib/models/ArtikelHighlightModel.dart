// To parse this JSON data, do
//
//     final artikelHighlightModel = artikelHighlightModelFromJson(jsonString);

import 'dart:convert';

ArtikelHighlightModel artikelHighlightModelFromJson(String str) => 
ArtikelHighlightModel.fromJson(json.decode(str));


class ArtikelHighlightModel {
    List<ArtikelDetailDatum> data;

    ArtikelHighlightModel({
        required this.data,
    });

    factory ArtikelHighlightModel.fromJson(Map<String, dynamic> json) => ArtikelHighlightModel(
        data: List<ArtikelDetailDatum>.from(json["data"].map((x) => ArtikelDetailDatum.fromJson(x))),
    );

   
}

class ArtikelDetailDatum {
    int idBerita;
    String adminDamkar;
    String fotoBerita;
    String judulBerita;
    String deskripsiBerita;
    String tanggalBerita;

    ArtikelDetailDatum({
        required this.idBerita,
        required this.adminDamkar,
        required this.fotoBerita,
        required this.judulBerita,
        required this.deskripsiBerita,
        required this.tanggalBerita,
    });

    factory ArtikelDetailDatum.fromJson(Map<String, dynamic> json) => ArtikelDetailDatum(
        idBerita: json["id_berita"],
        adminDamkar: json["admin_damkar"],
        fotoBerita: json["foto_berita"],
        judulBerita: json["judul_berita"],
        deskripsiBerita: json["deskripsi_berita"],
        tanggalBerita: json["tanggal_berita"],
    );

    
}
