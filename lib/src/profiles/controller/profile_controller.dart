import 'package:edamkar_1/config/url_static.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'user1'.obs;
  // var noTelp = '08..'.obs;
  var url_photo = "".obs;
  var noHp = "0800000000001".obs;
  var id = 0.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  // var _iduser;
  void getUserData() async {
    DataUser().getNama().then((value) => userName.value = value);
    DataUser().getNoHp().then((value) => noHp.value = value);
    DataUser().getGambar().then((value) => url_photo.value = value);
    DataUser().getUserId().then((value) => id.value = value);
  }

  CircleAvatar image() {
    if (url_photo != "" || url_photo.isNotEmpty) {
      return CircleAvatar(
          radius: 30,
          backgroundImage:
              NetworkImage('${URLWEBAPI.urlHost}/img-user/$url_photo.jpg'));
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
          onPressed: () {
            Get.offAllNamed(Routes.login);
            DataUser().deleteUser();
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

  goPop() => Get.back();

  goTOUpdateProfil() => Get.toNamed(Routes.ubProf);
  goToResetPass() => Get.toNamed(Routes.ubPsProf);
  goToTentangKami() => Get.toNamed(Routes.aboutUs);
}
