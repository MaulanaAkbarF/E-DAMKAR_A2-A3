import 'package:edamkar_1/src/profiles/controller/ubah_sandi_controller.dart';
import 'package:get/get.dart';

class UbahSandiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahSandiController>(() => UbahSandiController());
  }

}