import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/pages/laporans/MapsLokasiKejadian.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:edamkar_1/style/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../profiles/Profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';
  var url_photo;
  final String phoneNumber = "085708574368";

  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(phoneUrl);
  }

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
  

  Image image(String? url) {
    if (url != null) {
      return Image(image: NetworkImage(url.toString()));
    }
    return const Image(image: AssetImage("semuaAset/gambar/user1.png"));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final style = styleNColor();
    return Scaffold(
      body:
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical2, horizontal: paddingHorozontal1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang $userName',
                    maxLines: 1,
                    style: semibold,
                  ),
                  const Text(
                    'Lorem Ipsum Dolor set amet',
                    style: medium,
                  )
                ],
              ),
              GestureDetector(
                  child: CircleAvatar(
                    radius: 30,
                    child: image(url_photo),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  }),
              //
            ],
          ),
        ),
        ColoredBox(
          color: grey2,
          child: SizedBox(
            height: 2,
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical2,
            horizontal: paddingHorozontal1,
          ),
          child: const Text('Panggilan Darurat',
              textAlign: TextAlign.center, style: bold),
        )),
        Expanded(
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
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorozontal1, vertical: paddingVertical1),
          child: ElevatedButton(
              onPressed: emercall,
              style: ElevatedButton.styleFrom(
                  primary: red1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical3),
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
                          SvgPicture.asset('semuaAset/icon/ArrowRight2.svg')
                        ],
                      ),
                    ],
                  ))),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: green1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical3),
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
                          SvgPicture.asset('semuaAset/icon/ArrowRight2.svg')
                        ],
                      ),
                    ],
                  ))),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical3, horizontal: paddingHorozontal1),
          child: const Text('Laporkan kendala anda',
              textAlign: TextAlign.start, style: semibold),
        )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
            child: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MapsLokasiKejadian(kategori: "penyelamatan")),
                      );
                    },
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1.5, color: grey3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: orange2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
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
                                    style: style.sb(16))),
                          ),
                          Expanded(
                              child: Text("Salah satu layanan dari E-Damkar"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MapsLokasiKejadian(kategori: "penyelamatan")),
                      );
                    },
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1.5, color: grey3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: orange2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
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
                                    style: style.sb(16))),
                          ),
                          Expanded(
                              child: Text("Salah satu layanan dari E-Damkar"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MapsLokasiKejadian(kategori: "penyelamatan")),
                      );
                    },
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1.5, color: grey3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: orange2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
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
                                    style: style.sb(16))),
                          ),
                          Expanded(
                              child: Text("Salah satu layanan dari E-Damkar"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MapsLokasiKejadian(kategori: "penyelamatan")),
                      );
                    },
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1.5, color: grey3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: orange2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
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
                                    style: style.sb(16))),
                          ),
                          Expanded(
                              child: Text("Salah satu layanan dari E-Damkar"))
                        ],
                      ),
                    ),
                  ),
                ])),
      ]),
    );
  }
}
