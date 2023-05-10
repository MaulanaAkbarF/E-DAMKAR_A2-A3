import 'package:edamkar_1/pages/Artikel.dart';
import 'package:edamkar_1/pages/DetailArtikel.dart';
import 'package:edamkar_1/pages/DetailRiwayatLaporan.dart';
import 'package:edamkar_1/pages/HomePage.dart';
import 'package:edamkar_1/pages/LaporanPage.dart';
import 'package:edamkar_1/pages/Profil.dart';
import 'package:edamkar_1/pages/RemakePass.dart';
import 'package:edamkar_1/pages/TentangKami.dart';
import 'package:edamkar_1/pages/buatLaporan.dart';
import 'package:edamkar_1/pages/emergencyCall.dart';
import 'package:edamkar_1/pages/otpverification.dart';
import 'package:edamkar_1/pages/resetpass.dart';
import 'package:edamkar_1/pages/signin.dart';
import 'package:edamkar_1/pages/signup.dart';
import 'package:edamkar_1/pages/RiwayatLaporan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'E-Damkar',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    initialRoute: '/homepage',
    routes: {
      '/': (context) => EmergencyCall(),
      '/signin': (context) => SignInPage(),
      '/signup': (context) => SignUpPage(),
      '/remakepass': (context) => RemakePassPage(),
      '/resetpass': (context) => ResetPassPage(),
      '/otp': (context) => OtpVerificationPage(),
      '/homepage': (context) => HomePage(),
      '/riwayatlapp': (context) => RiwayatLaporan(),
      // '/detailriwayat': (context) => DetailRiwayatLengkap()
      '/artikel': (context) => Artikel(),
      '/detailartikel': (context) => DetailArtikel(""),
      '/profil': (context) => Profile(),
      '/tentangkami': (context) => TentangKami(),
      '/laporanpage': (context) => LaporanPage(),
      // '/buatlaporan': (context) => BuatLaporan()
    },
  ));
}
