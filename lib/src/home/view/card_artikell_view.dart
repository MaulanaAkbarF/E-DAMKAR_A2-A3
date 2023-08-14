import 'package:edamkar_1/config/url_static.dart';
import 'package:edamkar_1/src/home/controller/home_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardArtikelView extends GetView<HomeController> {
  const CardArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.only(
              left: paddingHorozontal1, right: paddingHorozontal1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: const DecorationImage(
                        image: AssetImage("semuaAset/gambar/damkar.png"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingVertical1, horizontal: paddingHorozontal1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Disdamkar • 23 mei 2023",
                      style: StyleTxt.m(color: grey4),
                    ),
                    Text(
                      "Berita",
                      style: StyleTxt.m(color: grey4),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: paddingVertical1,
                      horizontal: paddingHorozontal1),
                  child: Text(
                    "Kebakaran Pabrik dan Gudang di Kawasan Perumahan Locaret",
                    style: StyleTxt.sb(size: 18),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        controller.data.value.data == null
            ? const Text("Artikel Kosong")
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.data.value.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
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
                            controller.data.value.data![index].tanggal
                                .toString(),
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
                                image:
                                     NetworkImage(
                                        "${URLWEBAPI.urlHost}/img-berita/${controller.data.value.data![index].foto}",
                                      ),)),
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
