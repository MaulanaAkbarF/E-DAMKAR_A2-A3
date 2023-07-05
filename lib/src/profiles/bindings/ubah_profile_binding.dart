import 'package:edamkar_1/src/profiles/controller/ubah_profile_controller.dart';
import 'package:get/get.dart';

class UbahProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
