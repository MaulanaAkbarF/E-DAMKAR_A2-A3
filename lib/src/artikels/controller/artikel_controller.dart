import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/models/ArtikelEdukasiModel.dart';
import 'package:edamkar_1/models/ArtikelModel.dart';
import 'package:edamkar_1/models/SemuaArtikelBerita.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtikleController extends GetxController {
  List<ArtikelDatum>? artikelElement = [];
  List<EdukasiDatum>? artikelEdukasi = [];
  List<dynamic> beritaE = [];

  void pemabatasanLoad() {
    artikelElement!.clear();

    for (var i = 0; i <= 10; i++) {
      getData();
    }
  }

  @override
  void onInit() {
    super.onInit();
    //   if (mounted) {
    getData();
    getDataHigh();
    //   }
    // PostDataArtikel();
    // PostDataArtikelHigh();
    // pemabatasanLoad();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   if (mounted) {
  //     getData();
  //     getDataHigh();
  //   }
  // PostDataArtikel();
  // PostDataArtikelHigh();
  // pemabatasanLoad();

  //scrol controller

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     double minScrollExtent1 = _scrollController.position.minScrollExtent;
  //     double maxScrollExtent1 = _scrollController.position.maxScrollExtent;
  //     //
  //     animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 50,
  //         _scrollController);
  //   });
  // }

  // animateToMaxMin(double max, double min, double direction, int second,
  //     ScrollController scrollController) {
  //   scrollController
  //       .animateTo(direction,
  //           duration: Duration(seconds: second), curve: Curves.linear)
  //       .then((value) {
  //     direction = direction == max ? min : max;
  //     animateToMaxMin(max, min, direction, second, scrollController);
  //   });
  // }

  void postDataBerita() async {
    var result = await APIClient().getData('getBerita');

    if (result != null) {
      // setState(() {
      data = semuaArtikelModelFromJson(result);
      // });
      // debugPrint(data.length.toString());
    } else {
      debugPrint('terdapat kesalah');
    }
  }

  void postDataEdukasi() async {
    var result = await APIClient().getData('getEdukasi');

    if (result != null) {
      // setState(() {
      data = semuaArtikelModelFromJson(result);
      // });
    } else {
      print("data kosong");
    }
  }

  void postDataAgenda() async {
    var result = await APIClient().getData('getAgenda');

    if (result != null) {
      // setState(() {
      data = semuaArtikelModelFromJson(result);
      // });
    } else {
      print("data kosong");
    }
  }

  // postDataArtikelAll() async {
  //   var result = await APIClient().getData('getBerita');
  //   var result2 = await APIClient().getData('getEdukasi');

  //   if (result && result2 != null) {
  //     var dataRiwayat_berita = dataArtikelFromJson(result);
  //     var dataRiwayat_edukasi = artikelEdukasiModelFromJson(result2);

  //     if (dataRiwayat_berita.data.isNotEmpty &&
  //         dataRiwayat_edukasi.data.isNotEmpty) {
  //       setState(() {
  //         // artikelAll = dataRiwayat_berita.data;
  //         // artikelAll = dataRiwayat_edukasi.data;
  //       });
  //     }
  //   } else {
  //     print("data kosong");
  //   }
  // }

  // PostDataArtikelHigh() async {
  //   var result = await APIClient().getData('getBeritaHigh');

  //   if (result != null) {
  //     var dataRiwayat = artikelHighlightModelFromJson(result);
  //     if (dataRiwayat.data.isNotEmpty) {
  //       setState(() {
  //         artikelHigh = dataRiwayat.data;
  //         print(dataRiwayat);
  //       });
  //     }
  //   } else {
  //     print("data kosong");
  //   }
  // }

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

  var data;
  var dataHigh;

  void getData() async {
    var result = await APIClient().getData('getAllArtikel');
    if (result != null) {
      // setState(() {
      data = semuaArtikelModelFromJson(result);
      debugPrint(data.length.toString());
      // });
    } else {
      debugPrint('terdapat kesalahan');
    }
  }

  void getDataHigh() async {
    var result = await APIClient().getData('getAllArtikelHigh');
    if (result != null) {
      // setState(() {
      dataHigh = semuaArtikelModelFromJson(result);

      debugPrint(dataHigh.length.toString());
      // });
    } else {
      debugPrint('terdapat kesalah');
    }
  }
}