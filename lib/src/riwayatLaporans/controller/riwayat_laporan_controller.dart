import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/src/riwayatLaporans/models/DataPelaporan.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/src/riwayatLaporans/models/rirayat_laporan_model.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatLaporanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var search = TextEditingController().obs;
  var textSearch = ''.obs;
  late TabController tabController;
  // TextEditingController controllerSearch = TextEditingController();
  // TabController tabController;
  var idUser = 0;
  RxList<Datum>? dataElement = <Datum>[].obs;
  Rx<RiwayatLaporan>? dataProses =
      RiwayatLaporan(kondisi: false, message: "empty").obs;
  Rx<RiwayatLaporan>? dataMenunggu =
      RiwayatLaporan(kondisi: false, message: "empty").obs;
  Rx<RiwayatLaporan>? dataDitangani =
      RiwayatLaporan(kondisi: false, message: "empty").obs;
  Rx<RiwayatLaporan>? dataSelesai =
      RiwayatLaporan(kondisi: false, message: "empty").obs;
  Rx<RiwayatLaporan>? dataDitolak =
      RiwayatLaporan(kondisi: false, message: "empty").obs;
  RxList<Datum>? searchData = <Datum>[].obs;

  // var col1 = orange1.obs;
  // var col2 = white.obs;
  // var col3 = white.obs;
  // var col4 = white.obs;

  // late TabController tabController;
  int selectedIndex = 1;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 7, vsync: this, initialIndex: 1);
    idUser = await DataUser().getUserId().then((value) => idUser = value);

    getDataRiwayat();
    getRiwayatMenunggu();
    getRiwayatProses();
    getRiwayatDitangani();
    getRiwayatSelesai();
    getRiwayatDitolak();
    debounce(
      textSearch,
      (_) => PostDataSearch(textSearch.value),
      time: Duration(seconds: 1),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  setColorStatus(String status) {
    if (status == "Menunggu") {
      return Color.fromARGB(255, 250, 202, 21);
    }
    if (status == "Ditangani") {
      return Color.fromARGB(255, 63, 131, 248);
    }
    if (status == "Selesai") {
      return Color.fromARGB(255, 17, 178, 124);
    }
    if (status == "Ditolak") {
      return Color.fromARGB(255, 224, 36, 36);
    }
    if (status == "Emergency") {
      return Colors.black26; // default color
    }
    return Colors.white;
  }

  // void getUserIdRiwayatforSearch() async {
  //   var dataId = DataUser().getUserId();
  //   dataId.then((value) {
  //     PostDataSearch(value, textSearch.value);
  //     // });
  //   });
  // }

  // void getIdStatusEmergency() async {
  //   var dataStatus = DataUser().getUserId();
  //   dataStatus.then((value) {
  //     // setState(() {
  //     getRiwayatEmergency(value.toString());
  //     // });
  //   });
  // }

  // List<RiwayatLaporan>? _foundData = [];

  // List<RiwayatLaporan>? searchKosong = [];

  PostDataSearch(String kata) async {
    if (kata.isNotEmpty) {
      var result = await APIClient()
          .getData('searchLapp/' + idUser.toString() + "/" + kata);
      if (result != null) {
        var dataSearch = dataPelaporanFromJson(result);
        if (dataSearch.data.isNotEmpty) {
          // setState(() {
          searchData?.value = dataSearch.data;
          // });
        } else {
          // setState(() {
          // searchData = searchKosong;

          print("masukan salah");
          // });
        }
      } else {
        print("masukan salah");
      }
    }
    // search.clear();
  }

  getRiwayatMenunggu() async {
    var result = await APIClient().getData('filterLapMenunggu/$idUser');
    if (result != null) {
      var data = riwayatLaporanFromJson(result);
      if (data.kondisi) {
        dataMenunggu?.value = data;
        print(data);
      }
    } else {
      print("Status Menunggu kosong");
    }
  }

  getRiwayatProses() async {
    var result = await APIClient().getData('filterLapProses/$idUser');
    if (result != null) {
      var data = riwayatLaporanFromJson(result);
      if (data.kondisi) {
        // setState(() {
        dataProses?.value = data;
        // });
      }
    } else {
      print("Status Proses kosong");
    }
  }

  getRiwayatDitangani() async {
    var result = await APIClient().getData('filterLapDitangani/$idUser');
    if (result != null) {
      var data = riwayatLaporanFromJson(result);
      if (data.kondisi) {
        // setState(() {
        dataDitangani?.value = data;
        // });
      }
    } else {
      print("Status Proses kosong");
    }
  }

  getRiwayatSelesai() async {
    var result = await APIClient().getData('filterLapSelesai/$idUser');
    if (result != null) {
      var data = riwayatLaporanFromJson(result);
      if (data.kondisi) {
        // setState(() {
        dataSelesai?.value = data;
        // });
      }
    } else {
      print("Status Selesai kosong");
    }
  }

  getRiwayatDitolak() async {
    var result = await APIClient().getData('filterLapDitolak/$idUser');
    if (result != null) {
      var data = riwayatLaporanFromJson(result);
      if (data.kondisi) {
        dataDitolak?.value = data;
      }
    } else {
      print("Status Ditolak kosong");
    }
  }

  // getRiwayatEmergency(String id) async {
  //   var result = await APIClient().getData('filterLapEmergency/$id');
  //   if (result != null) {
  //     var dataEmer = dataPelaporanFromJson(result);
  //     if (dataEmer.data.isNotEmpty) {
  //       // setState(() {
  //       dataElement?.value = dataEmer.data;
  //       // });
  //     }
  //   } else {
  //     print("Status Ditolak kosong");
  //   }
  // }

  // PostDetailRiwayat() async {
  //   var result = await APIClient().getData('getPelaporan/' + '11');

  //   if (result != null) {
  //     var data = dataPelaporanFromJson(result);
  //     if (data.data.isNotEmpty) {
  //       await laporanData().addLapor(
  //         dataElement![data].idLaporan.toString(),
  //         dataElement![result].alamat.toString(),
  //         dataElement![result].deskripsi.toString(),
  //         dataElement![result].imageUrl.toString(),
  //         dataElement![result].statusRiwayat.toString(),
  //         dataElement![result].kategoriLaporan.toString(),
  //         dataElement![result].tanggal.toString()

  //       );
  //     }
  //   }
  // }

  getDataRiwayat() async {
    dataElement!.clear();
    var result = await APIClient().getData('getPelaporan/$idUser');

    if (result != null) {
      var dataRiwayat = dataPelaporanFromJson(result);
      if (dataRiwayat.data.isNotEmpty) {
        dataElement?.value = dataRiwayat.data;
      }
    } else {
      print("data kosong");
    }
  }

  final ButtonStyle buttonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color.fromARGB(255, 224, 36, 36),
    padding: EdgeInsets.symmetric(
        horizontal: paddingHorozontal1, vertical: paddingVertical1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(20),
    )),
  );

  String monthString(String month) {
    switch (month) {
      case "01":
        return "Jan";
      case "02":
        return "Feb";
      case "03":
        return "Mar";
      case "04":
        return "Apr";
      case "05":
        return "Mei";
      case "06":
        return "Jun";
      case "07":
        return "Jul";
      case "08":
        return "Agu";
      case "09":
        return "Sep";
      case "10":
        return "Okt";
      case "11":
        return "Nov";
      case "12":
        return "Des";
    }
    return "bulan";
  }

  void runSearch() {
    textSearch.value = search.value.text;
  }

  void goSearch() => tabController.animateTo(0);

  void goToDetail(int indexId) =>
      Get.toNamed(Routes.dtRiwayat, arguments: {'id': indexId});
}
