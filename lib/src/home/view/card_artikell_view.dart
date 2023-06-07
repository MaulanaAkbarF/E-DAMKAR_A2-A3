import 'package:edamkar_1/src/home/controller/card_artikel_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardArtikelView extends GetView<CardArtikelController> {
  const CardArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.data.value.data!.isEmpty
        ? const Text("Artikel Kosong")
        : Obx(() => ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.data.value.data![index].jenisArtikel
                            .toString(),
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
                        controller.data.value.data![index].judul.toString(),
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
                        controller.data.value.data![index].adminDamkar
                            .toString(),
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
                        controller.data.value.data![index].tanggal.toString(),
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
                        image: DecorationImage(
                            image: AssetImage("semuaAset/gambar/damkar.png"))),
                  ),
                );
              },
            ));
  }
}
