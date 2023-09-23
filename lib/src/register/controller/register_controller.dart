import 'dart:math';

import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/src/register/model/register_model.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
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

  // @override
  // void onInit() {
  //   super.onInit();
  // Random();
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    random();
  }

  bool checkField() {
    if (namalengkap.text.isEmpty) {
      Get.snackbar("Field kosong", "Nama Lengkap tidak boleh kosong",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "Nama Lengkap tidak boleh kosong");
      return false;
    }
    if (namalengkap.text.length < 5) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "Nama Yang kamu masukkan terlalu pendek",
          backgroundColor: white);
      //FloatNotif()
      // .snackBarFail(context, "", "Nama Yang kamu masukkan terlalu pendek");
      return false;
    }
    if (namalengkap.text.length > 30) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "Nama Yang kamu masukkan terlalu panjang",
          backgroundColor: white);
      //FloatNotif()
      // .snackBarFail(context, "", "Nama yang kamu masukkan terlalu pendek");
      return false;
    }
    if (username.text.isEmpty) {
      Get.snackbar("Field kosong", "Username tidak boleh kosong",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "Username tidak boleh kosong");
      return false;
    }
    if (username.text.contains(" ")) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "Username tidak boleh mengandung spasi",
          backgroundColor: white);
      return false;
    }
    if (username.text.length < 5) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "username Yang kamu masukkan terlalu pendek",
          backgroundColor: white);
      return false;
    }
    if (username.text.length > 30) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "username Yang kamu masukkan terlalu panjang",
          backgroundColor: white);
      return false;
    }
    if (password.text.isEmpty) {
      Get.snackbar("Field kosong", "Password tidak boleh kosong",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "password tidak boleh kosong");
      return false;
    }
    if (password.text.length < 8) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "password Yang kamu masukkan terlalu pendek",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "password terlalu pendek");
      return false;
    }
    if (password.text.length > 30) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "password Yang kamu masukkan terlalu panjang",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "password terlalu panjang");
      return false;
    }
    if (validatepass.text.isEmpty) {
      Get.snackbar("Field kosong", "Validasi password tidak boleh kosong",
          backgroundColor: white);
      //FloatNotif()
      // .snackBarFail(context, "", "Validasi password tidak boleh kosong");
      return false;
    }
    if (validatepass.text != password.text) {
      Get.snackbar("Field tidak sesuai",
          "Validasi password tidak sesuai dengan password",
          backgroundColor: white);
      //FloatNotif().snackBarFail(
      // context, "", "validasi password tidak sesuai dengan password");
      return false;
    }
    if (notelp.text.isEmpty) {
      Get.snackbar("Field kosong", "Nomer Telepon tidak boleh kosong",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu pendek");
      return false;
    }
    if (notelp.text.length < 9) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "Nomer Telepon Yang kamu masukkan terlalu pendek",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu pendek");
      return false;
    }
    if (notelp.text.length > 13) {
      Get.snackbar("Digit Input Field tidak sesuai",
          "Nomer Telepon Yang kamu masukkan terlalu panjang",
          backgroundColor: white);
      //FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu panjang");
      return false;
    }
    return true;
  }

  void RegisterPost() async {
    isloading.value = true;

    if (checkField()) {
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
          Get.offNamed(Routes.otpVerif,
              arguments: {"notel": notelp.text, "rand": randomNumber});
        } else {
          isloading.value = false;
          if (data.message!.toString().split(" ").contains("username")) {
            Get.snackbar("Gagal Membuat Akun", "username sudah digunakan",
                backgroundColor: white);
            // FloatNotif().snackBarFail(
            //     context, "Gagal Membuat Akun", "username sudah digunakan");
          } else if (data.message!.toString().split(" ").contains("hp")) {
            Get.snackbar("Gagal Membuat Akun", "No Hp kamu sudah digunakan",
                backgroundColor: white);
            // FloatNotif().snackBarFail(
            //     context, "Gagal Membuat Akun", "No Hp kamu sudah digunakan");
          }
        }
      } else {
        Get.snackbar("Gagal Membuat Akun", "coba kembali beberapa saat",
            backgroundColor: white);
        // FloatNotif().snackBar2(context, "coba kembali beberapa saat");
      }
    }
    isloading.value = false;
  }

  // void showSnackBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void random() {
    var rng = Random();
    randomNumber.value = rng.nextInt(900000) + 100000;
    print(rng.nextInt(900000) + 100000);
  }

  passVisible() => passwordVisible.value = !passwordVisible.value;
  validVisible() => passwordVisible1.value = !passwordVisible1.value;
}
