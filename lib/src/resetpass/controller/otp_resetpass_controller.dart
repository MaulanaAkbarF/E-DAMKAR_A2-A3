import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map<String, dynamic> arguments = Get.arguments;

class OtpResetPasswordController extends GetxController {
  // String kodeOtp = arguments['kodeOtp'];
  // String noHp = arguments['noHp'];

  final kodeotptxt = TextEditingController().obs;
  var noHp = arguments['noHp'];
  var kodeOtp = arguments['kodeOtp'];

  @override
  void onInit() {
    print("nilai otp : " + kodeOtp.toString());
    // TODO: implement onInit
    super.onInit();
  }

  void verifyCode() {
    if (kodeOtp.toString() == kodeotptxt.value.text) {
      // whenVerified();
      Get.toNamed(Routes.remakePw, arguments: {
        'noHp': noHp,
      });
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => RemakePassView(
      //               noHp: noHp,
      //             )));
    } else {
      Get.snackbar("Gagal", "Kode OTP anda tidak sesuai !");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //     "Kode verifikasi tidak sesuai!",
      //     textAlign: TextAlign.center,
      //   )),
      // );
    }
  }

  Future<void> whenVerified() async {
    var result = await APIClient().postData('verification/$noHp', {
      "noHp": noHp,
      "kodeOtp": 'Null',
      "status": 'Verified'
    }).catchError((err) {
      return null;
    });
    if (result != null) {
      print("Nomor berhasil di verifikasi");
    } else {
      print('something error on code');
      print(result);
    }
  }

  void kirimNotifikasi() async {
    var data = {
      "kodeOtp": kodeOtp.value,
      "noHp": noHp.value,
    };
    await APIClient().postData('verifyOtp/whatsapp', data);
    // FloatNotif().snackBar2(context, "kode Otp berhasil terkirim");
  }
}
