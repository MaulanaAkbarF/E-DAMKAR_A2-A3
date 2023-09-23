class LaporanElement {
  List<Data>? data;

  LaporanElement({this.data});

  LaporanElement.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idLaporan;
  String? statusRiwayat;
  String? kategoriLaporan;
  String? tanggal;
  String? deskripsi;
  String? imageUrl;
  String? alamat;

  Data(
      {this.idLaporan,
      this.statusRiwayat,
      this.kategoriLaporan,
      this.tanggal,
      this.deskripsi,
      this.imageUrl,
      this.alamat});

  Data.fromJson(Map<String, dynamic> json) {
    idLaporan = json['idLaporan'];
    statusRiwayat = json['Status_riwayat'];
    kategoriLaporan = json['kategori_laporan'];
    tanggal = json['tanggal'];
    deskripsi = json['deskripsi'];
    imageUrl = json['image_url'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idLaporan'] = idLaporan;
    data['Status_riwayat'] = statusRiwayat;
    data['kategori_laporan'] = kategoriLaporan;
    data['tanggal'] = tanggal;
    data['deskripsi'] = deskripsi;
    data['image_url'] = imageUrl;
    data['alamat'] = alamat;
    return data;
  }
}
