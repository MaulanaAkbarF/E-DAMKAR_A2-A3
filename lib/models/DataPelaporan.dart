import 'dart:convert';

DataPelaporan dataPelaporanFromJson(String str) =>
    DataPelaporan.fromJson(json.decode(str));

class DataPelaporan {
  DataPelaporan({
    required this.kondisi,
    this.dataPelaporan,
  });

  bool kondisi;
  List<DataPelaporanElement>? dataPelaporan;

  factory DataPelaporan.fromJson(Map<String, dynamic> json) {
    if (json["dataPelaporan"]?.isEmpty ?? true) {
      return DataPelaporan(kondisi: json["kondisi"]);
    } else {
      return DataPelaporan(
        kondisi: json["kondisi"],
        dataPelaporan: List<DataPelaporanElement>.from(
            json["dataPelaporan"].map((x) => DataPelaporanElement.fromJson(x))),
      );
    }
  }
}

class DataPelaporanElement {
  DataPelaporanElement({
    this.idLap,
    this.riwayatIduser,
    this.tglLap,
    this.namaKategori,
    this.namaStatus,
  });

  String? idLap;
  String? riwayatIduser;
  String? tglLap;
  String? namaKategori;
  String? namaStatus;

  factory DataPelaporanElement.fromJson(Map<String, dynamic> json) =>
      DataPelaporanElement(
        idLap: json["id_lap"],
        riwayatIduser: json["riwayat_iduser"],
        tglLap: json["tgl_lap"],
        namaKategori: json["nama_kategori"],
        namaStatus: json["nama_status"],
      );
}
