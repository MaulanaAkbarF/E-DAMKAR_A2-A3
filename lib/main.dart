import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/pages/Artikel.dart';
import 'package:edamkar_1/pages/DetailArtikel.dart';
import 'package:edamkar_1/pages/HomePage.dart';
import 'package:edamkar_1/pages/LaporanPage.dart';
import 'package:edamkar_1/pages/Profil.dart';
import 'package:edamkar_1/pages/RemakePass.dart';
import 'package:edamkar_1/pages/TentangKami.dart';
import 'package:edamkar_1/pages/emergencyCall.dart';
import 'package:edamkar_1/pages/resetpass.dart';
import 'package:edamkar_1/pages/signin.dart';
import 'package:edamkar_1/pages/signup.dart';
import 'package:edamkar_1/pages/RiwayatLaporan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MaterialApp(
            title: 'E-Damkar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => EmergencyCall(),
              '/signin': (context) => SignInPage(),
              '/signup': (context) => SignUpPage(),
              '/resetpass': (context) => ResetPassPage(),
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
          )));
}
