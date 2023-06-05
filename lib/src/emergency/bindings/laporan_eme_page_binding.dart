import 'package:edamkar_1/src/emergency/controller/laporan_anonym_controller.dart';
import 'package:get/get.dart';

class LaporanAnonymBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanAnonymController>(() => LaporanAnonymController());
  }
}
