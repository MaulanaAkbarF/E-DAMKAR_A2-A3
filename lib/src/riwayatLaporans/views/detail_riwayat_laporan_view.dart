import 'package:edamkar_1/src/riwayatLaporans/controller/detail_riwayat_laporan_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/APIClient.dart';

class DetailRiwayatLengkapView extends GetView<DetailRiwayatLaporanController> {
  DetailRiwayatLengkapView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Detail Riwayat",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "font/inter_bold.ttf",
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        body: isDetailNull()
        // Column(
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        //       child: Column(
        //         children: <Widget>[
        //           Text(
        //             "judul",
        //             textAlign: TextAlign.justify,
        //             maxLines: 3,
        //             style: const TextStyle(
        //               color: Color.fromARGB(255, 51, 51, 51),
        //               fontSize: 20,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Container(
        //               width: 500,
        //               height: 200,
        //               // color: Colors.amberAccent,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8.0),
        //                 image: const DecorationImage(
        //                   image: NetworkImage(
        //                       'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'),
        //                 ),
        //               )),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Container(
        //             padding: const EdgeInsets.all(10),
        //             width: 500,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8),
        //                 border: Border.all(
        //                     color: const Color.fromARGB(255, 156, 163, 175),
        //                     width: 1)),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     Icon(Icons.location_city_outlined),
        //                     Padding(padding: EdgeInsets.only(right: 10)),
        //                     Text("alamat")
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 13,
        //                 ),
        //                 Row(
        //                   children: [
        //                     Icon(Icons.date_range_outlined),
        //                     Padding(padding: EdgeInsets.only(right: 10)),
        //                     Text(""),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 13,
        //                 ),
        //                 Row(
        //                   children: [
        //                     Text("Deskripsi : "),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 5,
        //                 ),
        //                 Text(
        //                   "",
        //                   maxLines: 10,
        //                   overflow: TextOverflow.ellipsis,
        //                   style: TextStyle(),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Column(
        //           children: [
        //             Text(
        //               "Status :",
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w500),
        //             ),
        //             SizedBox(
        //               height: 10,
        //             ),
        //             Container(
        //               padding: EdgeInsets.symmetric(
        //                 vertical: 8,
        //                 horizontal: 157,
        //               ),
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 250, 202, 21),
        //                   width: 2,
        //                 ),
        //               ),
        //               child: Text(
        //                 "kondisi",
        //                 style: TextStyle(
        //                     color: Color.fromARGB(255, 55, 65, 81),
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.w700),
        //               ),
        //             )
        //           ],
        //         ))
        //   ],
        // ),

        );
  }

  Widget isDetailNull() {
    return Obx(() => !controller.isDone.value
        ? Align(
            alignment: Alignment.center,
            child: Text(
              controller.loadingTxt.value,
              style: StyleTxt.m(size: 18),
            ),
          )
        : controller.dataElement.value == null
            ? Align(
                alignment: Alignment.center,
                child: Text("Data Laporan Kosong"),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical1),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Laporan : ${controller.dataElement.value![index].kategoriLaporan.toString()} - ${controller.dataElement.value![index].urgensi.toString()}",
                              // artikelElement![index].judulBerita.toString(),
                              // maxLines: 3,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontFamily: "inter-semibold",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: black3,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 250,
                              // width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "${baseUrl}storage/gambar_pelaporans/${controller.dataElement.value![index].imageUrl}.jpg",
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                width: 500,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white, width: 0)),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: paddingVertical4,
                                            width: 2,
                                            color: Colors.redAccent,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10)),
                                          Expanded(
                                            child: Text(
                                              controller.dataElement
                                                  .value![index].alamat
                                                  .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(height: 1.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: paddingVertical4,
                                            width: 2,
                                            color: Colors.redAccent,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10)),
                                          Text(
                                            controller.dataElement.value![index]
                                                .tanggal
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              height: 1.8,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          Text("Deskripsi : "),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        controller
                                            .dataElement.value![index].deskripsi
                                            .toString(),
                                        style: TextStyle(
                                          height: 1.5,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: paddingVertical1)),
                                  Text(
                                    "Status :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: paddingVertical1,
                                      horizontal: paddingHorozontal5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: _getBorderColor(controller
                                            .dataElement
                                            .value![index]
                                            .statusRiwayat),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      controller.dataElement.value![index]
                                          .statusRiwayat
                                          .toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 55, 65, 81),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]));
                },
              ));
  }
}

Color _getBorderColor(String status) {
  switch (status) {
    case 'Menunggu':
      return Colors.yellow;
    case 'Ditangani':
      return Colors.blue;
    case 'Selesai':
      return Colors.green;
    case 'Ditolak':
      return Colors.red;
    case 'Emergency':
      return Colors.black26;
    default:
      return Colors.transparent; // Default color if status is not recognized
  }
}
