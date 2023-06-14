import 'package:edamkar_1/src/riwayatLaporans/controller/riwayat_laporan_controller.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RiwayatLaporanView extends GetView<RiwayatLaporanController> {
  RiwayatLaporanView({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Konfirmasi keluar !"),
                content: Text("Apakah anda yakin untuk Keluar ?"),
                actions: <Widget>[
                  FloatingActionButton(
                      child: Text("Tidak"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  FloatingActionButton(
                      child: Text("Ya"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      })
                ],
              );
            });
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // for (final teks in teksLaporan)
              //   for (final teksStyle in teksStyleLaporan)
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
                      controller: controller.search,
                      onChanged: controller.runSearch,
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
                                style: controller.buttonStyle,
                                onPressed: controller.getUserIdRiwayat,
                                child: Text("Semua")),
                            SizedBox(
                              width: 50,
                            ),
                            TextButton(
                                style: controller.buttonStyle,
                                onPressed: controller.getIdStatusEmergency,
                                child: Text("Emergency")),
                            SizedBox(
                              width: 50,
                            ),
                            TextButton(
                                style: controller.buttonStyle,
                                onPressed: controller.getIdStatus,
                                child: Text("Menunggu")),
                            SizedBox(
                              width: 50,
                            ),
                            TextButton(
                                style: controller.buttonStyle,
                                onPressed: controller.getIdStatusDitolak,
                                child: Text("Ditolak")),
                            SizedBox(
                              width: 50,
                            ),
                            TextButton(
                                style: controller.buttonStyle,
                                onPressed: controller.getIdStatusSelesai,
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
                  child: controller.search.text.isEmpty
                      ? isRiwayatNull()
                      : isRiwayatSeacrh())
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
      ),
    );
  }

  Widget dataSearchKosong() {
    return Align(
      alignment: Alignment.center,
      child: Text("Kata kunci tidak ada hasil !"),
    );
  }

  Widget isRiwayatNull() {
    return controller.dataElement == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dataElement!.length,
            itemBuilder: (context, index) {
              var date = controller.dataElement![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                padding: EdgeInsets.all(
                  10,
                ),
                child: ListTile(
                  onTap: () => controller
                      .goToDetail(controller.dataElement![index].idLaporan),
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
                              controller.monthString(splitDate[1]),
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
                          controller.dataElement![index].kategoriLaporan
                              .toString(),
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
                                controller.dataElement![index].alamat
                                    .toString(),
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
                                  if (controller
                                          .dataElement![index].statusRiwayat ==
                                      "Menunggu") {
                                    return Color.fromARGB(255, 250, 202, 21);
                                  } else if (controller
                                          .dataElement![index].statusRiwayat ==
                                      "Ditangani") {
                                    return Color.fromARGB(255, 63, 131, 248);
                                  } else if (controller
                                          .dataElement![index].statusRiwayat ==
                                      "Selesai") {
                                    return Color.fromARGB(255, 14, 159, 110);
                                  } else if (controller
                                          .dataElement![index].statusRiwayat ==
                                      "Ditolak") {
                                    return Color.fromARGB(255, 224, 36, 36);
                                  } else if (controller
                                          .dataElement![index].statusRiwayat ==
                                      "Emergency") {
                                    return Colors.black26; // default color
                                  } else {
                                    return Colors.white;
                                  }
                                }(),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    controller.dataElement![index].statusRiwayat
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
    return controller.searchData == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Data Seacrh Kosong"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.searchData!.length,
            itemBuilder: (context, index) {
              var date = controller.searchData![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: ListTile(
                    onTap: () => controller
                        .goToDetail(controller.searchData![index].idLaporan),
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
                                controller.monthString(splitDate[1]),
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
                            controller.searchData![index].kategoriLaporan
                                .toString(),
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
                                  controller.searchData![index].alamat
                                      .toString(),
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
                                    if (controller
                                            .searchData![index].statusRiwayat ==
                                        "Menunggu") {
                                      return Color.fromARGB(255, 250, 202, 21);
                                    } else if (controller
                                            .searchData![index].statusRiwayat ==
                                        "Ditangani") {
                                      return Color.fromARGB(255, 63, 131, 248);
                                    } else if (controller
                                            .searchData![index].statusRiwayat ==
                                        "Selesai") {
                                      return Color.fromARGB(255, 14, 159, 110);
                                    } else if (controller
                                            .searchData![index].statusRiwayat ==
                                        "Ditolak") {
                                      return Color.fromARGB(255, 224, 36, 36);
                                    } else if (controller
                                            .searchData![index].statusRiwayat ==
                                        "Emergency") {
                                      return Colors.black26; // default color
                                    } else {
                                      return Colors.white;
                                    }
                                  }(),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      controller
                                          .searchData![index].statusRiwayat
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
