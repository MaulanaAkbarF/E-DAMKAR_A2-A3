import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/register/view/verification_succses_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSignUpController extends GetxController {
  final kodeotptxt = TextEditingController().obs;
  String otpRegister = '';
  String noHp = '';
  var dataArgs = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    noHp = dataArgs['notel'];
    otpRegister = dataArgs['rand'].toString();
    sendNotification();
  }

  void sendNotification() async {
    var data = {
      "kodeOtp": otpRegister,
      "noHp": noHp,
    };
    await APIClient().postData('verifyOtp/whatsapp', data);
    Get.snackbar("Berhasil", "Kode OTP berhasil dikirim pada nomer whatsapp mu",
        snackPosition: SnackPosition.BOTTOM);
  }

  void verifyCode() {
    if (otpRegister.toString() == kodeotptxt.value.text) {
      whenVerified();
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => VerificationSuccess()));
    } else {
      Get.snackbar("Gagal", "Kode Verifikasi salah");
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
    var result = await APIClient().postData('verification/akun', {
      "noHp": noHp,
      "kodeOtp": 'Null',
      "status": 'Verified'
    }).catchError((err) {
      return null;
    });
    if (result != null) {
      Get.to(const VerificationSuccess());
    } else {
      print('something error on code');
      print(result);
    }
  }

  void goToRemakePass() => Get.offNamed(Routes.home);

  // void navToRemakePassPage(BuildContext context) {
  //   Timer(Duration(seconds: 0), () {
  //     Navigator.push(
  //         context,
  //         PageRouteBuilder(
  //           pageBuilder: (_, __, ___) => RemakePassPage(noHp: noHp.value),
  //           transitionsBuilder:
  //               (context, animation, secondaryAnimation, child) {
  //             return SlideTransition(
  //               position: Tween<Offset>(
  //                 begin: Offset(-1, 0),
  //                 end: Offset.zero,
  //               ).animate(
  //                 CurvedAnimation(
  //                   parent: animation,
  //                   curve: Curves.easeInOut,
  //                 ),
  //               ),
  //               child: child,
  //             );
  //           },
  //         ));
  //   });
  // }
}
