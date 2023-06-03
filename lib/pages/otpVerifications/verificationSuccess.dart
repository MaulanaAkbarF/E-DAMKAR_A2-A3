import 'package:edamkar_1/src/home/HomePage.dart';
import 'package:edamkar_1/src/login/view/Login_View.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerificationSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset("semuaAset/icon/success2.json",
                    width: 350, height: 230),
                SizedBox(
                  height: 36,
                  child: Text(
                    'Verifikasi Berhasil!',
                    style: TextStyle(
                        fontFamily: "font/inter_bold.ttf",
                        fontSize: 24,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Text(
                    'Selamat! Nomor WhatsApp Anda berhasil diverifikasi. Sekarang Anda dapat mulai menggunakan fitur-fitur aplikasi E-Damkar!',
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
                    minimumSize: Size.fromHeight(50),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Masuk',
                        style: TextStyle(
                          // Properti gaya teks
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
