import 'package:edamkar_1/src/resetpass/controller/otp_resetpass_controller.dart';
import 'package:get/get.dart';

class OtpResetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpResetPasswordController>(() => OtpResetPasswordController());
  }
}
