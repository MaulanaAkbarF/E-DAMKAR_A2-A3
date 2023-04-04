// To parse this JSON data, do
//
//     final modelLaporan = modelLaporanFromJson(jsonString);

import 'dart:convert';

ModelLaporan modelLaporanFromJson(String str) =>
    ModelLaporan.fromJson(json.decode(str));

class ModelLaporan {
  ModelLaporan({
    this.kondisi,
    this.dataPelaporan,
  });

  bool? kondisi;
  List<DataPelaporan>? dataPelaporan;

  factory ModelLaporan.fromJson(Map<String, dynamic> json) => ModelLaporan(
        kondisi: json["kondisi"],
        dataPelaporan: List<DataPelaporan>.from(
            json["dataPelaporan"].map((x) => DataPelaporan.fromJson(x))),
      );
}

class DataPelaporan {
  DataPelaporan({
    this.idLap,
    this.riwayatIduser,
    this.tglLap,
    this.namaKategori,
    this.namaStatus,
  });

  String? idLap;
  String? riwayatIduser;
  DateTime? tglLap;
  String? namaKategori;
  String? namaStatus;

  factory DataPelaporan.fromJson(Map<String, dynamic> json) => DataPelaporan(
        idLap: json["id_lap"],
        riwayatIduser: json["riwayat_iduser"],
        tglLap: DateTime.parse(json["tgl_lap"]),
        namaKategori: json["nama_kategori"],
        namaStatus: json["nama_status"],
      );
}
