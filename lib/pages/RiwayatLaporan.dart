import 'package:edamkar_1/SharedPreferences/laporanData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/main.dart';
import 'package:edamkar_1/models/datacoba.dart';

class RiwayatLaporan extends StatefulWidget {
  const RiwayatLaporan({super.key});

  @override
  State<StatefulWidget> createState() => _RiwayatLaporanState();
}

class _RiwayatLaporanState extends State<RiwayatLaporan> {
  var idLap = '';

  // void getLaporanData() async {
  //   var data = laporanData().getIdLap();
  //   data.then((value) {
  //     setState(() {
  //       idLap = value.toString();
  //     });
  //   });
  // }

  // void initState() {
  //   super.initState();
  //   // getLaporanData();
  // }

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
            itemCount: cobaList.length,
            itemBuilder: (context, index) {
              cobadata cobaDatax = cobaList[index];
              return Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: ListTile(
                  leading: Text(
                    cobaDatax.tanggal,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  title: Text(
                    cobaDatax.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    cobaDatax.alamat,
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
