import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/riwayatLaporans/models/detail_pelaporan.dart';
import 'package:get/get.dart';

class DetailRiwayatLaporanController extends GetxController {
  var dataArg = Get.arguments;

  late int id = 0;
  RxBool isDone = false.obs;
  RxBool isLoading = false.obs;
  RxString loadingTxt = "Loading".obs;
  Rx<Data> dataElement = Data(
          idLaporan: 0,
          statusRiwayat: '',
          kategoriLaporan: '',
          tanggal: '',
          deskripsi: '',
          imageUrl: '',
          alamat: '',
          urgensi: '')
      .obs;

  @override
  void onInit() {
    super.onInit();
    id = dataArg['id'];
    postDetailRiwayat(id);
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
  }

  postDetailRiwayat(int id) async {
    isLoading.value = true;
    loadingAnim();
    var result = await APIClient().getData('getDetailLap/$id');
    isDone.value = true;
    isLoading.value = false;
    if (result != null) {
      var detailRiwayat = detailLaporanFromJson(result);
      dataElement.value = detailRiwayat.data;
      // update();
    } else {
      isDone.value = true;
      isLoading.value = false;
    }
  }

  goToMaps() => Get.toNamed(Routes.mapsTrack);
}
