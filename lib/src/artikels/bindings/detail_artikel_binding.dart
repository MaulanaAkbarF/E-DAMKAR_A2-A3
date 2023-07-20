import 'package:edamkar_1/src/artikels/controller/detail_artikel_controller.dart';
import 'package:get/get.dart';

class DetailArtikelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailArtikelController>(() => DetailArtikelController());
  }
}
