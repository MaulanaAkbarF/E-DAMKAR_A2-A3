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
          color: Color(0x00374151),
          fontSize: (20),
          fontWeight: FontWeight.w700),
      'TittleBold': const TextStyle(
          fontFamily: "font/inter_bold.ttf",
          color: Color(0x00374151),
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
    // TabController tabController = TabController(length: 6, vsync: this)

    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Konfirmasi keluar !"),
                content: const Text("Apakah anda yakin untuk Keluar ?"),
                actions: <Widget>[
                  FloatingActionButton(
                      child: const Text("Tidak"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  FloatingActionButton(
                      child: const Text("Ya"),
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
              const Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Text(
                    "Riwayat Pelaporan",
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
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal2, vertical: paddingVertical1),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onTap: () => controller.goSearch(),
                      controller: controller.search.value,
                      onChanged: (_) => controller.runSearch(),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                            allow: true)
                      ],
                      style: const TextStyle(
                          fontFamily: "font/inter_regular.ttf",
                          color: Color.fromARGB(255, 107, 114, 128),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          prefixIcon: const Icon(Icons.search_sharp),
                          prefixIconColor:
                              const Color.fromARGB(255, 209, 213, 219),
                          filled: true,
                          hintText: "Cari riwayat laporan anda",
                          fillColor: const Color.fromARGB(255, 249, 250, 251),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 209, 213, 219)))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                        isScrollable: true,
                        unselectedLabelColor:
                            const Color.fromARGB(255, 165, 165, 165),
                        indicatorColor: orange1,
                        labelColor: black,
                        controller: controller.tabController,
                        tabs: const [
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
                            text: "Ditangani",
                          ),
                          Tab(
                            text: "Selesai",
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
                  child: TabBarView(
                      controller: controller.tabController,
                      children: [
                    const Pencarian(),
                    isRiwayatNull(),
                    menunggu(),
                    proses(),
                    ditangani(),
                    selesai(),
                    ditolak()
                  ]))
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
    return const Align(
      alignment: Alignment.center,
      child: Text("Kata kunci tidak ada hasil !"),
    );
  }

  Widget isRiwayatNull() {
    return Obx(() => controller.dataElement == null
        ? RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                    height: SizeConfig.screenHeightHalf,
                    child: const Center(
                      child: Text("Anda belum pernah mengajukan laporan"),
                    ))))
        : RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: ListView.builder(
                itemCount: controller.dataElement!.length,
                itemBuilder: (context, index) {
                  var date = controller.dataElement![index].tanggal.toString();
                  final splitDate = date.split('-');
                  return Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: GestureDetector(
                          onTap: () => controller.goToDetail(
                              controller.dataElement![index].idLaporan),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 5,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: grey1,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const SizedBox(
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
                                          .dataElement![index].kategoriLaporan
                                          .toString(),
                                      style: StyleTxt.sb(size: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: paddingHorozontal1),
                                          child: Card(
                                            color: controller.setColorStatus(
                                                controller.dataElement![index]
                                                    .statusRiwayat),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
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
                })));
  }

  Widget menunggu() {
    return Obx(() => controller.dataMenunggu != null
        ? controller.dataMenunggu!.value.data!.isEmpty
            ? RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: SizeConfig.screenHeightHalf,
                        child: const Center(
                          child: Text(
                              "Tidak ada pelaporan yang menunggu untuk di proses"),
                        ))))
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                    itemCount: controller.dataMenunggu!.value.data!.length,
                    itemBuilder: (context, index) {
                      var date = controller
                          .dataMenunggu!.value.data![index].tanggal
                          .toString();
                      var data = controller.dataMenunggu!.value.data![index];
                      final splitDate = date.split('-');
                      return Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: GestureDetector(
                              onTap: () =>
                                  controller.goToDetail(data.idLaporan!),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 5,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: grey1,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        child: Text(
                                          data.kategoriLaporan!,
                                          style: StyleTxt.sb(size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: orange1,
                                            ),
                                            Flexible(
                                                child: Text(
                                              data.alamat!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              // padding: EdgeInsets.symmetric(
                                              //     horizontal: paddingHorozontal1),
                                              child: Card(
                                                color:
                                                    controller.setColorStatus(
                                                        data.statusRiwayat!),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    data.statusRiwayat!,
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
                    }))
        : const CircularProgressIndicator());
  }

  Widget proses() {
    return Obx(() => controller.dataProses != null
        ? controller.dataProses!.value.data!.isEmpty
            ? RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: SizeConfig.screenHeightHalf,
                        child: const Center(
                          child: Text("Tidak ada laporan yang diproses"),
                        ))))
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                    itemCount: controller.dataProses!.value.data!.length,
                    itemBuilder: (context, index) {
                      var date = controller
                          .dataProses!.value.data![index].tanggal
                          .toString();
                      var data = controller.dataProses!.value.data![index];
                      final splitDate = date.split('-');
                      return Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: GestureDetector(
                              onTap: () =>
                                  controller.goToDetail(data.idLaporan!),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 5,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: grey1,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        child: Text(
                                          data.kategoriLaporan.toString(),
                                          style: StyleTxt.sb(size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: orange1,
                                            ),
                                            Flexible(
                                                child: Text(
                                              data.alamat.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              // padding: EdgeInsets.symmetric(
                                              //     horizontal: paddingHorozontal1),
                                              child: Card(
                                                color:
                                                    controller.setColorStatus(
                                                        data.statusRiwayat!),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    data.statusRiwayat
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
                    }))
        : const CircularProgressIndicator());
  }

  Widget ditangani() {
    return Obx(() => controller.dataDitangani != null
        ? controller.dataDitangani!.value.data!.isEmpty
            ? RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: SizeConfig.screenHeightHalf,
                        child: const Center(
                          child: Text("Tidak ada laporan yang ditangani"),
                        ))))
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                    itemCount: controller.dataDitangani!.value.data!.length,
                    itemBuilder: (context, index) {
                      var date = controller
                          .dataDitangani!.value.data![index].tanggal
                          .toString();
                      var data = controller.dataDitangani!.value.data![index];
                      final splitDate = date.split('-');
                      return Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: GestureDetector(
                              onTap: () =>
                                  controller.goToDetail(data.idLaporan!),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 5,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: grey1,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        child: Text(
                                          data.kategoriLaporan.toString(),
                                          style: StyleTxt.sb(size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: orange1,
                                            ),
                                            Flexible(
                                                child: Text(
                                              data.alamat.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              // padding: EdgeInsets.symmetric(
                                              //     horizontal: paddingHorozontal1),
                                              child: Card(
                                                color:
                                                    controller.setColorStatus(
                                                        data.statusRiwayat!),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    data.statusRiwayat
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
                    }))
        : const CircularProgressIndicator());
  }

  Widget selesai() {
    return Obx(() => controller.dataSelesai != null
        ? controller.dataSelesai!.value.data!.isEmpty
            ? RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: SizeConfig.screenHeightHalf,
                        child: const Center(
                          child: Text("Laporan selesai masih kosong"),
                        ))))
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                    itemCount: controller.dataSelesai!.value.data!.length,
                    itemBuilder: (context, index) {
                      var date = controller
                          .dataSelesai!.value.data![index].tanggal
                          .toString();
                      var data = controller.dataSelesai!.value.data![index];
                      final splitDate = date.split('-');
                      return Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: GestureDetector(
                              onTap: () =>
                                  controller.goToDetail(data.idLaporan!),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 5,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: grey1,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        child: Text(
                                          data.kategoriLaporan.toString(),
                                          style: StyleTxt.sb(size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: orange1,
                                            ),
                                            Flexible(
                                                child: Text(
                                              data.alamat.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              // padding: EdgeInsets.symmetric(
                                              //     horizontal: paddingHorozontal1),
                                              child: Card(
                                                color:
                                                    controller.setColorStatus(
                                                        data.statusRiwayat!),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    data.statusRiwayat
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
                    }))
        : const CircularProgressIndicator());
  }

  Widget ditolak() {
    return Obx(() => controller.dataDitolak != null
        ? controller.dataDitolak!.value.data!.isEmpty
            ? RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: SizeConfig.screenHeightHalf,
                        child: const Center(
                          child: Text("Tidak ada pelaporan yang ditolak"),
                        ))))
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                    itemCount: controller.dataDitolak!.value.data!.length,
                    itemBuilder: (context, index) {
                      var date = controller
                          .dataDitolak!.value.data![index].tanggal
                          .toString();
                      var data = controller.dataDitolak!.value.data![index];
                      final splitDate = date.split('-');
                      return Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: GestureDetector(
                              onTap: () =>
                                  controller.goToDetail(data.idLaporan!),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 5,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: grey1,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        child: Text(
                                          data.kategoriLaporan.toString(),
                                          style: StyleTxt.sb(size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: orange1,
                                            ),
                                            Flexible(
                                                child: Text(
                                              data.alamat.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              // padding: EdgeInsets.symmetric(
                                              //     horizontal: paddingHorozontal1),
                                              child: Card(
                                                color:
                                                    controller.setColorStatus(
                                                        data.statusRiwayat!),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    data.statusRiwayat
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
                    }))
        : const CircularProgressIndicator());
  }
}
