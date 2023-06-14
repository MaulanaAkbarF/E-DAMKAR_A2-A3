import 'package:edamkar_1/src/riwayatLaporans/controller/detail_riwayat_laporan_controller.dart';
import 'package:get/get.dart';

class DetailRiwayatLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRiwayatLaporanController>(
        () => DetailRiwayatLaporanController());
  }
}
