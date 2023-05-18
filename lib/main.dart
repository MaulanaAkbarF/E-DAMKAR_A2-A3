import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/pages/profiles/Profil.dart';
import 'package:edamkar_1/pages/laporans/LaporanPage.dart'; 
import 'package:edamkar_1/pages/informations/TentangKami.dart';
import 'package:edamkar_1/pages/artikels/Artikel.dart';
import 'package:edamkar_1/pages/artikels/DetailArtikel.dart';
import 'package:edamkar_1/pages/home/HomePage.dart';
import 'package:edamkar_1/pages/emergency/emergencyCall.dart';
import 'package:edamkar_1/pages/resetpass/resetpass.dart';
import 'package:edamkar_1/pages/login/signin.dart';
import 'package:edamkar_1/pages/register/signup.dart';
import 'package:edamkar_1/pages/riwayatLaporans/RiwayatLaporan.dart';
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
              '/detailartikel': (context) => DetailArtikel(""),
              '/profil': (context) => Profile(),
              '/tentangkami': (context) => TentangKami(),
              '/laporanpage': (context) => LaporanPage(),
              '/mainScreen' : (context) => AppMenu()
              // '/buatlaporan': (context) => BuatLaporan()
            },
          )));
}
