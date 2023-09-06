import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/artikels/views/artikel_view.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Notice"),
            content: const Text(
                "apakah anda sudah yakin untuk keluar dari aplikasi"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal1, vertical: paddingVertical2),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text('Tidak'),
                ),
              ),
              GestureDetector(
                onTap: () => Get.offAllNamed(Routes.emergency),
                child: const Text('Ya'),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
      child: Obx(() => Scaffold(
        body: SafeArea(
            child: PageView(
          controller: controller.pccontroller,
          onPageChanged: controller.onPageChange,
          // index: controller.selectedIndex.value,
          children: [
            const HomePageView(),
            const LaporanPage(),
            RiwayatLaporanView(),
            ArtikelView(),
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
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeSelectedIndex,
        ))));
  }
}
