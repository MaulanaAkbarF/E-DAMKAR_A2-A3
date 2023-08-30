import 'package:edamkar_1/src/resetpass/controller/remake_pass_controller.dart';
import 'package:get/get.dart';

class RemakePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemakePassController>(() => RemakePassController());
  }
}
