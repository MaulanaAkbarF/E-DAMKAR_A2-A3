import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/models/ProfilModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:edamkar_1/style/app_style.dart';
import 'Profil.dart';

class EditProfilePage extends StatefulWidget {
  final int userId;
  EditProfilePage(this.userId);
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

  final _formKey = GlobalKey<FormState>();
  final nama = TextEditingController();
  final noHp = TextEditingController();
  String _message = '';

  @override
  void dispose() {
    nama.dispose();
    noHp.dispose();
    super.dispose();
  }

  toss(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Berhasil',
        message: 'Anda Berhasil Merubah Profil',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
    );
  }

  gagal(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Gagal',
        message: 'Anda Gagal Merubah Profil',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          "Ubah Profil",
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
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
                            controller: nama,
                            //readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'nama lengkap tidak boleh kosong';
                              } else if (value.length > 50) {
                                return 'nama lengkap terlalu panjang';
                              }
                            },

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
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingHorozontal2,
                    ),
                    child: Align(
                      alignment: FractionalOffset.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Nomor HP"),
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
                            controller: noHp,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'nomor hp tidak boleh kosong';
                              } else if (value.length > 13) {
                                return 'nomor hp terlalu panjang';
                              } else if (value.length < 10) {
                                return 'nomor hp terlalu pendek';
                              }
                            },
                            //readOnly: true,

                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: 'Nomor Hp',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: paddingHorozontal4),
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
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                UpdateProfil.ubahProfil(
                                        widget.userId.toString(),
                                        nama.text,
                                        noHp.text)
                                    .then((value) => {
                                          if (value.kode.toString() == "200")
                                            {toss(context)}
                                        });
                              } else {
                                gagal(context);
                              }
                            },
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
      ),
    );
  }

  showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
