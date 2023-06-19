import 'dart:math';

import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/src/register/model/register_model.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController namalengkap = TextEditingController();
  final TextEditingController notelp = TextEditingController();
  final TextEditingController validatepass = TextEditingController();
  var isloading = false.obs;
  var passwordVisible = true.obs;
  var passwordVisible1 = true.obs;
  var randomNumber = 100000.obs;

  @override
  void onInit() {
    super.onInit();
    Random();
  }

  bool checkField() {
    if (namalengkap.text.isEmpty) {
      //FloatNotif().snackBarFail(context, "", "Nama Lengkap tidak boleh kosong");
      return false;
    }
    if (namalengkap.text.length < 5) {
      //FloatNotif()
      // .snackBarFail(context, "", "Nama Yang kamu masukkan terlalu pendek");
      return false;
    }
    if (namalengkap.text.length > 30) {
      //FloatNotif()
      // .snackBarFail(context, "", "Nama yang kamu masukkan terlalu pendek");
      return false;
    }
    if (username.text.isEmpty) {
      //FloatNotif().snackBarFail(context, "", "Username tidak boleh kosong");
      return false;
    }
    if (username.text.contains(" ")) {
      //FloatNotif()
      // .snackBarFail(context, "", "Username tidak boleh pakai spasi");
      return false;
    }
    if (username.text.length < 5) {
      //FloatNotif().snackBarFail(context, "", "Username terlalu pendek");
      return false;
    }
    if (username.text.length > 30) {
      //FloatNotif().snackBarFail(context, "", "username terlalu panjang");
      return false;
    }
    if (password.text.isEmpty) {
      //FloatNotif().snackBarFail(context, "", "password tidak boleh kosong");
      return false;
    }
    if (password.text.length < 8) {
      //FloatNotif().snackBarFail(context, "", "password terlalu pendek");
      return false;
    }
    if (password.text.length > 30) {
      //FloatNotif().snackBarFail(context, "", "password terlalu panjang");
      return false;
    }
    if (validatepass.text.isEmpty) {
      //FloatNotif()
      // .snackBarFail(context, "", "Validasi password tidak boleh kosong");
      return false;
    }
    if (validatepass.text != password.text) {
      //FloatNotif().snackBarFail(
      // context, "", "validasi password tidak sesuai dengan password");
      return false;
    }
    if (notelp.text.length < 9) {
      //FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu pendek");
      return false;
    }
    if (notelp.text.length > 13) {
      //FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu panjang");
      return false;
    }
    return true;
  }

  void RegisterPost() async {
    isloading.value = true;
    var result = await APIClient().postData('register', {
      "username": username.text,
      "password": password.text,
      "namaLengkap": namalengkap.text,
      "noHp": notelp.text,
      "kodeOtp": randomNumber.toString(),
      "status": 'Unverified'
    }).catchError((err) {
      return null;
    });
    if (result != null) {
      var data = registerModelFromJson(result);
      if (data.kondisi!) {
        //FloatNotif().snackBar2(context, "Registrasi Berhasil");
        isloading.value = false;
        Get.offNamed(Routes.otpVerif);
      } else {
        isloading.value = false;
        if (data.message!.toString().split(" ").contains("username")) {
          // FloatNotif().snackBarFail(
          //     context, "Gagal Membuat Akun", "username sudah digunakan");
        } else if (data.message!.toString().split(" ").contains("hp")) {
          // FloatNotif().snackBarFail(
          //     context, "Gagal Membuat Akun", "No Hp kamu sudah digunakan");
        }
      }
    } else {
      isloading.value = false;
      // FloatNotif().snackBar2(context, "coba kembali beberapa saat");
    }
  }

  // void showSnackBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void random() {
    Random random = Random();
    randomNumber.value = random.nextInt(900000) + 100000;
  }
}
