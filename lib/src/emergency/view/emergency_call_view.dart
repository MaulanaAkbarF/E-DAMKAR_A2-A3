import 'dart:io';

import 'package:edamkar_1/src/emergency/controller/emergency_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Map<String, String> emeLab = {'label1': 'Panggilan Darurat'};

class EmergencyCall extends GetView<EmergencyController> {
  EmergencyCall({super.key});
  // final emerController = Get.put(EmergencyController());

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
                      horizontal: paddingHorozontal1,
                      vertical: paddingVertical2),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text('Tidak'),
                  ),
                ),
                GestureDetector(
                  onTap: () => exit(0),
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
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: paddingHorozontal1,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Panggilan Darurat',
                    style: TextStyle(
                        fontFamily: "font/inter_black.ttf",
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingVertical2),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Panggilan Darurat ini digunakan untuk keadaan mendesak saja. Kemudian sertakan foto dari tempat kejadian!',
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: "font/inter_regular.ttf",
                          color: Colors.black54,
                          fontSize: 14,
                          height: 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingVertical3),
                  child: ElevatedButton(
                      onPressed: () => controller.emercall(),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: red1,
                          elevation: 0),
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: paddingVertical3),
                          child: Column(
                            children: [
                              SvgPicture.asset('semuaAset/icon/EmeCall.svg'),
                              SizedBox(height: paddingHorozontal1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Panggilan Darurat',
                                    style: TextStyle(
                                        fontFamily: "font/inter_regular.ttf",
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SvgPicture.asset(
                                      'semuaAset/icon/ArrowRight2.svg')
                                ],
                              ),
                            ],
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingVertical2),
                  child: ElevatedButton(
                      onPressed: () => controller.emerCallWA(),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: green1,
                          elevation: 0),
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: paddingVertical3),
                          child: Column(
                            children: [
                              SvgPicture.asset('semuaAset/icon/WA.svg'),
                              SizedBox(height: paddingHorozontal1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Whatsapp',
                                    style: TextStyle(
                                        fontFamily: "font/inter_regular.ttf",
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SvgPicture.asset(
                                      'semuaAset/icon/ArrowRight2.svg')
                                ],
                              ),
                            ],
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: paddingVertical3, bottom: paddingVertical2),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Masuk untuk dapat mengakses semua layanan dari E-Damkar',
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: "font/inter_regular.ttf",
                          color: Colors.black54,
                          fontSize: 14,
                          height: 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => controller.goLogin(),
                    style: ElevatedButton.styleFrom(
                        primary: white,
                        onPrimary: red1,
                        padding:
                            EdgeInsets.symmetric(vertical: paddingVertical2),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2, color: red1),
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                          fontFamily: "font/inter_regular.ttf",
                          color: red1,
                          fontSize: (18),
                          height: 1.4,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          )),
        ));
  }
}
