import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/pages/DetailRiwayatLaporan.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:edamkar_1/style/app_style.dart';

import 'package:edamkar_1/style/size_config.dart';
import '../APIRequest/APIClient.dart';
import '../Menu/Menu.dart';
import 'package:edamkar_1/models/HardLaporan.dart';
import 'package:edamkar_1/models/HardListStatus.dart';

class RiwayatLaporan extends StatefulWidget {
  const RiwayatLaporan({super.key});

  @override
  State<StatefulWidget> createState() => _RiwayatLaporanState();
}

class _RiwayatLaporanState extends State<RiwayatLaporan> {
  List<Datum>? dataElement = [];

  void getUserIdRiwayat() async {
    var data = DataUser().getUserId();
    data.then((value) {
      setState(() {
        PostDataRiwayat(value.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserIdRiwayat();
  }

  PostDataRiwayat(String id) async {
    var result = await APIClient().getData('getPelaporan/' + id);

    if (result != null) {
      var dataRiwayat = dataPelaporanFromJson(result);
      if (dataRiwayat.data.isNotEmpty) {
        setState(() {
          dataElement = dataRiwayat.data;
        });
      }
    } else {
      print("data kosong");
    }
  }
  // ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

  final List<Map> teksLaporan = [
    {
      'Header': 'Riwayat Laporan',
      'judulLaporan': 'Laporan Bencana Alam',
      'deskripsiLaporan': 'Salah satu layanan dari E-Damkar ',
      'namaBencanaHint': 'contoh: Tsunami, Banjir, Kebakaran, dll',
      'noTelp': 'Nomor Telepon',
      'noTelpHint': 'Masukkan nomor telepon aktif',
      'deskripsiBawah':
          'Tidak menemukan kategori yang anda cari? Buat laporan anda sendiri',
      'deskripsiHint':
          '(opsional) Jelaskan secara singkat kejadian yang sedang terjadi',
      'buttonKirim': 'Buat laporan anda',
      'buttonImage': 'Pilih gambar',
    }
  ].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

  final List<Map> teksStyleLaporan = [
    {
      'Bold1': const TextStyle(
          fontFamily: "font/inter_black.ttf",
          color: Color(0x374151),
          fontSize: (20),
          fontWeight: FontWeight.w700),
      'TittleBold': const TextStyle(
          fontFamily: "font/inter_bold.ttf",
          color: Color(0x374151),
          fontSize: (20),
          fontWeight: FontWeight.w700),
      'SemiBold1': const TextStyle(
          fontFamily: "font/inter_bold.ttf",
          color: Colors.black45,
          fontSize: (16)),
      'SemiBold2': const TextStyle(
          fontFamily: "font/inter_extrabold.ttf",
          color: Colors.blueAccent,
          fontSize: (18),
          fontWeight: FontWeight.w500),
      'SemiBold3': const TextStyle(
          fontFamily: "font/inter_extrabold.ttf",
          color: Colors.black54,
          fontSize: (18),
          fontWeight: FontWeight.w700),
      'Thin1': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.black,
          fontSize: (18),
          fontWeight: FontWeight.w500),
      'Thin2': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.black54,
          fontSize: (18),
          fontWeight: FontWeight.w600),
      'Thin3': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.grey,
          fontSize: (18),
          fontWeight: FontWeight.w600)
    }
  ];

//

  final ButtonStyle _buttonStyle = TextButton.styleFrom(
    primary: Colors.amber,
    padding: EdgeInsets.symmetric(
        horizontal: paddingHorozontal1, vertical: paddingVertical1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2))),
  );

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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (final teks in teksLaporan)
              for (final teksStyle in teksStyleLaporan)
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Text(
                      "Riwayat Laporan",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color.fromARGB(255, 55, 65, 81),
                          fontFamily: "font/inter_bold.ttf",
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorozontal2, vertical: paddingVertical1),
              child: Column(
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                        fontFamily: "font/inter_regular.ttf",
                        color: Color.fromARGB(255, 107, 114, 128),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_sharp),
                        prefixIconColor: Color.fromARGB(255, 209, 213, 219),
                        filled: true,
                        hintText: "Cari riwayat laporan anda",
                        fillColor: Color.fromARGB(255, 249, 250, 251),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 209, 213, 219)))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                              style: _buttonStyle,
                              onPressed: null,
                              child: Text("Semua")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: null,
                              child: Text("Menunggu")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: null,
                              child: Text("Ditolak")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: null,
                              child: Text("Selesai")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: isRiwayatNull()),
          ],
        ),
        // child: Column(
        //   children: <Widget>[
        //     Container(
        //       child: Column(
        //         children: [
        //           Expanded(
        //             child: ListView.builder(
        //               shrinkWrap: true,
        //               scrollDirection: Axis.horizontal,
        //               itemCount: hardStatusList.length,
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: EdgeInsets.all(10),
        //                   child: ListTile(
        //                       title: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text("Semua"),
        //                       Text("Menunggu"),
        //                       Text("Selesai"),
        //                       Text("Ditolak"),
        //                     ],
        //                   )),
        //                 );
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
      ),
      // SingleChildScrollView(
      //   child: isRiwayatNull(),
      // )
      //   ],
      // ),
      // ),
      bottomNavigationBar: AppMenu(),
    );
  }

  Widget isRiwayatNull() {
    return dataElement!.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: dataElement!.length,
            itemBuilder: (context, index) {
              var date = dataElement![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                padding: EdgeInsets.all(
                  20,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailRiwayatLengkap(
                            dataElement![index].idLaporan)));
                  },
                  leading: Container(
                    width: 70,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              splitDate[2],
                              style: TextStyle(
                                fontFamily: "font/inter_semibold.tff",
                                fontWeight: FontWeight.w600,
                                // fontSize: 16,
                              ),
                            ),
                            Text(
                              monthString(splitDate[1]),
                              style: TextStyle(
                                  // fontSize: 15,
                                  fontFamily: "$thin1"),
                            ),
                            Text(
                              splitDate[0],
                              style: TextStyle(
                                  // fontSize: 15,
                                  fontFamily: "$thin1"),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 5,
                          // color: Colors.black38,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        )
                      ],
                    ),
                  ),
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dataElement![index].kategoriLaporan.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "$black2",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on_outlined),
                            Flexible(
                              child: Text(
                                dataElement![index].alamat.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                // softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingHorozontal1),
                          child: Card(
                              color: Colors.greenAccent,
                              elevation: 10,
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    dataElement![index]
                                        .statusRiwayat
                                        .toString(),
                                    textAlign: TextAlign.end,
                                  ))),
                        )
                      ],
                    ),
                  ),
                  // title: Text(
                  //   cobaList[index].alamat.toString(),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // subtitle: Text(
                  //   cobaList[index].deskripsi.toString(),
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ),
              );
            });
  }
}
