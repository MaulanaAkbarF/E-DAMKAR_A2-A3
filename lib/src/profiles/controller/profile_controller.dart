import 'package:edamkar_1/config/APIClient.dart';
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
              '${baseUrl}storage/foto_user/${url_photo.replaceAll("'", "")}'));
    }
    return const CircleAvatar(
        radius: 30, backgroundImage: AssetImage("semuaAset/gambar/user1.png"));
  }

  goPop() => Get.back();
}
