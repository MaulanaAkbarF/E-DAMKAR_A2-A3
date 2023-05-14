// To parse this JSON data, do
//
//     final artikelEdukasiModel = artikelEdukasiModelFromJson(jsonString);

import 'dart:convert';

ArtikelEdukasiModel artikelEdukasiModelFromJson(String str) => ArtikelEdukasiModel.fromJson(json.decode(str));

class ArtikelEdukasiModel {
    List<EdukasiDatum> data;

    ArtikelEdukasiModel({
        required this.data,
    });

    factory ArtikelEdukasiModel.fromJson(Map<String, dynamic> json) => ArtikelEdukasiModel(
        data: List<EdukasiDatum>.from(json["data"].map((x) => EdukasiDatum.fromJson(x))),
    );

    
}

class EdukasiDatum {
    int idEdukasi;
    String adminDamkar;
    String fotoEdukasi;
    String judulEdukasi;
    String deskripsiEdukasi;
    String tanggalEdukasi;

    EdukasiDatum({
        required this.idEdukasi,
        required this.adminDamkar,
        required this.fotoEdukasi,
        required this.judulEdukasi,
        required this.deskripsiEdukasi,
        required this.tanggalEdukasi,
    });

    factory EdukasiDatum.fromJson(Map<String, dynamic> json) => EdukasiDatum(
        idEdukasi: json["id_edukasi"],
        adminDamkar: json["admin_damkar"],
        fotoEdukasi: json["foto_edukasi"],
        judulEdukasi: json["judul_edukasi"],
        deskripsiEdukasi: json["deskripsi_edukasi"],
        tanggalEdukasi: json["tanggal_edukasi"],
    );

 
}
