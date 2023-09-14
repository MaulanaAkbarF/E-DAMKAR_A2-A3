import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var dataArgs = Get.arguments;
  PageController pccontroller = PageController();

  @override
  void onInit() {
    super.onInit();
    checkIsPreferedIndex();
  }

  void changeSelectedIndex(int index) {
    pccontroller.jumpToPage(index);
  }

  void onPageChange(int num) {
    selectedIndex.value = num;
  }

  void checkIsPreferedIndex() {
    if (dataArgs != null) {
      selectedIndex.value = dataArgs;
      pccontroller = PageController(initialPage: dataArgs);
    }
  }
}
