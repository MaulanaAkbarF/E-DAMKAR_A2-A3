import 'package:edamkar_1/models/GetProfil.dart';
import 'package:edamkar_1/pages/HomePage.dart';
import 'package:edamkar_1/pages/UbahSandi.dart';
import 'package:edamkar_1/pages/signin.dart';
import 'package:edamkar_1/pages/TentangKami.dart';
import 'package:edamkar_1/pages/ubahProfil.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:edamkar_1/style/app_style.dart';

import '../APIRequest/APIClient.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  var userName = 'user1';
  var emailnya = 'ahmad@gmail.com';
  var url_photo = "";

  void getUserData() async {
    var data = DataUser().getNama();

    var data1 = DataUser().getEmail();

    var gambar = DataUser().getGambar();

    gambar.then((value) {
      setState(() {
        url_photo = value.toString();
      });
    });

    data.then((value) {
      setState(() {
        userName = value.toString();
      });
    });

    data1.then((value) {
      setState(() {
        emailnya = value.toString();
      });
    });
  }

  CircleAvatar image(String? url) {
    if (url != null || url != "") {
      return CircleAvatar(
        // minRadius: 30,
        backgroundImage: NetworkImage(url.toString()),

        // image: ,
        // fit: BoxFit.cover,
      );
    }
    return const CircleAvatar(
      // minRadius: 30,
      backgroundImage: AssetImage("semuaAset/gambar/user1.png"),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
                leading: image(
                    "${APIClient.gambar}storage/public/foto_user/${url_photo}"),
                title: Text("$userName"),
                subtitle: Text("$emailnya"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UbahSandi(1)));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UbahSandi(1)));
                },
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Divider(
            thickness: 5,
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
          //     leading: Icon(Icons.notifications),
          //     title: TextButton(
          //         onPressed: () {},
          //         child: Align(
          //           alignment: Alignment.centerLeft,
          //           child: Text(
          //             "Notifikasi",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TentangKami()));
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
            thickness: 5,
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
                        side: BorderSide(color: Colors.red.shade500, width: 1),
                        borderRadius: BorderRadiusDirectional.circular(100))),
                child: Text(
                  "Keluar",
                  style: TextStyle(color: Colors.red.shade500),
                )),
          )
        ],
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
