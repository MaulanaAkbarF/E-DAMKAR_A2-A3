// To parse this JSON data, do
//
//     final dataPelaporan = dataPelaporanFromJson(jsonString);

import 'dart:convert';

DataPelaporan dataPelaporanFromJson(String str) =>
    DataPelaporan.fromJson(json.decode(str));

class DataPelaporan {
  List<Datum> data;

  DataPelaporan({
    required this.data,
  });

  factory DataPelaporan.fromJson(Map<String, dynamic> json) => DataPelaporan(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int idLaporan;
  String statusRiwayat;
  String kategoriLaporan;
  String tanggal;
  String deskripsi;
  String imageUrl;
  String alamat;

  Datum({
    required this.idLaporan,
    required this.statusRiwayat,
    required this.kategoriLaporan,
    required this.tanggal,
    required this.deskripsi,
    required this.imageUrl,
    required this.alamat,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idLaporan: json["idLaporan"],
        statusRiwayat: json["Status_riwayat"],
        kategoriLaporan: json["kategori_laporan"],
        tanggal: json["tanggal"],
        deskripsi: json["deskripsi"],
        imageUrl: json["image_url"],
        alamat: json["alamat"],
      );
}
