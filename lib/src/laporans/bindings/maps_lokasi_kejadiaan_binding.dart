import 'package:edamkar_1/src/laporans/controllers/maps_lokasi_kejadian_controller.dart';
import 'package:get/get.dart';

class MapsLokasiKejadianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsLokasiKejadianController>(
        () => MapsLokasiKejadianController());
  }
}
