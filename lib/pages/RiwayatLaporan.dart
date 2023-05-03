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
  List<DataPelaporanElement>? dataElement = [];

  // void getUserIdRiwayat() async {
  //   var data = DataUser().getUserId();
  //   data.then((value) {
  //     setState(() {
  //       PostDataRiwayat(value.toString());
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getUserIdRiwayat();
  }

  // PostDataRiwayat(String id) async {
  //   var result = await APIClient()
  //       .postData('showPelaporan', {"userid": id}).catchError((err) {});

  //   if (result != null) {
  //     var dataRiwayat = dataPelaporanFromJson(result);
  //     if (dataRiwayat.kondisi) {
  //       setState(() {
  //         dataElement = dataRiwayat.dataPelaporan;
  //       });
  //     }
  //   } else {
  //     print("data kosong");
  //   }
  // }

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Center(
          child: Text(
            "Riwayat Laporan ",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: isRiwayatNull(
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
    return cobaList.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: cobaList.length,
            itemBuilder: (context, index) {
              var date = cobaList[index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                padding: EdgeInsets.all(
                  20,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailRiwayatLengkap(
                            cobaList[index].idLap.toString())));
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
                          cobaList[index].title.toString(),
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
                                cobaList[index].alamat.toString(),
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
                        Card(
                          
                            color: Colors.greenAccent,
                            elevation: 10,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  cobaList[index].status.toString(),
                                  textAlign: TextAlign.end,
                                )))
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
