import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:get/get.dart';

class DetailRiwayatLaporanController extends GetxController {
  var dataArg = Get.arguments;

  late RxInt id = 0.obs;
  RxBool isDone = false.obs;
  RxBool isLoading = false.obs;
  RxString loadingTxt = "Loading".obs;
  Rx<List<Datum>?> dataElement = Rx<List<Datum>?>(null);

  @override
  void onInit() {
    super.onInit();
    id.value = dataArg['id'];
    postDetailRiwayat(id.value);

    // ever(isLoading, (_) => print("sedang loading"));
  }

  loadingAnim() async {
    while (isLoading.value) {
      for (int i = 0; i < 3; i++) {
        await Future.delayed(const Duration(milliseconds: 300));
        loadingTxt.value = loadingTxt + ".";
      }
      await Future.delayed(const Duration(milliseconds: 300));
      loadingTxt.value = "Loading";
    }

    // loadingTxt.value = 'Loading';
  }

  postDetailRiwayat(int id) async {
    isLoading.value = true;
    loadingAnim();
    var result = await APIClient().getData('getDetailLap/' + id.toString());
    isDone.value = true;
    isLoading.value = false;
    if (result != null) {
      var detailRiwayat = dataPelaporanFromJson(result);
      if (detailRiwayat.data.isNotEmpty) {
        // setState(() {
        dataElement.value = detailRiwayat.data;
        // });

        update();
      }
    } else {
      isDone.value = true;
      isLoading.value = false;
    }
  }
}
