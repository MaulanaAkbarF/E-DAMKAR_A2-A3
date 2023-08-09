// To parse this JSON data, do
//
//     final riwayatLaporan = riwayatLaporanFromJson(jsonString);

import 'dart:convert';

RiwayatLaporan riwayatLaporanFromJson(String str) =>
    RiwayatLaporan.fromJson(json.decode(str));

String riwayatLaporanToJson(RiwayatLaporan data) => json.encode(data.toJson());

class RiwayatLaporan {
  bool kondisi;
  String message;
  List<DatumRiwayat>? data;

  RiwayatLaporan({
    required this.kondisi,
    required this.message,
    this.data,
  });

  factory RiwayatLaporan.fromJson(Map<String, dynamic> json) => RiwayatLaporan(
        kondisi: json["kondisi"],
        message: json["message"],
        data: List<DatumRiwayat>.from(
            json["data"].map((x) => DatumRiwayat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kondisi": kondisi,
        "message": message,
        "data": List<dynamic>.from(
            data != null ? data!.map((x) => x.toJson()) : {}),
      };
}

class DatumRiwayat {
  int? idLaporan;
  String? statusRiwayat;
  String? kategoriLaporan;
  String? tanggal;
  String? deskripsi;
  String? imageUrl;
  String? alamat;
  String? urgensi;

  DatumRiwayat({
    this.idLaporan,
    this.statusRiwayat,
    this.kategoriLaporan,
    this.tanggal,
    this.deskripsi,
    this.imageUrl,
    this.alamat,
    this.urgensi,
  });

  factory DatumRiwayat.fromJson(Map<String, dynamic> json) => DatumRiwayat(
        idLaporan: json["idLaporan"],
        statusRiwayat: json["status_riwayat"],
        kategoriLaporan: json["kategori_laporan"],
        tanggal: json["tanggal"],
        deskripsi: json["deskripsi"],
        imageUrl: json["image_url"],
        alamat: json["alamat"],
        urgensi: json["urgensi"],
      );

  Map<String, dynamic> toJson() => {
        "idLaporan": idLaporan,
        "status_riwayat": statusRiwayat,
        "kategori_laporan": kategoriLaporan,
        "tanggal": tanggal,
        "deskripsi": deskripsi,
        "image_url": imageUrl,
        "alamat": alamat,
        "urgensi": urgensi,
      };
}
