import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher_string.dart';

class EmergencyCall extends StatelessWidget {
  const EmergencyCall({super.key});

  final String phoneNumber = "085708574368";
  
  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(phoneUrl);
  }

  // String platformCheck() {
  //   if (Platform.isIOS) {
  //       return "whatsapp://wa.me/$phoneNumber}";
  //     } else {
  //       return "whatsapp://send?phone=$phoneNumber}";
  //     }
  // }

  void emerCallWA() async {
    String url = 'whatsapp://wa.me/$phoneNumber';
    // await canLaunchUrlString(url)
    //     ? launchUrlString(url)
    //     : debugPrint("terdapat kesalahan");
    // 
    launchUrlString(url);
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
                style: bold,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 2),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Panggilan Darurat ini digunakan untuk panggilan mendesak saja. Kemudian sertakan foto dari tempat kejadian!',
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  style: reguler,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorozontal1, vertical: paddingVertical2),
              child: ElevatedButton(
                  onPressed: emercall,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 224, 36, 36),
                  ),
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
                                style: medium,
                              ),
                              SvgPicture.asset(
                                  'semuaAset/icon/ArrowRight2.svg')
                            ],
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
              child: ElevatedButton(
                  onPressed: emerCallWA,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 37, 211, 102),
                  ),
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
                                style: medium
                              ),
                              SizedBox(width: 5,),
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
                  'Masuk untuk dapat melihat semua fitur yang ada di E-Damkar !',
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  style: reguler,
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
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: red1),
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  'Masuk',
                  style: medium,
                ))
          ],
        ),
      )),
    );
  }
}
