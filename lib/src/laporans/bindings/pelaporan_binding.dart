import 'package:edamkar_1/src/laporans/controllers/pelaporan_controller.dart';
import 'package:get/get.dart';

class PelaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelaporanController>(() => PelaporanController());
  }
}
