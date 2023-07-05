import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatLaporanController extends GetxController {
  final search = TextEditingController();
  TextEditingController controllerSearch = new TextEditingController();

  List<Datum>? dataElement = [];
  List<Datum>? searchData = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserIdRiwayat();
  }

  void getUserIdRiwayat() async {
    var dataId = DataUser().getUserId();
    dataId.then((value) {
      // setState(() {
      print(value.toString());
      PostDataRiwayat(value.toString());
      // });
    });
  }

  void getUserIdRiwayatforSearch() async {
    var dataId = DataUser().getUserId();
    dataId.then((value) {
      // setState(() {
      // print(value.toString());
      PostDataSearch(value, search.text);
      // });
    });
  }

  void getIdStatus() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      // setState(() {
      PostRiwayatMenunggu(value.toString());
      // });
    });
  }

  void getIdStatusProses() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      // setState(() {
      PostRiwayatProses(value.toString());
      // });
    });
  }

  void getIdStatusSelesai() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      // setState(() {
      PostRiwayatSelesai(value.toString());
      // });
    });
  }

  void getIdStatusDitolak() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      // setState(() {
      PostRiwayatDitolak(value.toString());
      // });
    });
  }

  void getIdStatusEmergency() async {
    var dataStatus = DataUser().getUserId();
    dataStatus.then((value) {
      // setState(() {
      PostRiwayatEmergency(value.toString());
      // });
    });
  }

  // List<Datum>? _foundData = [];

  List<Datum>? searchKosong = [];

  PostDataSearch(int id, String kata) async {
    // search.clear();
    var result =
        await APIClient().getData('searchLapp/' + id.toString() + "/" + kata);
    if (result != null) {
      var dataSearch = dataPelaporanFromJson(result);
      if (dataSearch.data.isNotEmpty) {
        // setState(() {
        searchData = dataSearch.data;
        // });
      } else {
        // setState(() {
        searchData = searchKosong;

        print("masukan salah");
        // });
      }
    } else {
      print("masukan salah");
    }
  }

  PostRiwayatMenunggu(String id) async {
    var result = await APIClient().getData('filterLapMenunggu/' + id);
    if (result != null) {
      var dataMenunggu = dataPelaporanFromJson(result);
      if (dataMenunggu.data.isNotEmpty) {
        // setState(() {
        dataElement = dataMenunggu.data;
        // });
      }
    } else {
      print("Status Menunggu kosong");
    }
  }

  PostRiwayatProses(String id) async {
    var result = await APIClient().getData('filterLapProses/' + id);
    if (result != null) {
      var dataProses = dataPelaporanFromJson(result);
      if (dataProses.data.isNotEmpty) {
        // setState(() {
        dataElement = dataProses.data;
        // });
      }
    } else {
      print("Status Proses kosong");
    }
  }

  PostRiwayatSelesai(String id) async {
    var result = await APIClient().getData('filterLapSelesai/' + id);
    if (result != null) {
      var dataSelesai = dataPelaporanFromJson(result);
      if (dataSelesai.data.isNotEmpty) {
        // setState(() {
        dataElement = dataSelesai.data;
        // });
      }
    } else {
      print("Status Selesai kosong");
    }
  }

  PostRiwayatDitolak(String id) async {
    var result = await APIClient().getData('filterLapDitolak/' + id);
    if (result != null) {
      var dataDitolak = dataPelaporanFromJson(result);
      if (dataDitolak.data.isNotEmpty) {
        // setState(() {
        dataElement = dataDitolak.data;
        // });
      }
    } else {
      print("Status Ditolak kosong");
    }
  }

  PostRiwayatEmergency(String id) async {
    var result = await APIClient().getData('filterLapEmergency/' + id);
    if (result != null) {
      var dataEmer = dataPelaporanFromJson(result);
      if (dataEmer.data.isNotEmpty) {
        // setState(() {
        dataElement = dataEmer.data;
        // });
      }
    } else {
      print("Status Ditolak kosong");
    }
  }

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

  PostDataRiwayat(String id) async {
    dataElement!.clear();
    var result = await APIClient().getData('getPelaporan/' + id);

    print("asda0" + id);

    if (result != null) {
      var dataRiwayat = dataPelaporanFromJson(result);
      if (dataRiwayat.data.isNotEmpty) {
        // setState(() {
        dataElement = dataRiwayat.data;
        // });
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

  void runSearch(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      getUserIdRiwayat();
    } else {
      getUserIdRiwayatforSearch();
      print("kata search : " + search.text);
    }

    // setState(() {
    //   _foundData = searchData;
    // });
  }

  void goToDetail(int indexId) =>
      Get.toNamed(Routes.dtRiwayat, arguments: {'id': indexId});
}
