import 'dart:convert';
import 'dart:math';

import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetPassController extends GetxController {
  final notelp = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    random();
  }

  int randomNumber = 100000;
  String noHP = '';

  void random() {
    Random random = Random();
    randomNumber = random.nextInt(900000) + 100000;
  }

  void _kirimNotifikasi() async {
    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": notelp.value.text,
    };
    await APIClient().postData('verifyOtp/whatsapp', data);
    //FloatNotif().snackBar2(context, "kode Otp berhasil terkirim");
  }

  Future<bool> validasiNomer(String noHP) async {
    var apiUrl = Uri.parse('https://edamkar.wsjti.id/api/getNoHp/$noHP');
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['data'].isEmpty) {
        print('Data is empty');
        return false; // menambahkan return false
      } else {
        noHP = jsonResponse['data'][0]['noHP'];
        return true; // menambahkan return true
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false; // menambahkan return false
    }
  }

  void konfirmasiData() async {
    if (formKey.currentState!.validate()) {
      bool isnumberValid = await validasiNomer(notelp.value.text);
      if (isnumberValid) {
        _kirimNotifikasi();

        Get.toNamed(Routes.otpResetpw, arguments: {
        'kodeOtp': randomNumber.toString(),
        'noHp': notelp.value.text,
      });
        // Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       pageBuilder: (_, __, ___) => OTPResetPassword(
        //         kodeOtp: randomNumber.toString(),
        //         noHp: notelp.text,
        //       ),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return SlideTransition(
        //           position: Tween<Offset>(
        //             begin: Offset(-1, 0),
        //             end: Offset.zero,
        //           ).animate(
        //             CurvedAnimation(
        //               parent: animation,
        //               curve: Curves.easeInOut,
        //             ),
        //           ),
        //           child: child,
        //         );
        //       },
        //     ));
      } else {
        Get.snackbar("Gagal", "Periksa kembali nomor anda !");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //       content: Text(
        //     "Nomor telepon tidak terdaftar!",
        //     textAlign: TextAlign.center,
        //   )),
        // );
      }
    }
  }
}
