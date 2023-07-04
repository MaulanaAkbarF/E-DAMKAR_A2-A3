import 'package:edamkar_1/config/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemakePassController extends GetxController {
  var passwordVisible = true.obs;
  var passwordVisible1 = true.obs;
  var noHp = ''.obs;

  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  var message = ''.obs;

  @override
  void onClose() {
    super.onClose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
  }

  void gantiPassword() async {
    var data = await APIClient().postData('changepass/$noHp', {
      "password": confirmPasswordController.value.text,
      "noHp": noHp.value,
    }).catchError((err) {
      return null;
    });

    if (data != null) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => UpdatePasswordSuccess()));
    } else {
      print("Something error on code");
      print(data);
    }
  }

  void checkPassword() {
    if (newPasswordController.value.text ==
        confirmPasswordController.value.text) {
      gantiPassword();
    } else {}
  }

  passVisible() => passwordVisible1.value = !passwordVisible1.value;
  passVisible2() => passwordVisible.value = !passwordVisible.value;

  onSaveData() => checkPassword();
}
