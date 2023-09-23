import 'package:carousel_slider/carousel_slider.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/artikels/controller/artikel_controller.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:get/get.dart';

class ArtikelView extends GetView<ArtikleController> {
  ArtikelView({super.key});

  final List<Map> teksLaporan = [
    {
      'Header': 'Artikel',
    }
  ].cast<Map<String, String>>();

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

  final List<Color> clr = [
    Colors.green,
    Colors.blueAccent,
    Colors.amber,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
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
            Align(
              alignment: FractionalOffset.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingVertical1, horizontal: paddingHorozontal1),
                child: const Text(
                  "Artikel",
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
              height: 5,
            ),

            TabBar(
                isScrollable: true,
                unselectedLabelColor: const Color.fromARGB(255, 165, 165, 165),
                indicatorColor: orange1,
                labelColor: black,
                controller: controller.tabController,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: paddingHorozontal1),
                tabs: const [
                  Tab(
                    text: "Semua",
                  ),
                  Tab(
                    text: "Berita",
                  ),
                  Tab(
                    text: "Edukasi",
                  ),
                  Tab(
                    text: "Agenda",
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: SizeConfig.screenWidth,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 10,
            ),
            Expanded(
                child:
                    TabBarView(controller: controller.tabController, children: [
              ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Obx(() => CarouselSlider(
                        options: CarouselOptions(
                          height: 180,
                          autoPlay: true,
                        ),
                        items: controller.dataHigh.map(
                          (i) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(Routes.artikleDt,
                                  arguments: {
                                    "idArtikel": i.id,
                                    "jenisArtikel": i.jenisArtikel.toString()
                                  }),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    image: controller.imgArtikel(
                                        i.foto, i.jenisArtikel),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: paddingHorozontal1,
                                      vertical: paddingVertical1),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          i.judul,
                                          overflow: TextOverflow.ellipsis,
                                          style: StyleTxt.sb(
                                              color: white, size: 14),
                                        ),
                                        Text(
                                          "${i.adminDamkar} | ${i.tanggal} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: StyleTxt.m(
                                              color: white, size: 12),
                                        ),
                                      ]),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  listArtikel(controller.data),
                ],
              ),
              listArtikel(controller.dataBerita),
              listArtikel(controller.dataEdukasi),
              listAgenda(controller.dataAgenda)
            ]))
            // Expanded(child: listArtikel())
          ],
        )),
      ),
    );
  }

  Widget listArtikel(value) {
    return Obx(
      () => value == null
          ? const Text("Artikel Kosong")
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // scrollDirection: Axis.vertical,
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(Routes.artikleDt, arguments: {
                        "idArtikel": value[index].id,
                        "jenisArtikel": value[index].jenisArtikel.toString()
                      });
                    },
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value[index].jenisArtikel.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "$thin1",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          value![index].judul.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: black3,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "$semibold",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          value![index].adminDamkar.toString(),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          value![index].tanggal.toString(),
                        )
                      ],
                    ),
                    trailing: Container(
                      alignment: Alignment.topCenter,
                      height: paddingVertical4,
                      width: paddingHorozontal4,
                      // color: clr[index],
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: controller.imgArtikel(
                              value![index].foto, value![index].jenisArtikel)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black38,
                );
              },
            ),
    );
  }

  Widget listAgenda(value) {
    return Obx(
      () => value == null
          ? const Text("Artikel Kosong")
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // scrollDirection: Axis.vertical,
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value[index].jenisArtikel.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "$thin1",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          value![index].judul.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: black3,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "$semibold",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          value![index].adminDamkar.toString(),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          value![index].tanggal.toString(),
                        )
                      ],
                    ),
                    // trailing: Container(
                    //   alignment: Alignment.topCenter,
                    //   height: paddingVertical4,
                    //   width: paddingHorozontal4,
                    //   // color: clr[index],
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       image: controller.imgArtikel(
                    //           value![index].foto, value![index].jenisArtikel)),
                    // ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black38,
                );
              },
            ),
    );
  }
}



//
