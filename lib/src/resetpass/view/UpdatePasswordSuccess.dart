import 'package:edamkar_1/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UpdatePasswordSuccess extends StatelessWidget {
  const UpdatePasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset("semuaAset/icon/success2.json",
                    width: 350, height: 230),
                SizedBox(
                  height: 36,
                  child: Text(
                    'Kata Sandi Berhasil Diganti!',
                    style: TextStyle(
                        fontFamily: "font/inter_bold.ttf",
                        fontSize: 24,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Text(
                    'Kata sandi Anda berhasil diganti. Silakan gunakan kata sandi baru Anda untuk masuk ke akun Anda. Jangan lupa untuk mengingat kata sandi baru Anda dan menjaganya dengan baik agar akun Anda tetap aman!',
                    style: TextStyle(
                        fontFamily: "font/inter_regular.ttf",
                        fontSize: 18,
                        height: 1.4,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(50),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.emergency);

                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (BuildContext context) => EmergencyCall()),
                    //   (Route<dynamic> route) => false,
                    // );
                  },
                  child: const Text(
                    'Kembali ke Halaman Awal',
                    style: TextStyle(
                      // Properti gaya teks
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
