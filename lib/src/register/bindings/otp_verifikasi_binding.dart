import 'package:edamkar_1/src/register/controller/verifikasi_controller.dart';
import 'package:get/get.dart';

class VerificationSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationSignUpController>(
        () => VerificationSignUpController());
  }
}
