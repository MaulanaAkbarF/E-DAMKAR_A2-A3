import 'package:edamkar_1/config/url_static.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'user1';
  var noTelp = '08..';
  var url_photo = "";
  var noHp = "0800000000001";

  // var _iduser;
  void getUserData() async {
    // var idData = DataUser().getUserId();
    var data = DataUser().getNama();
    var data1 = DataUser().getNoHp();
    var gambar = DataUser().getGambar();
    var noHpV = DataUser().getNoHp();

    // idData.then((value) {
    //   setState(() {
    //     _iduser = value;
    //   });
    // });

    gambar.then((value) {
      url_photo = value;
    });

    data.then((value) {
      userName = value.toString();
    });

    data1.then((value) {
      noTelp = value.toString();
    });

    noHpV.then((value) {
      noHp = value.toString();
    });
  }

  CircleAvatar image() {
    if (url_photo != "" || url_photo.isNotEmpty) {
      return CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              '${URLWEBAPI.urlHost}storage/foto_user/${url_photo.replaceAll("'", "")}'));
    }
    return const CircleAvatar(
        radius: 30, backgroundImage: AssetImage("semuaAset/gambar/user1.png"));
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
          onPressed: () => Get.offAllNamed(Routes.login),
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

  goPop() => Get.back();
}
