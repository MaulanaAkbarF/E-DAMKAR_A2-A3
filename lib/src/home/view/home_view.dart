import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/home/controller/home_controller.dart';
import 'package:edamkar_1/src/home/view/card_artikell_view.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Notice"),
            content: const Text(
                "apakah anda sudah yakin untuk keluar dari aplikasi"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal1, vertical: paddingVertical2),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text('Tidak'),
                ),
              ),
              GestureDetector(
                onTap: () => Get.offAllNamed(Routes.emergency),
                child: const Text('Ya'),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: paddingVertical2,
                      horizontal: paddingHorozontal1),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat datang ${controller.userName.value}',
                                maxLines: 1,
                                style: semibold,
                              ),
                              Text(
                                controller.namalengkap.value,
                                style: medium,
                              )
                            ],
                          ),
                          GestureDetector(
                              child: controller.image(),
                              onTap: () => controller.goToProfile()),
                          //
                        ],
                      )),
                ),
                ColoredBox(
                  color: grey2,
                  child: const SizedBox(
                    height: 2,
                  ),
                ),
                Align(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: paddingVertical2,
                    horizontal: paddingHorozontal1,
                  ),
                  child: const Text('Panggilan Darurat',
                      textAlign: TextAlign.center, style: bold),
                )),
                Align(
                    child: Padding(
                  padding: EdgeInsets.only(
                      bottom: paddingVertical1,
                      right: paddingHorozontal1,
                      left: paddingHorozontal1),
                  child: const Text(
                      'Panggilan darurat ini digunakan untuk panggilan mendesak saja. Kemudian sertakan foto dari tempat kejadian !',
                      textAlign: TextAlign.justify,
                      style: medium),
                )),
                Align(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingHorozontal1,
                      vertical: paddingVertical1),
                  child: ElevatedButton(
                      onPressed: () {
                        controller.emercall();
                        // Navigator.pushNamed(context, '/laporan');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: red1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: paddingVertical3),
                          child: Column(
                            children: [
                              SvgPicture.asset('semuaAset/icon/EmeCall.svg'),
                              // SizedBox(height: paddingHorozontal1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Panggilan Darurat',
                                    style: medium,
                                  ),
                                  SvgPicture.asset(
                                      'semuaAset/icon/ArrowRight2.svg')
                                ],
                              ),
                            ],
                          ))),
                )),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: paddingHorozontal1),
                      child: ElevatedButton(
                          onPressed: controller.emerCallWA,
                          style: ElevatedButton.styleFrom(
                              primary: green1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: paddingVertical3),
                              child: Column(
                                children: [
                                  SvgPicture.asset('semuaAset/icon/WA.svg'),
                                  // SizedBox(height: paddingHorozontal1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Whatsapp',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      SvgPicture.asset(
                                          'semuaAset/icon/ArrowRight2.svg')
                                    ],
                                  ),
                                ],
                              ))),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: paddingVertical3,
                          horizontal: paddingHorozontal1),
                      child: const Text('Laporkan kendala anda',
                          textAlign: TextAlign.start, style: semibold),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingHorozontal1),
                        child: GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            children: <Widget>[
                              InkWell(
                                onTap: () => Get.toNamed(Routes.mpLap,
                                    arguments: "bencanaalam"),
                                child: Container(
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: white,
                                      border:
                                          Border.all(width: 1.5, color: grey3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: orange2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: SvgPicture.asset(
                                            "semuaAset/gambar/bencana-alam-icon.svg",
                                            width: 70,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Text("Laporan Bencana Alam",
                                                style: StyleTxt.sb(size: 16))),
                                      ),
                                      Expanded(
                                          child: Text(
                                              "Salah satu layanan dari E-Damkar"))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.mpLap,
                                    arguments: "kebakaran"),
                                child: Container(
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: white,
                                      border:
                                          Border.all(width: 1.5, color: grey3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: orange2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: SvgPicture.asset(
                                            "semuaAset/gambar/kebakaran-icon.svg",
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Text("Laporan Kebakaran",
                                                style: StyleTxt.sb(size: 16))),
                                      ),
                                      const Text(
                                          "Salah satu layanan dari E-Damkar")
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.mpLap,
                                    arguments: "hewanbuas"),
                                child: Container(
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: white,
                                      border:
                                          Border.all(width: 1.5, color: grey3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: orange2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: SvgPicture.asset(
                                            "semuaAset/gambar/hewan-buas-icon.svg",
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Text("Laporan Hewan Buas",
                                                style: StyleTxt.sb(size: 16))),
                                      ),
                                      Expanded(
                                          child: Text(
                                              "Salah satu layanan dari E-Damkar"))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.mpLap,
                                    arguments: "penyelamatan"),
                                child: Container(
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: white,
                                      border:
                                          Border.all(width: 1.5, color: grey3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: orange2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: SvgPicture.asset(
                                            "semuaAset/gambar/penyelamatan-icon.svg",
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Text("Laporan Penyelamatan",
                                                style: StyleTxt.sb(size: 16))),
                                      ),
                                      Expanded(
                                          child: Text(
                                              "Salah satu layanan dari E-Damkar"))
                                    ],
                                  ),
                                ),
                              ),
                            ]))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: paddingVertical3,
                          horizontal: paddingHorozontal1),
                      child: const Text('Artikel Terkini',
                          textAlign: TextAlign.start, style: semibold),
                    )),

                const CardArtikelView()
                // Allisign(alignment: Alignment.center, child: listArtikel())
              ]),
        ),
      ),
    );
  }
}
