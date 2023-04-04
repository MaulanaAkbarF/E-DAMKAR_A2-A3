
import 'dart:convert';

DataPelaporan dataPelaporanFromJson(String str) => DataPelaporan.fromJson(json.decode(str));

// String dataPelaporanToJson(DataPelaporan data) => json.encode(data.toJson());

class DataPelaporan {
    DataPelaporan({
        this.kondisi,
        this.dataPelaporan,
    });

    bool? kondisi;
    List<DataPelaporanElement>? dataPelaporan;

    factory DataPelaporan.fromJson(Map<String, dynamic> json) => DataPelaporan(
        kondisi: json["kondisi"],
        dataPelaporan: List<DataPelaporanElement>.from(json["dataPelaporan"].map((x) => DataPelaporanElement.fromJson(x))),
    );

}

class DataPelaporanElement {
    DataPelaporanElement({
        this.idLaporan,
        this.idUser,
        this.dataLaporan,
    });

    int? idLaporan;
    int? idUser;
    String? dataLaporan;

    factory DataPelaporanElement.fromJson(Map<String, dynamic> json) => DataPelaporanElement(
        idLaporan: json["id_laporan"],
        idUser: json["id_user"],
        dataLaporan: json["data_laporan"],
    );

}
