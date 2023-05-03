import 'package:flutter/material.dart';

class hardArtikel {
  String? idArtikel;
  String? judulArtikel;
  String? artikelIdKat;
  String? artikelTgl;
  String? artikelIdDamkar;
  String? deksripsiArtikel;
  String? namaLengkapDamkar;
  String? namaArtikel;

  hardArtikel(
      {
        required this.idArtikel,
        required this.judulArtikel,
        required this.artikelIdKat,
        required this.artikelTgl,
        required this.artikelIdDamkar,
        required this.deksripsiArtikel,
        required this.namaLengkapDamkar,
        required this.namaArtikel,

      });
}

List<hardArtikel> hardArtikelList = [
  hardArtikel(
    idArtikel:"1",
    judulArtikel:"Kebakaran Pabrik di Kawasan Perumahan Locaret",
    artikelIdKat: "1",
    artikelTgl:"23 Februari 2023",
    artikelIdDamkar:"1",
    deksripsiArtikel:"Berdasarkan informasi dan laporan dari Taman Nasional Bromo Tengger Semeru bahwa telah terjadi kebakaran lahan di",
    namaLengkapDamkar: "Suharjo", 
    namaArtikel: "Berita"),

    hardArtikel(
    idArtikel:"2",
    judulArtikel:"Kebakaran Gudang ",
    artikelIdKat: "1",
    artikelTgl:"23 Februari 2023",
    artikelIdDamkar:"1",
    deksripsiArtikel:"Berdasarkan informasi dan laporan dari Taman Nasional Bromo Tengger Semeru bahwa telah terjadi kebakaran lahan di",
    namaLengkapDamkar: "Suharjo", 
    namaArtikel: "Berita"),

    hardArtikel(
    idArtikel:"3",
    judulArtikel:"Kebakaran diperumahan",
    artikelIdKat: "1",
    artikelTgl:"23 Februari 2023",
    artikelIdDamkar:"1",
    deksripsiArtikel:"Berdasarkan informasi dan laporan dari Taman Nasional Bromo Tengger Semeru bahwa telah terjadi kebakaran lahan di",
    namaLengkapDamkar: "Suharjo", 
    namaArtikel: "Berita"),

    hardArtikel(
    idArtikel:"4",
    judulArtikel:"Kebakaran di desa",
    artikelIdKat: "1",
    artikelTgl:"23 Februari 2023",
    artikelIdDamkar:"1",
    deksripsiArtikel:"Berdasarkan informasi dan laporan dari Taman Nasional Bromo Tengger Semeru bahwa telah terjadi kebakaran lahan di",
    namaLengkapDamkar: "Suharjo", 
    namaArtikel: "Berita"),
  
];
