import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = 'Akeon';

  void getUserData() async {
    var data = DataUser().getNama();
    data.then((value) {
      setState(() {
        userName = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorozontal1, vertical: paddingVertical1),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: paddingVertical2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang $userName',
                        style: semibold,
                      ),
                      const Text(
                        'Lorem Ipsum Dolor set amet',
                        style: medium,
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    // backgroundImage: AssetImage('semuaAset/gambar/chefCat.jpg'),
                  )
                ],
              ),
            ),
            ColoredBox(
              color: grey2,
              child: SizedBox(
                height: paddingVertical1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: paddingVertical2,
              ),
              child: const Text('Panggilan Darurat',
                  textAlign: TextAlign.center, style: bold),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: paddingVertical1,
              ),
              child: const Text(
                  'Panggilan darurat ini digunakan untuk panggilan mendesak saja. Kemudian sertakan foto dari tempat kejadian !',
                  textAlign: TextAlign.justify,
                  style: medium),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorozontal1, vertical: paddingVertical1),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: red1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical2),
                      child: Column(
                        children: [
                          SvgPicture.asset('semuaAset/gambar/EmeCall.svg'),
                          // SizedBox(height: paddingHorozontal1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical2),
                      child: Column(
                        children: [
                          SvgPicture.asset('semuaAset/gambar/WA.svg'),
                          // SizedBox(height: paddingHorozontal1),
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
              padding: EdgeInsets.symmetric(
                vertical: paddingVertical2,
              ),
              child: const Text('Laporkan kendala anda',
                  textAlign: TextAlign.start, style: semibold),
            ),
          ],
        ),
      )),
    );
  }
}
