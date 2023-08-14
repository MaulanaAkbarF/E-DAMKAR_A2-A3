// To parse this JSON data, do
//
//     final detailLaporan = detailLaporanFromJson(jsonString);

import 'dart:convert';

DetailLaporan detailLaporanFromJson(String str) =>
    DetailLaporan.fromJson(json.decode(str));

String detailLaporanToJson(DetailLaporan data) => json.encode(data.toJson());

class DetailLaporan {
  Data data;

  DetailLaporan({
    required this.data,
  });

  factory DetailLaporan.fromJson(Map<String, dynamic> json) => DetailLaporan(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  int idLaporan;
  String statusRiwayat;
  String kategoriLaporan;
  String tanggal;
  String deskripsi;
  String imageUrl;
  String alamat;
  String urgensi;

  Data({
    required this.idLaporan,
    required this.statusRiwayat,
    required this.kategoriLaporan,
    required this.tanggal,
    required this.deskripsi,
    required this.imageUrl,
    required this.alamat,
    required this.urgensi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLaporan: int.parse(json["idLaporan"]) ,
        statusRiwayat: json["Status_riwayat"],
        kategoriLaporan: json["kategori_laporan"],
        tanggal: json["tanggal"],
        deskripsi: json["deskripsi"],
        imageUrl: json["image_url"],
        alamat: json["alamat"],
        urgensi: json["urgensi"],
      );

  Map<String, dynamic> toJson() => {
        "idLaporan": idLaporan,
        "Status_riwayat": statusRiwayat,
        "kategori_laporan": kategoriLaporan,
        "tanggal": tanggal,
        "deskripsi": deskripsi,
        "image_url": imageUrl,
        "alamat": alamat,
        "urgensi": urgensi,
      };
}
