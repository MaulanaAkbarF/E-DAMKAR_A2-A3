import 'package:edamkar_1/src/artikels/controller/artikel_controller.dart';
import 'package:edamkar_1/src/dashboard/controller/dashboard_controller.dart';
import 'package:edamkar_1/src/home/controller/home_controller.dart';
import 'package:edamkar_1/src/riwayatLaporans/controller/riwayat_laporan_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ArtikleController>(() => ArtikleController());
    Get.lazyPut<RiwayatLaporanController>(() => RiwayatLaporanController());
  }
}
