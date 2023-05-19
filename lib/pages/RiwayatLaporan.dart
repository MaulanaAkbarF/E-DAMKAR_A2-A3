import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/SharedPreferences/laporanData.dart';
import 'package:edamkar_1/models/LaporanElement.dart';
import 'package:edamkar_1/pages/DetailRiwayatLaporan.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:edamkar_1/style/app_style.dart';

import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final search = TextEditingController();
  TextEditingController controllerSearch = new TextEditingController();

  List<Datum>? dataElement = [];
  List<Datum>? searchData = [];

  void getUserIdRiwayat() async {
    var dataId = DataUser().getUserId();
    dataId.then((value) {
      setState(() {
        // print(value.toString());
        PostDataRiwayat(value.toString());
      });
    });
  }

  void getUserIdRiwayatforSearch() async {
    var dataId = DataUser().getUserId();
    dataId.then((value) {
      setState(() {
        // print(value.toString());
        PostDataSearch(value, search.text);
      });
    });
  }

  void getIdStatus() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      setState(() {
        PostRiwayatMenunggu(value.toString());
      });
    });
  }

  void getIdStatusProses() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      setState(() {
        PostRiwayatProses(value.toString());
      });
    });
  }

  void getIdStatusSelesai() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      setState(() {
        PostRiwayatSelesai(value.toString());
      });
    });
  }

  void getIdStatusDitolak() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      setState(() {
        PostRiwayatDitolak(value.toString());
      });
    });
  }

  void getIdStatusEmergency() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      setState(() {
        PostRiwayatEmergency(value.toString());
      });
    });
  }

  // List<Datum>? _foundData = [];
  @override
  void initState() {
    super.initState();
    getUserIdRiwayat();
  }

  List<Datum>? searchKosong = [];

  PostDataSearch(int id, String kata) async {
    // search.clear();
    var result =
        await APIClient().getData('searchLapp/' + id.toString() + "/" + kata);
    if (result != null) {
      var dataSearch = dataPelaporanFromJson(result);
      if (dataSearch.data.isNotEmpty) {
        setState(() {
          searchData = dataSearch.data;
        });
      } else {
        setState(() {
          searchData = searchKosong;

          print("masukan salah");
        });
      }
    } else {
      print("masukan salah");
    }
  }

  PostRiwayatMenunggu(String id) async {
    var result = await APIClient().getData('filterLapMenunggu/' + id);
    if (result != null) {
      var dataMenunggu = dataPelaporanFromJson(result);
      if (dataMenunggu.data.isNotEmpty) {
        setState(() {
          dataElement = dataMenunggu.data;
        });
      }
    } else {
      print("Status Menunggu kosong");
    }
  }

  PostRiwayatProses(String id) async {
    var result = await APIClient().getData('filterLapProses/' + id);
    if (result != null) {
      var dataProses = dataPelaporanFromJson(result);
      if (dataProses.data.isNotEmpty) {
        setState(() {
          dataElement = dataProses.data;
        });
      }
    } else {
      print("Status Proses kosong");
    }
  }

  PostRiwayatSelesai(String id) async {
    var result = await APIClient().getData('filterLapSelesai/' + id);
    if (result != null) {
      var dataSelesai = dataPelaporanFromJson(result);
      if (dataSelesai.data.isNotEmpty) {
        setState(() {
          dataElement = dataSelesai.data;
        });
      }
    } else {
      print("Status Selesai kosong");
    }
  }

  PostRiwayatDitolak(String id) async {
    var result = await APIClient().getData('filterLapDitolak/' + id);
    if (result != null) {
      var dataDitolak = dataPelaporanFromJson(result);
      if (dataDitolak.data.isNotEmpty) {
        setState(() {
          dataElement = dataDitolak.data;
        });
      }
    } else {
      print("Status Ditolak kosong");
    }
  }

  PostRiwayatEmergency(String id) async {
    var result = await APIClient().getData('filterLapEmergency/' + id);
    if (result != null) {
      var dataEmer = dataPelaporanFromJson(result);
      if (dataEmer.data.isNotEmpty) {
        setState(() {
          dataElement = dataEmer.data;
        });
      }
    } else {
      print("Status Ditolak kosong");
    }
  }

  // PostDetailRiwayat() async {
  //   var result = await APIClient().getData('getPelaporan/' + '11');

  //   if (result != null) {
  //     var data = dataPelaporanFromJson(result);
  //     if (data.data.isNotEmpty) {
  //       await laporanData().addLapor(
  //         dataElement![data].idLaporan.toString(),
  //         dataElement![result].alamat.toString(),
  //         dataElement![result].deskripsi.toString(),
  //         dataElement![result].imageUrl.toString(),
  //         dataElement![result].statusRiwayat.toString(),
  //         dataElement![result].kategoriLaporan.toString(),
  //         dataElement![result].tanggal.toString()

  //       );
  //     }
  //   }
  // }

  PostDataRiwayat(String id) async {
    dataElement!.clear();
    var result = await APIClient().getData('getPelaporan/' + id);

    print("asda0" + id);

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
    primary: Colors.white,
    backgroundColor: Color.fromARGB(255, 224, 36, 36),
    padding: EdgeInsets.symmetric(
        horizontal: paddingHorozontal1, vertical: paddingVertical1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(20),
    )),
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

  void _runSearch(String enteredKeyword) {


    if (enteredKeyword.isEmpty) {
      getUserIdRiwayat();
    } else {
      getUserIdRiwayatforSearch();
      print("kata search : " + search.text);
    }

    // setState(() {
    //   _foundData = searchData;
    // });
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
                    controller: search,
                    onChanged: _runSearch,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                          allow: true)
                    ],
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getUserIdRiwayat,
                              child: Text("Semua")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getIdStatusEmergency,
                              child: Text("Emergency")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getIdStatus,
                              child: Text("Menunggu")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getIdStatusDitolak,
                              child: Text("Ditolak")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getIdStatusSelesai,
                              child: Text("Selesai")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: SizeConfig.screenWidth,
              color: Colors.black26,
            ),
            Expanded(
                child:
                    search.text.isEmpty ? isRiwayatNull() : isRiwayatSeacrh())
          ],
        ),
        //
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

  Widget dataSearchKosong() {
    return Align(
      alignment: Alignment.center,
      child: Text("Kata kunci tidak ada hasil !"),
    );
  }

  Widget isRiwayatNull() {
    return dataElement == null
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
                  10,
                ),
                child: ListTile(
                  onTap: () {
                    //
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailRiwayatLengkap(
                              idLapp: dataElement![index].idLaporan),
                        ));
                  },
                  leading: Container(
                    width: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: paddingHorozontal1),
                              child: Card(
                                color: () {
                                  if (dataElement![index].statusRiwayat ==
                                      "Menunggu") {
                                    return Color.fromARGB(255, 250, 202, 21);
                                  } else if (dataElement![index]
                                          .statusRiwayat ==
                                      "Ditangani") {
                                    return Color.fromARGB(255, 63, 131, 248);
                                  } else if (dataElement![index]
                                          .statusRiwayat ==
                                      "Selesai") {
                                    return Color.fromARGB(255, 14, 159, 110);
                                  } else if (dataElement![index]
                                          .statusRiwayat ==
                                      "Ditolak") {
                                    return Color.fromARGB(255, 224, 36, 36);
                                  } else if (dataElement![index]
                                          .statusRiwayat ==
                                      "Emergency") {
                                    return Colors.black26; // default color
                                  } else {
                                    return Colors.white;
                                  }
                                }(),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    dataElement![index]
                                        .statusRiwayat
                                        .toString(),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }

  Widget isRiwayatSeacrh() {
    return searchData == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Data Seacrh Kosong"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: searchData!.length,
            itemBuilder: (context, index) {
              var date = searchData![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: ListTile(
                    onTap: () {
                      //
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRiwayatLengkap(
                                idLapp: searchData![index].idLaporan),
                          ));
                    },
                    leading: Container(
                      width: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            searchData![index].kategoriLaporan.toString(),
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
                                  searchData![index].alamat.toString(),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: paddingHorozontal1),
                                child: Card(
                                  color: () {
                                    if (searchData![index].statusRiwayat ==
                                        "Menunggu") {
                                      return Color.fromARGB(255, 250, 202, 21);
                                    } else if (searchData![index]
                                            .statusRiwayat ==
                                        "Ditangani") {
                                      return Color.fromARGB(255, 63, 131, 248);
                                    } else if (searchData![index]
                                            .statusRiwayat ==
                                        "Selesai") {
                                      return Color.fromARGB(255, 14, 159, 110);
                                    } else if (searchData![index]
                                            .statusRiwayat ==
                                        "Ditolak") {
                                      return Color.fromARGB(255, 224, 36, 36);
                                    } else if (searchData![index]
                                            .statusRiwayat ==
                                        "Emergency") {
                                      return Colors.black26; // default color
                                    } else {
                                      return Colors.white;
                                    }
                                  }(),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      searchData![index]
                                          .statusRiwayat
                                          .toString(),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            });
  }
}
