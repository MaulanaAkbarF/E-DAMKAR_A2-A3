import 'package:edamkar_1/src/riwayatLaporans/controller/track_damkar_controller.dart';
import 'package:get/get.dart';

class TrackDamkarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackDamkarController>(() => TrackDamkarController());
  }
}
