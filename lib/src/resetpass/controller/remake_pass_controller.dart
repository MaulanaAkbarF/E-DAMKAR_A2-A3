import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map<String, dynamic> arguments = Get.arguments;

class RemakePassController extends GetxController {
  var passwordVisible = true.obs;
  var passwordVisible1 = true.obs;

  var noHp = arguments['noHp'];

  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  var message = ''.obs;

  @override
  void onClose() {
    super.onClose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
  }

  bool checkInput() {
    if (newPasswordController.value.text.isEmpty) {
      Get.snackbar('Gagal', 'Password baru tidak boleh kosong !',
          backgroundColor: red1, colorText: white);
      return false;
    } else if (newPasswordController.value.text.length < 8) {
      Get.snackbar('Gagal', 'Password harus diatas 8 karakter !',
          backgroundColor: red1, colorText: white);
      return false;
    } else if (newPasswordController.value.text.length > 30) {
      Get.snackbar('Gagal', 'Password terlalu panjang !',
          backgroundColor: red1, colorText: white);
      return false;
    } else if (confirmPasswordController.value.text.isEmpty) {
      Get.snackbar('Gagal', 'Konfirmasi password tidak boleh kosong !',
          backgroundColor: red1, colorText: white);
      return false;
    }

    return true;
  }

  void gantiPassword() async {
    if (checkInput()) {
      var data = await APIClient().postData('changepass/$noHp', {
        "noHp": noHp,
        "password": newPasswordController.value.text,
      }).catchError((err) {});

      if (data != null) {
        Get.toNamed(Routes.succesResetPw);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => UpdatePasswordSuccess()));
      } else {
        print("Something error on code");
        print(data);
      }
    }
  }

  void checkPassword() {
    if (newPasswordController.value.text ==
        confirmPasswordController.value.text) {
      gantiPassword();
    } else {
      Get.snackbar("Gagal", "Konfirmasi password tidak sesuai !",
          backgroundColor: red1, colorText: white);
    }
  }

  passVisible() => passwordVisible.value = !passwordVisible.value;
  passVisible2() => passwordVisible1.value = !passwordVisible1.value;

  onSaveData() => checkPassword();
}
