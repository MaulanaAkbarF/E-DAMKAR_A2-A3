import 'package:edamkar_1/src/resetpass/controller/reset_pass_controller.dart';
import 'package:get/get.dart';

class ResetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPassController>(() => ResetPassController());
  }
}
