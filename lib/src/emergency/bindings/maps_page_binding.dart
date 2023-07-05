import 'package:edamkar_1/src/emergency/controller/maps_Controller.dart';
import 'package:get/get.dart';

class MapsAnonymBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsAnonymController>(() => MapsAnonymController());
  }
}
