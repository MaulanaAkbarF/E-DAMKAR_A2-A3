import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';git c

class EmergencyCall extends StatelessWidget {
  const EmergencyCall({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1, vertical: paddingVertical2),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: red1,
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical3),
                      child: Column(
                        children: [
                          SvgPicture.asset('semuaAset/gambar/EmeCall.svg'),
                          SizedBox(height: paddingHorozontal1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Panggilan Darurat',
                                style: medium,
                              ),
                              SvgPicture.asset(
                                  'semuaAset/gambar/ArrowRight2.svg')
                            ],
                          ),
                        ],
                      ))),
            ),
          
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: green1,
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical3),
                      child: Column(
                        children: [
                          SvgPicture.asset('semuaAset/gambar/WA.svg'),
                          SizedBox(height: paddingHorozontal1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Whatsapp',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: green2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              SvgPicture.asset(
                                  'semuaAset/gambar/ArrowRight.svg')
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
                onPressed: () {},
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
