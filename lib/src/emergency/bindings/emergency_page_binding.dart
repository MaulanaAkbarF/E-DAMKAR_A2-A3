import 'package:edamkar_1/src/emergency/controller/emergency_controller.dart';
import 'package:get/get.dart';

class EmergencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyController>(() => EmergencyController());
  }
}
