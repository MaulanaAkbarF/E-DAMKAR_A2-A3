import 'dart:convert';

import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/SharedPreferences/laporanData.dart';
import 'package:edamkar_1/pages/DetailRiwayatLaporan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/main.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';

import '../APIRequest/APIClient.dart';

class RiwayatLaporan extends StatefulWidget {
  const RiwayatLaporan({super.key});

  @override
  State<StatefulWidget> createState() => _RiwayatLaporanState();
}

class _RiwayatLaporanState extends State<RiwayatLaporan> {

  List<DataPelaporanElement>? dataElement = [];

  PostDataRiwayat() async {
    var result = await APIClient()
        .postData('showPelaporan', {"userid": DataUser().getUserId()}).catchError((err) {});
    if (result != null) {
      var dataRiwayat = dataPelaporanFromJson(result);
      if (dataRiwayat.kondisi) {
        setState(() {
          dataElement = dataRiwayat.dataPelaporan;
        });
      }
    } else {
      print("data kosong");
    }
  }

  String monthString(String month) {
    switch (month) {
      case "01":
        return "Jan";
      case "02":
        return "Feb";
      case "03":
        return "Mar";
      case "04":
        return "Apr";
      case "05":
        return "Mei";
      case "06":
        return "Jun";
      case "07":
        return "Jul";
      case "08":
        return "Agu";
      case "09":
        return "Sep";
      case "10":
        return "Okt";
      case "11":
        return "Nov";
      case "12":
        return "Des";
    }
    return "bulan";
  }

  @override
  void initState() {
    super.initState();
    PostDataRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Riwayat Laporan ",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: dataElement!.length,
            itemBuilder: (context, index) {
              var date = dataElement![index].tglLap.toString();
              final splitDate = date.split('-');
              return Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailRiwayatLengkap(
                            dataElement![index].idLap.toString())));
                  },
                  leading: Column(
                    children: [
                      Text(
                        splitDate[2],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        monthString(splitDate[1]),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        splitDate[0],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    dataElement![index].namaKategori.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    dataElement![index].namaStatus.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
