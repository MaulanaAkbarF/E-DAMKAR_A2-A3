import 'package:edamkar_1/src/home/controller/card_artikel_controller.dart';
import 'package:edamkar_1/src/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CardArtikelController>(() => CardArtikelController());
  }
}
