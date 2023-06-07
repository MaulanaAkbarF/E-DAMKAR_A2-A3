import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/models/HomeModel.dart';
import 'package:get/get.dart';

class CardArtikelController extends GetxController {
  var data = HomeModel().obs;

  void getArtikel() async {
    var result = await APIClient().getData("getBeritaHome");
    if (result != null || result != "") {
      data.value = homeModelFromJson(result);
    }
  }
}
