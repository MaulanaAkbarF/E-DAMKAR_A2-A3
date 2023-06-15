import 'dart:io';

import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PelaporanController extends GetxController {
  final TextEditingController namaBencanaCon = TextEditingController();
  final TextEditingController noTelpCon = TextEditingController();
  final TextEditingController deskripsiCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var iduser;
  var dataArgs = Get.arguments;

  File? image;
  String? imageName;
  var imagePath;
  bool showSpinner = false;
  final ImagePicker _picker = ImagePicker();

  // @override
  // void initState() {
  //   super.initState();
  //   DataUser().getNoHp().then((value) => noTelpCon.text = value);
  //   DataUser().getUserId().then((value) => iduser = value);
  // }

  @override
  void onInit() {
    super.onInit();

    DataUser().getNoHp().then((value) => noTelpCon.text = value);
    DataUser().getUserId().then((value) => iduser = value);
  }

  void _kirimNotifikasi() async {
    // Ganti dengan URL endpoint API yang sesuai

    // Data yang akan dikirim
    var data = {
      // "desa": widget.desa,
      // "jalan": widget.jalan,
      // "kecamatan": widget.kecamatan,
      // "kota": widget.kota,
      // "kodepos": widget.kodepos,
      // "latitude": widget.latitude.toString(),
      // "longitude": widget.longitude.toString(),
      // "namaBencana": namaBencanaCon.text,
      // "noTelp": noTelpCon.text.toString(),
    };

    // Mengirim data ke server menggunakan metode POST
    var response = await APIClient().postData("sendToWa", data);
    // Menerima dan memproses respons dari server
    if (response != null) {
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  void pushLaporan() async {
    _kirimNotifikasi();
    showSpinner = true;
    String title = iduser.toString() + "_image_" + getRandomString(30);
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String alamat = dataArgs["jalan"] +
        ', ' +
        dataArgs["desa"] +
        ', ' +
        dataArgs["kecamatan"] +
        ', ' +
        dataArgs["kota"] +
        ', ' +
        dataArgs["kodepos"];

    //eksekuis post kirim photo
    await APIClient().postMulti('addImage', image, imagePath, title);
    var result2 = await APIClient().postData('addPelaporan', {
      'user_listdata_id': iduser.toString(),
      'kategori_laporan_id': '2',
      'tgl_lap': date.toString().replaceAll("00:00:00.000", ""),
      'deskripsi_laporan': deskripsiCon.text,
      'gambar_bukti_pelaporan': title,
      'alamat_kejadian': alamat,
      'latitude': dataArgs["latitude"],
      'longitude': dataArgs["longitude"],
      'urgensi': namaBencanaCon.text
    });
    _kirimNotifikasi();
    if (result2 != null) {
      // FloatNotif().snackBar(context, "Laporan Berhasil dikirim!",
      //     "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!");
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => const AppMenu()));
    } else {
      // FloatNotif().snackBarFail(context, "Laporan gagal dikirim!",
      //     "Lakukan Emergency Call jika terdapat kenadala");
    }
  }

  Future getImage() async {
    final imagePicked = await _picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      image = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;
      update();
    } else {
      print('no image selected');
    }
  }
}
