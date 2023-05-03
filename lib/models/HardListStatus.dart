import 'package:flutter/material.dart';

class hardListStatus {
  String? idStatus;
  String? namaStatus;
  

  hardListStatus(
      {
        required this.idStatus,
        required this.namaStatus,
        

      });
}

List<hardListStatus> hardStatusList = [
  hardListStatus(
    idStatus: "1",
    namaStatus:"Semua"),

    hardListStatus(
    idStatus: "2",
    namaStatus:"Menunggu"),

    hardListStatus(
    idStatus: "3",
    namaStatus:"Selesai"),

    hardListStatus(
    idStatus: "4",
    namaStatus:"Ditolak"),
];
