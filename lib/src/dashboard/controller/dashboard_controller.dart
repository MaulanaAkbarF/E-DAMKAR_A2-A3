import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var dataArgs = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkIsPreferedIndex();
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void checkIsPreferedIndex() {
    if (dataArgs != null) {
      selectedIndex.value = dataArgs;
      update();
    }
  }
}
