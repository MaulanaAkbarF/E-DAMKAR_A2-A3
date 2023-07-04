import 'package:edamkar_1/config/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpResetPasswordController extends GetxController {
  final kodeotptxt = TextEditingController().obs;
  var noHp = ''.obs;
  var kodeOtp = ''.obs;

  void verifyCode() {
    if (kodeOtp.toString() == kodeotptxt.value.text) {
      whenVerified();
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => RemakePassView(
      //               noHp: noHp,
      //             )));
    } else {
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
