import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/login/model/login_model.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final account = TextEditingController().obs;
  final pass = TextEditingController().obs;
  var isLoading = false.obs;
  var passwordVisible = true.obs;

  String title = 'Pesan';

  @override
  void onClose() {
    super.onClose();
    account.value.dispose();
    pass.value.dispose();
  }

  bool checkInput() {
    if (account.value.text.isEmpty) {
      Get.snackbar(title, 'username atau nomer telepon tidak boleh kosong',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length < 5) {
      Get.snackbar(title, 'username kamu terlalu pendek',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length > 30) {
      Get.snackbar(title, 'username kamu terlalu panjang',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.isEmpty) {
      Get.snackbar(title, 'password tidak boleh kosong',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.length < 5) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu pendek',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.length > 30) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu panjang',
          backgroundColor: black3, colorText: white);
      return false;
    }
    return true;
  }

  loginPost() async {
    if (checkInput()) {
      isLoading.value = true;
      var result = await APIClient().postData('login', {
        "username": account.value.text,
        "password": pass.value.text
      }).catchError((err) {});

      if (result != null && result != false) {
        var data = loginModelFromJson(result);
        if (data.status) {
          await DataUser().addUser(
              data.data!.id,
              data.data!.username.toString(),
              data.data!.namaLengkap.toString(),
              data.data!.noHp.toString(),
              data.token.toString(),
              data.data!.fotoUser.toString(),
              data.data!.password.toString());
          Get.snackbar(
            
              "Berhasil Login", "Selamat Datang ${data.data!.namaLengkap}",
              backgroundColor: Color.fromARGB(199, 255, 255, 255), colorText: Colors.black87);
          Get.offNamed(Routes.dashboard);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          Get.snackbar("Login Gagal", data.message.toString(),
              backgroundColor: black3, colorText: white);
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Login Gagal", "coba ulangi dalam beberapa saat",
            backgroundColor: black3, colorText: white);
      }
    }
  }

  showHidePass() => passwordVisible.value = !passwordVisible.value;

  goToResetPass() => Get.toNamed(Routes.resetPass);

  goToSignUp() => Get.toNamed(Routes.register);
}
