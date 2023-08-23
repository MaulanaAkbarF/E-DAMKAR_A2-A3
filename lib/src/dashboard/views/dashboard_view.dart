import 'package:edamkar_1/src/dashboard/controller/dashboard_controller.dart';
import 'package:edamkar_1/src/home/view/home_view.dart';
import 'package:edamkar_1/src/laporans/views/laporan_page.dart';
import 'package:edamkar_1/src/riwayatLaporans/views/riwayat_laporan_view.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            const HomePageView(),
            const LaporanPage(),
            RiwayatLaporanView(),
            // ArtikelView(),
          ],
        )),
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
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.history,
            //   ),
            //   label: 'Riwayat',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article_rounded,
              ),
              label: 'Artikel',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.settings,
            //   ),
            //   label: 'Setting',
            // ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeSelectedIndex,
        )));
  }
}
