import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:edamkar_1/style/app_style.dart';
import '../SharedPreferences/dataUser.dart';
import 'Profil.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var Name = 'user1';

  void getUserData() async {
    var data = DataUser().getNama();

    data.then((value) {
      setState(() {
        Name = value.toString();
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
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      MaterialPageRoute(builder: (context) => Profile()));
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
              "Ubah Profil",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "font/inter_bold.ttf"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: paddingVertical4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("semuaAset/gambar/user1.png"),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -7,
                        right: -7,
                        child: Transform.scale(
                          scale: 0.65,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                shape: BoxShape.circle),
                            child: IconButton(
                                icon: Icon(Icons.edit), onPressed: () {}),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal2,
                  ),
                  child: Align(
                    alignment: FractionalOffset.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Nama"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal2,
                  ),
                  child: Align(
                    alignment: FractionalOffset.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.2)),
                        child: TextFormField(
                          //controller: email

                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: '$Name',
                              prefixIcon: Icon(Icons.person),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 13, 10, 7),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHorozontal4),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Material(
                        color: Colors.red.shade400,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          splashColor: Colors.red.shade700,
                          highlightColor: Colors.red.shade900,
                          onTap: () {},
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Simpan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
