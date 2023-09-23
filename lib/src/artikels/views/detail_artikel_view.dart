import 'package:edamkar_1/src/artikels/controller/detail_artikel_controller.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:get/get.dart';

class DetailArtikelView extends GetView<DetailArtikelController> {
  const DetailArtikelView({super.key});

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
          "Detail Artikel",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_bold.ttf",
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
        child: isDetailNull(),
      ),
    );
  }

  Widget isDetailNull() {
    return Obx(() => !controller.isDone.value
        ? const Center(child: Text("loading"))
        : controller.data == null
            ? const Align(
                alignment: Alignment.center,
                child: Text("Data Artikel Kosong "),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: paddingVertical1),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Divider(
                          height: 5,
                          color: Colors.black26,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Artikel",
                              style: TextStyle(
                                fontFamily: "$thin1",
                                color: black2,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: black2,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.data![index].jenisArtikel.toString(),
                              style: TextStyle(
                                fontFamily: "$thin1",
                                color: black2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.data![index].judul.toString(),
                          // artikelElement![index].judulBerita.toString(),
                          // maxLines: 3,
                          style: const TextStyle(
                            fontFamily: "inter-semibold",
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: black3,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.data![index].adminDamkar.toString(),
                              // artikelElement![index].adminDamkar.toString(),
                              style: TextStyle(
                                fontFamily: "$thin1",
                                color: black2,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 5,
                              weight: 3,
                              color: black2,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.data![index].tanggal.toString(),
                              // artikelElement![index].tanggalBerita.toString(),
                              style: TextStyle(
                                fontFamily: "$thin1",
                                color: black2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          // width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: controller.imgArtikel(
                                  controller.data![index].foto,
                                  controller.data![index].jenisArtikel)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            controller.data![index].deskripsi.toString(),
                            // artikelElement![index].deskripsiBerita.toString(),
                            style: TextStyle(
                              fontFamily: "$bold",
                              color: Colors.black,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}
