import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/riwayat_laporan_controller.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({super.key});

  @override
  Widget build(BuildContext context) {
    final rwtController = Get.put(RiwayatLaporanController());

    return Obx(() => rwtController.searchData == null
        ? Align(
            alignment: Alignment.center,
            child: Text("${rwtController.textSearch} tidak ditemukan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: rwtController.searchData!.length,
            itemBuilder: (context, index) {
              var date = rwtController.searchData![index].tanggal.toString();
              final splitDate = date.split('-');
              var data = rwtController.searchData![index];
              return Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: GestureDetector(
                      onTap: () => rwtController.goToDetail(data.idLaporan),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(splitDate[2], style: StyleTxt.m()),
                            Text(rwtController.monthString(splitDate[1]),
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
                                  data.kategoriLaporan.toString(),
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
                                      data.alamat.toString(),
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
                                    SizedBox(
                                      width: 80,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: paddingHorozontal1),
                                      child: Card(
                                        color: () {
                                          if (data.statusRiwayat ==
                                              "Menunggu") {
                                            return const Color.fromARGB(
                                                255, 250, 202, 21);
                                          } else if (data.statusRiwayat ==
                                              "Ditangani") {
                                            return const Color.fromARGB(
                                                255, 63, 131, 248);
                                          } else if (data.statusRiwayat ==
                                              "Selesai") {
                                            return const Color.fromARGB(
                                                255, 17, 178, 124);
                                          } else if (data.statusRiwayat ==
                                              "Ditolak") {
                                            return const Color.fromARGB(
                                                255, 224, 36, 36);
                                          } else if (data.statusRiwayat ==
                                              "Emergency") {
                                            return Colors
                                                .black26; // default color
                                          } else {
                                            return Colors.white;
                                          }
                                        }(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            data.statusRiwayat.toString(),
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
            }));
  }
}
