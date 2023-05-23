import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/emergency/mapsAnonym.dart';
import 'package:edamkar_1/pages/laporans/MapsLokasiKejadian.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher_string.dart';

class EmergencyCall extends StatefulWidget {
  const EmergencyCall({super.key});

  @override
  State<EmergencyCall> createState() => _EmergencyCallState();
}

class _EmergencyCallState extends State<EmergencyCall> {
  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapsAnonym(kategori: "anonym")),
      );
    } else {
      FloatNotif().snackBarFail(
          context, "Gagal", "Tunggu beberapa saat dan coba lagi!");
    }
  }

  final String countryCode = "+62";
  //admin contact
  final String message =
      "setelah melakukan panggilan tolong kembali ke aplikasi";
  final String phone = "81252277680";
  final String phoneNumber = "085708574368";

  void emerCallWA() async {
    var whatsappUrl =
        "whatsapp://send?phone=${countryCode + phone}&text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrlString(whatsappUrl)) {
      await launchUrlString(whatsappUrl);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapsAnonym(kategori: "anonym")),
      );
    } else {
      FloatNotif().snackBarFail(
          context, "Gagal", "Tunggu beberapa saat lalu coba lagi");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                    fontSize: (24),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 2),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Panggilan Darurat ini digunakan untuk panggilan mendesak saja. Kemudian sertakan foto dari tempat kejadian!',
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: "font/inter_regular.ttf",
                      color: Colors.black54,
                      fontSize: (17),
                      height: 1.4,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                  onPressed: emercall,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Color.fromARGB(255, 224, 36, 36),
                      elevation: 0),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical3),
                      child: Column(
                        children: [
                          SvgPicture.asset('semuaAset/icon/EmeCall.svg'),
                          SizedBox(height: paddingHorozontal1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Panggilan Darurat',
                                style: TextStyle(
                                    fontFamily: "font/inter_regular.ttf",
                                    color: Colors.white,
                                    fontSize: (18),
                                    height: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                              SvgPicture.asset('semuaAset/icon/ArrowRight2.svg')
                            ],
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: ElevatedButton(
                  onPressed: () {
                    emerCallWA();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Color.fromARGB(255, 37, 211, 102),
                      elevation: 0),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical3),
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
                                    fontSize: (18),
                                    height: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                              SvgPicture.asset('semuaAset/icon/ArrowRight2.svg')
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
                      fontSize: (17),
                      height: 1.4,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                    primary: white,
                    onPrimary: red1,
                    padding: EdgeInsets.symmetric(vertical: paddingVertical2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: red1),
                        borderRadius: BorderRadius.circular(80))),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                      fontFamily: "font/inter_regular.ttf",
                      color: Color.fromARGB(255, 224, 36, 36),
                      fontSize: (18),
                      height: 1.4,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
      )),
    );
  }
}
