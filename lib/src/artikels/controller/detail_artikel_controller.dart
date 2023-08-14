import 'package:edamkar_1/config/api_client.dart';
// import 'package:edamkar_1/models/ArtikelModel.dart';
import 'package:edamkar_1/models/SemuaArtikelBerita.dart';
import 'package:get/get.dart';

class DetailArtikelController extends GetxController {
  final dataArg = Get.arguments;

  // final idArtikel = '';
  // final jenisArtikel = '';

  late int _idArt;
  late String _jenisArt;
  RxList<SemuaArtikelModel>? data = <SemuaArtikelModel>[].obs;

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
    var result = await APIClient().getData('getDetailBerita/' + id.toString());

    print("id berita" + id.toString());
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
    } else {
      print("Data Kosong");
    }
  }

  postDetailEdukasi(int id) async {
    var result = await APIClient().getData('getDetailEdukasi/' + id.toString());

    print("id berita" + id.toString());
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
    } else {
      print("Data Kosong");
    }
  }

  postDetailAgenda(int id) async {
    var result = await APIClient().getData('getDetailAgenda/' + id.toString());

    print("id berita" + id.toString());
    if (result != null) {
      // setState(() {
      data?.value = semuaArtikelModelFromJson(result);
      // });
    } else {
      print("Data Kosong");
    }
  }
}
