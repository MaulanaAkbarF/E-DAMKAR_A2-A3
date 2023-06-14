import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:get/get.dart';

class DetailRiwayatLaporanController extends GetxController {
  var dataArg = Get.arguments;

  late RxInt id;
  List<Datum>? dataElement = [];

  @override
  void onInit() {
    super.onInit();

    print(dataArg);
    // getIdLaporan();
    // _id = widget.idLapp;
    // postDetailRiwayat(id.value);
  }

  postDetailRiwayat(int id) async {
    var result = await APIClient().getData('getDetailLap/' + id.toString());

    if (result != null) {
      var detailRiwayat = dataPelaporanFromJson(result);
      if (detailRiwayat.data.isNotEmpty) {
        // setState(() {
        dataElement = detailRiwayat.data;
        // });
      }
    } else {
      print("Data Kosong");
    }
  }
}
