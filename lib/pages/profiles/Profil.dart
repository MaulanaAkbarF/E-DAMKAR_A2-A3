import 'package:edamkar_1/src/home/HomePage.dart';
import 'package:edamkar_1/pages/profiles/UbahSandi.dart';
import 'package:edamkar_1/pages/profiles/ubahProfil.dart';
import 'package:edamkar_1/src/login/view/login_view.dart';
import 'package:edamkar_1/pages/informations/TentangKami.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/config/APIClient.dart';

import '../../Menu/Menu.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  var userName = 'user1';
  var noTelp = '08..';
  var url_photo = "";
  var _noHp = "0800000000001";
  var _iduser;
  void getUserData() async {
    var idData = DataUser().getUserId();
    var data = DataUser().getNama();
    var data1 = DataUser().getNoHp();
    var gambar = DataUser().getGambar();
    var noHp = DataUser().getNoHp();

    idData.then((value) {
      setState(() {
        _iduser = value;
      });
    });

    gambar.then((value) {
      setState(() {
        url_photo = value;
      });
    });

    data.then((value) {
      setState(() {
        userName = value.toString();
      });
    });

    data1.then((value) {
      setState(() {
        noTelp = value.toString();
      });
    });

    noHp.then((value) {
      setState(() {
        _noHp = value.toString();
      });
    });
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
  void initState() {
    super.initState();
    getUserData();
    print("no Hp :" + _noHp);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    splashColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade600,
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const AppMenu()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Profil",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: "font/inter_bold.ttf"),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                  color: Colors.transparent,
                ),
                child: ListTile(
                  leading: image(url_photo),
                  title: Text("$userName"),
                  subtitle: Text("$_noHp"),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage(1)));
                    },
                    child: Text(
                      "Ubah",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Akun",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: "font/inter_bold.ttf"),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   child: ListTile(
            //     leading: Icon(Icons.person),
            //     title: TextButton(
            //         onPressed: () {},
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             "Profil Saya",
            //             style: TextStyle(
            //                 color: Colors.black87,
            //                 fontWeight: FontWeight.normal,
            //                 fontSize: 16),
            //             textAlign: TextAlign.left,
            //           ),
            //         )),
            //     horizontalTitleGap: 0,
            //     trailing: GestureDetector(
            //       onTap: () {},
            //       child: Icon(Icons.chevron_right),
            //     ),
            //   ),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            Container(
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.lock),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UbahSandi(_iduser.toString())));
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ubah Kata Sandi",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    )),
                horizontalTitleGap: 0,
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UbahSandi(_iduser.toString())));
                  },
                  child: Icon(Icons.chevron_right),
                ),
              ),
            ),
            Divider(
              thickness: 4,
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Pengaturan Aplikasi",
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.w500,
            //         fontFamily: "font/inter_bold.ttf"),
            //   ),
            // ),

            // Container(
            //   width: double.infinity,
            //   child: ListTile(
            //     leading: Icon(Icons.book),
            //     title: TextButton(
            //         onPressed: () {},
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             "Preferensi Baca",
            //             style: TextStyle(
            //                 color: Colors.black87,
            //                 fontWeight: FontWeight.normal,
            //                 fontSize: 16),
            //             textAlign: TextAlign.left,
            //           ),
            //         )),
            //     horizontalTitleGap: 0,
            //     trailing: GestureDetector(
            //       onTap: () {},
            //       child: Icon(Icons.chevron_right),
            //     ),
            //   ),
            // ),
            // Divider(
            //   thickness: 5,
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Bantuan",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: "font/inter_bold.ttf"),
              ),
            ),
            Container(
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.help),
                title: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TentangKami()));
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tentang Kami",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    )),
                horizontalTitleGap: 0,
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TentangKami()));
                  },
                  child: Icon(Icons.chevron_right),
                ),
                //trailing: Icon(Icons.chevron_right),
              ),
            ),
            Divider(
              thickness: 4,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: paddingVertical4, horizontal: paddingHorozontal2),
              child: ElevatedButton(
                  onPressed: () {
                    showLogoutDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.red.shade500, width: 1),
                          borderRadius: BorderRadiusDirectional.circular(100))),
                  child: Text(
                    "Keluar",
                    style: TextStyle(color: Colors.red.shade500),
                  )),
            )
          ],
        ),
      ),
    );
  }

  showLogoutDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Keluar"),
      content: Text("Apakah Kamu Yakin Akan Keluar?"),
      actions: [
        TextButton(
          child: Text("Tidak", style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            "Ya",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
