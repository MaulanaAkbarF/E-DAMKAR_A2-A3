import 'package:edamkar_1/pages/artikels/Artikel.dart';
import 'package:edamkar_1/pages/home/HomePage.dart';
import 'package:edamkar_1/pages/laporans/LaporanPage.dart';
import 'package:edamkar_1/pages/profiles/Profil.dart';
import 'package:edamkar_1/pages/riwayatLaporans/RiwayatLaporan.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:flutter/material.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  var _selectedIndex = 0;
  List<Widget> menu = [
    const HomePage(),
    const LaporanPage(),
    const RiwayatLaporan(),
    const Artikel(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: menu[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: orange1,
          unselectedItemColor: Colors.black.withOpacity(.30),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.edit_document,
              ),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article_rounded,
              ),
              label: 'Artikel',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ));
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
