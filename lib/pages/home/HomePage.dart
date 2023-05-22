import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/laporans/MapsLokasiKejadian.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:edamkar_1/style/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../profiles/Profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';
  var url_photo = '';
  var namalengkap = '';

  //admin contact
  final String message =
      "setelah melakukan panggilan tolong kembali ke aplikasi";
  final String countryCode = "+62";
  final String phone = "81252277680";
  final String phoneNumber = "085708574368";

  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(phoneUrl);
  }

  void emerCallWA() async {
    var whatsappUrl =
        "whatsapp://send?phone=${countryCode + phone}&text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrlString(whatsappUrl)) {
      await launchUrlString(whatsappUrl);
    } else {
      FloatNotif().snackBarFail(
          context, "Gagal", "Tunggu beberapa saat lalu coba lagi");
    }
  }

  void getUserData() {
    var data = DataUser().getUsername();
    var image = DataUser().getGambar();
    var nama = DataUser().getNama();
    data.then((value) => setState(() => userName = value));
    image.then((value) => setState(() => url_photo = value));
    nama.then((value) => setState(() => namalengkap = value));
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  CircleAvatar image(String url) {
    if (url != "" || url.isNotEmpty) {
      return CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              '${baseUrl}storage/foto_user/${url_photo.replaceAll("'", "")}'));
    }
    return const CircleAvatar(
        radius: 30, backgroundImage: AssetImage("semuaAset/gambar/user1.png"));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final style = styleNColor();
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Konfirmasi keluar !"),
                content: Text("Apakah anda yakin untuk Keluar ?"),
                actions: <Widget>[
                  FloatingActionButton(
                      child: Text("Tidak"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  FloatingActionButton(
                      child: Text("Ya"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      })
                ],
              );
            });
      },
      child: Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
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
                        Text(
                          '$namalengkap',
                          style: medium,
                        )
                      ],
                    ),
                    GestureDetector(
                        child: image(url_photo),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
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
                    horizontal: paddingHorozontal1, vertical: paddingVertical1),
                child: ElevatedButton(
                    onPressed: emercall,
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
                        onPressed: emerCallWA,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: paddingHorozontal1),
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
                                      builder: (context) => MapsLokasiKejadian(
                                          kategori: "penyelamatan")),
                                );
                              },
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                              style: style.sb(16))),
                                    ),
                                    Expanded(
                                        child: Text(
                                            "Salah satu layanan dari E-Damkar"))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapsLokasiKejadian(
                                          kategori: "penyelamatan")),
                                );
                              },
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                        child: Text(
                                            "Salah satu layanan dari E-Damkar"))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapsLokasiKejadian(
                                          kategori: "penyelamatan")),
                                );
                              },
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                              style: style.sb(16))),
                                    ),
                                    Expanded(
                                        child: Text(
                                            "Salah satu layanan dari E-Damkar"))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapsLokasiKejadian(
                                          kategori: "penyelamatan")),
                                );
                              },
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                        child: Text(
                                            "Salah satu layanan dari E-Damkar"))
                                  ],
                                ),
                              ),
                            ),
                          ]))),
            ]),
      ),
    );
  }
}
