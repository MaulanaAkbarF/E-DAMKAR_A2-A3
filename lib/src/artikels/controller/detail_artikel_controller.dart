import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/config/url_static.dart';
// import 'package:edamkar_1/models/ArtikelModel.dart';
import 'package:edamkar_1/models/SemuaArtikelBerita.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailArtikelController extends GetxController {
  final dataArg = Get.arguments;

  // final idArtikel = '';
  // final jenisArtikel = '';

  late int _idArt;
  late String _jenisArt;
  RxList<SemuaArtikelModel>? data = <SemuaArtikelModel>[].obs;
  SemuaArtikelModel artikel = SemuaArtikelModel(
      jenisArtikel: "",
      id: 0,
      adminDamkar: '',
      foto: '',
      judul: '',
      deskripsi: '',
      tanggal: '');

  RxBool isDone = false.obs;

  // void getId_Berita(String id) async {
  //   postDetailBerita(id);

  //   // var dataId =
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _jenisArt = dataArg["jenisArtikel"];
    _idArt = dataArg["idArtikel"];

    if (_jenisArt == "Berita") {
      postDetailBerita(_idArt);
    } else if (_jenisArt == "Edukasi") {
      postDetailEdukasi(_idArt);
    } else if (_jenisArt == "Agenda") {
      postDetailAgenda(_idArt);
    } else {
      postDetailBerita(_idArt);
    }

    // print("id berita: " + _idArt.toString());
  }

  postDetailBerita(int id) async {
    var result = await APIClient().getData('getDetailBerita/$id');

    print("id berita$id");
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
      isDone.value = true;
    } else {
      print("Data Kosong");
    }
  }

  postDetailEdukasi(int id) async {
    var result = await APIClient().getData('getDetailEdukasi/$id');

    print("id berita$id");
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
      isDone.value = true;
    } else {
      print("Data Kosong");
    }
  }

  postDetailAgenda(int id) async {
    var result = await APIClient().getData('getDetailAgenda/$id');

    print("id berita$id");
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
      isDone.value = true;
    } else {
      print("Data Kosong");
    }
  }

  DecorationImage imgArtikel(String imgUrl, String condition) {
    if (imgUrl == 'foto/gambar') {
      return const DecorationImage(
          image: AssetImage("semuaAset/gambar/damkar.png"), fit: BoxFit.cover);
    }
    if (condition == 'Berita') {
      return DecorationImage(
          image: NetworkImage("${URLWEBAPI.urlHost}/img-berita/$imgUrl"),
          fit: BoxFit.cover);
    }

    if (condition == 'Edukasi') {
      return DecorationImage(
          image: NetworkImage("${URLWEBAPI.urlHost}/img-edukasi/$imgUrl"),
          fit: BoxFit.cover);
    }

    return const DecorationImage(
        image: AssetImage("semuaAset/gambar/damkar.png"), fit: BoxFit.cover);
  }
}
