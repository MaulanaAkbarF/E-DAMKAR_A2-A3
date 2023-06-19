import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/src/home/model/home_model.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var urlPhoto = ''.obs;
  var namalengkap = ''.obs;
  var data = HomeModel().obs;

//admin contact
  final String message =
      "setelah melakukan panggilan tolong kembali ke aplikasi";
  final String countryCode = "+62";
  final String phone = "81252277680";
  final String phoneNumber = "085708574368";

  @override
  void onInit() {
    super.onInit();
    getUserData();
    getArtikel();
  }

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
      // FloatNotif()
      //     .snackBarFail(context, "Gagal", "Tunggu beberapa saat lalu coba lagi");
    }
  }

  void getUserData() {
    var data = DataUser().getUsername();
    var image = DataUser().getGambar();
    var nama = DataUser().getNama();
    data.then((value) => userName.value = value);
    image.then((value) => urlPhoto.value = value);
    nama.then((value) => namalengkap.value = value);
  }

  CircleAvatar image() {
    if (urlPhoto.isNotEmpty) {
      return CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              '${baseUrl}storage/foto_user/${urlPhoto.replaceAll("'", "")}'));
    }
    return const CircleAvatar(
        radius: 30, backgroundImage: AssetImage("semuaAset/gambar/user1.png"));
  }

  void getArtikel() async {
    var result = await APIClient().getData("getBeritaHome");
    if (result != null || result != "") {
      data.value = homeModelFromJson(result);
      print(data.value);
    }
  }

  goToProfile() => Get.toNamed(Routes.profile);
}
