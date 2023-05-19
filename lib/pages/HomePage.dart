import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/pages/profil.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../APIRequest/APIClient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';
  var url_photo;
  var email;
  final String phoneNumber = "085708574368";

  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(phoneUrl);
  }

  void getUserData() async {
    var data = DataUser().getNama();
    var dataPoto = DataUser().getGambar();
    var dataEmail = DataUser().getEmail();
    data.then((value) {
      setState(() {
        userName = value.toString();
      });
    });
    dataPoto.then((value) {
      setState(() {
        url_photo = value.toString();
      });
    });
    dataEmail.then((value) {
      setState(() {
        email = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // getUserData();
  }

  CircleAvatar image(String? url) {
    if (url != null) {
      return CircleAvatar(
        minRadius: 30,
        backgroundImage: NetworkImage(url.toString()),

        // image: ,
        // fit: BoxFit.cover,
      );
    }
    return const CircleAvatar(
      minRadius: 30,
      backgroundImage: AssetImage("semuaAset/gambar/user1.png"),
    );
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
                      child: image(
                          "${APIClient.gambar}storage/public/foto_user/${url_photo}"),
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
                  onPressed: emercall,
                  style: ElevatedButton.styleFrom(
                      primary: red1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: paddingVertical2),
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
      bottomNavigationBar: AppMenu(),
    );
  }
}
