class LaporanElement {
  List<Data>? data;

  LaporanElement({this.data});

  LaporanElement.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLaporan'] = this.idLaporan;
    data['Status_riwayat'] = this.statusRiwayat;
    data['kategori_laporan'] = this.kategoriLaporan;
    data['tanggal'] = this.tanggal;
    data['deskripsi'] = this.deskripsi;
    data['image_url'] = this.imageUrl;
    data['alamat'] = this.alamat;
    return data;
  }
}
