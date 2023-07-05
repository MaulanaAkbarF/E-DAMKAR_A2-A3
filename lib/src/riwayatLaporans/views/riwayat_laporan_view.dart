import 'package:edamkar_1/src/riwayatLaporans/controller/riwayat_laporan_controller.dart';
import 'package:edamkar_1/src/riwayatLaporans/views/pencarian.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
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
        child: DefaultTabController(
          initialIndex: 2, //optional, starts from 0, select the tab by default
          length: 6,
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
                        horizontal: paddingHorozontal2,
                        vertical: paddingVertical1),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: controller.search.value,
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
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              prefixIcon: Icon(Icons.search_sharp),
                              prefixIconColor:
                                  Color.fromARGB(255, 209, 213, 219),
                              filled: true,
                              hintText: "Cari riwayat laporan anda",
                              fillColor: Color.fromARGB(255, 249, 250, 251),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(255, 209, 213, 219)))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const TabBar(
                            isScrollable: true,
                            unselectedLabelColor:
                                Color.fromARGB(255, 165, 165, 165),
                            indicatorColor: orange1,
                            labelColor: black,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.search),
                              ),
                              Tab(
                                text: "Semua",
                              ),
                              Tab(
                                text: "Menunggu",
                              ),
                              Tab(
                                text: "Proses",
                              ),
                              Tab(
                                text: "selesai",
                              ),
                              Tab(
                                text: "Ditolak",
                              ),
                            ])
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: Colors.black26,
                  ),
                  Expanded(
                      child: Obx(() => TabBarView(children: [
                            Pencarian(),
                            isRiwayatNull(),
                            menunggu(),
                            proses(),
                            selesai(),
                            ditolak()
                          ])))
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
        ));
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
                  child: GestureDetector(
                      onTap: () => controller
                          .goToDetail(controller.dataElement![index].idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(controller.monthString(splitDate[1]),
                                style: StyleTxt.m()),
                            Text(splitDate[0], style: StyleTxt.m()),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 90,
                          decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  controller.dataElement![index].kategoriLaporan
                                      .toString(),
                                  style: StyleTxt.sb(size: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: orange1,
                                    ),
                                    Flexible(
                                        child: Text(
                                      controller.dataElement![index].alamat
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (controller.dataElement![index]
                                                  .statusRiwayat ==
                                              "Menunggu") {
                                            return Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (controller
                                                  .dataElement![index]
                                                  .statusRiwayat ==
                                              "Ditangani") {
                                            return Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (controller
                                                  .dataElement![index]
                                                  .statusRiwayat ==
                                              "Selesai") {
                                            return Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (controller
                                                  .dataElement![index]
                                                  .statusRiwayat ==
                                              "Ditolak") {
                                            return Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (controller
                                                  .dataElement![index]
                                                  .statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            controller.dataElement![index]
                                                .statusRiwayat
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: StyleTxt.m(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      ])));
            });
  }

  Widget menunggu() {
    return controller.dataMenunggu == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dataMenunggu!.length,
            itemBuilder: (context, index) {
              var date = controller.dataMenunggu![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: GestureDetector(
                      onTap: () => controller.goToDetail(
                          controller.dataMenunggu![index].idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(controller.monthString(splitDate[1]),
                                style: StyleTxt.m()),
                            Text(splitDate[0], style: StyleTxt.m()),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 90,
                          decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  controller
                                      .dataMenunggu![index].kategoriLaporan
                                      .toString(),
                                  style: StyleTxt.sb(size: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: orange1,
                                    ),
                                    Flexible(
                                        child: Text(
                                      controller.dataMenunggu![index].alamat
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (controller.dataMenunggu![index]
                                                  .statusRiwayat ==
                                              "Menunggu") {
                                            return Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (controller
                                                  .dataMenunggu![index]
                                                  .statusRiwayat ==
                                              "Ditangani") {
                                            return Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (controller
                                                  .dataMenunggu![index]
                                                  .statusRiwayat ==
                                              "Selesai") {
                                            return Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (controller
                                                  .dataMenunggu![index]
                                                  .statusRiwayat ==
                                              "Ditolak") {
                                            return Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (controller
                                                  .dataMenunggu![index]
                                                  .statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            controller.dataMenunggu![index]
                                                .statusRiwayat
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: StyleTxt.m(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      ])));
            });
  }

  Widget proses() {
    return controller.dataProses == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dataProses!.length,
            itemBuilder: (context, index) {
              var date = controller.dataProses![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: GestureDetector(
                      onTap: () => controller
                          .goToDetail(controller.dataProses![index].idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(controller.monthString(splitDate[1]),
                                style: StyleTxt.m()),
                            Text(splitDate[0], style: StyleTxt.m()),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 90,
                          decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  controller.dataProses![index].kategoriLaporan
                                      .toString(),
                                  style: StyleTxt.sb(size: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: orange1,
                                    ),
                                    Flexible(
                                        child: Text(
                                      controller.dataProses![index].alamat
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (controller.dataProses![index]
                                                  .statusRiwayat ==
                                              "Menunggu") {
                                            return Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (controller
                                                  .dataProses![index]
                                                  .statusRiwayat ==
                                              "Ditangani") {
                                            return Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (controller
                                                  .dataProses![index]
                                                  .statusRiwayat ==
                                              "Selesai") {
                                            return Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (controller
                                                  .dataProses![index]
                                                  .statusRiwayat ==
                                              "Ditolak") {
                                            return Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (controller
                                                  .dataProses![index]
                                                  .statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            controller.dataProses![index]
                                                .statusRiwayat
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: StyleTxt.m(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      ])));
            });
  }

  Widget selesai() {
    return controller.dataSelesai == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dataSelesai!.length,
            itemBuilder: (context, index) {
              var date = controller.dataSelesai![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: GestureDetector(
                      onTap: () => controller
                          .goToDetail(controller.dataSelesai![index].idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(controller.monthString(splitDate[1]),
                                style: StyleTxt.m()),
                            Text(splitDate[0], style: StyleTxt.m()),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 90,
                          decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  controller.dataSelesai![index].kategoriLaporan
                                      .toString(),
                                  style: StyleTxt.sb(size: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: orange1,
                                    ),
                                    Flexible(
                                        child: Text(
                                      controller.dataSelesai![index].alamat
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (controller.dataSelesai![index]
                                                  .statusRiwayat ==
                                              "Menunggu") {
                                            return Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (controller
                                                  .dataSelesai![index]
                                                  .statusRiwayat ==
                                              "Ditangani") {
                                            return Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (controller
                                                  .dataSelesai![index]
                                                  .statusRiwayat ==
                                              "Selesai") {
                                            return Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (controller
                                                  .dataSelesai![index]
                                                  .statusRiwayat ==
                                              "Ditolak") {
                                            return Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (controller
                                                  .dataSelesai![index]
                                                  .statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            controller.dataSelesai![index]
                                                .statusRiwayat
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: StyleTxt.m(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      ])));
            });
  }

  Widget ditolak() {
    return controller.dataDitolak == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Anda belum pernah melakukan pelaporan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dataDitolak!.length,
            itemBuilder: (context, index) {
              var date = controller.dataDitolak![index].tanggal.toString();
              final splitDate = date.split('-');
              return Padding(
                  padding: EdgeInsets.all(
                    10,
                  ),
                  child: GestureDetector(
                      onTap: () => controller
                          .goToDetail(controller.dataDitolak![index].idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(controller.monthString(splitDate[1]),
                                style: StyleTxt.m()),
                            Text(splitDate[0], style: StyleTxt.m()),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 90,
                          decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Text(
                                  controller.dataDitolak![index].kategoriLaporan
                                      .toString(),
                                  style: StyleTxt.sb(size: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: orange1,
                                    ),
                                    Flexible(
                                        child: Text(
                                      controller.dataDitolak![index].alamat
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (controller.dataDitolak![index]
                                                  .statusRiwayat ==
                                              "Menunggu") {
                                            return Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (controller
                                                  .dataDitolak![index]
                                                  .statusRiwayat ==
                                              "Ditangani") {
                                            return Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (controller
                                                  .dataDitolak![index]
                                                  .statusRiwayat ==
                                              "Selesai") {
                                            return Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (controller
                                                  .dataDitolak![index]
                                                  .statusRiwayat ==
                                              "Ditolak") {
                                            return Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (controller
                                                  .dataDitolak![index]
                                                  .statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            controller.dataDitolak![index]
                                                .statusRiwayat
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: StyleTxt.m(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      ])));
            });
  }
}
