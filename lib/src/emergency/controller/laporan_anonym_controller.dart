import 'dart:io';

import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LaporanAnonymController extends GetxController {
  final namaBencanaCon = TextEditingController();
  final noTelpCon = TextEditingController();
  final deskripsiCon = TextEditingController();
  final iduser = 1;
  var dataArgs = Get.arguments;
  String? desa, jalan, kecamatan, kota, kodepos, latitude, longitude;

  Rx<File?> rxImage = Rx<File?>(null);
  String? imageName;
  var imagePath;
  RxBool showSpinner = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    desa = dataArgs['desa'];
    jalan = dataArgs['jalan'];
    kecamatan = dataArgs['kecamatan'];
    kota = dataArgs['kota'];
    kodepos = dataArgs['kodepos'];
    latitude = dataArgs['latitude'].toString();
    longitude = dataArgs['longitude'].toString();
  }

  void _kirimNotifikasi() async {
    // Ganti dengan URL endpoint API yang sesuai

    // Data yang akan dikirim
    var data = {
      "desa": desa,
      "jalan": jalan,
      "kecamatan": kecamatan,
      "kota": kota,
      "kodepos": kodepos,
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "namaBencana": namaBencanaCon.text,
      "noTelp": noTelpCon.text.toString(),
    };

    // Mengirim data ke server menggunakan metode POST
    var response = await APIClient().postData("sendToWa", data);
    // Menerima dan memproses respons dari server
    if (response != null) {
      // print(jsonDecode(response));
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  void pushLaporan() async {
    showSpinner.value = true;
    String title = iduser.toString() + "_image_" + getRandomString(30);
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String alamat = jalan! +
        ', ' +
        desa! +
        ', ' +
        kecamatan! +
        ', ' +
        kota! +
        ', ' +
        kodepos!;
    await APIClient().postMulti('addImage', rxImage, imagePath, title);
    var result2 = await APIClient().postData('addPelaporan', {
      'kategori_laporan_id': 5,
      'user_listdata_id': 1,
      'deskripsi_laporan': deskripsiCon.text,
      'nama_hewan': '-',
      'waktu_pelaporan': DateTime.now().hour,
      'tgl_pelaporan': date.toString().replaceAll("00:00:00.000", ""),
      'urgensi': namaBencanaCon.text,
      'alamat': alamat,
      'latitude': longitude,
      'bukti_foto_laporan_pengguna': title,
    });
    _kirimNotifikasi();
    if (result2 != null) {
      Get.snackbar("Berhasil",
          "Laporan Darurat yang kamu ajukan akan segera kami tangani",
          backgroundColor: white, colorText: black);
      Get.offAllNamed(Routes.emergency);
    } else {
      Get.snackbar("Gagal", "coba kembali dalam beberapa detik",
          backgroundColor: white, colorText: black);
    }
    showSpinner.value = false;
  }

  // void _onConfirm(context) async {
  //   if (_formKey.currentState?.validate() == true) {
  //     var statusUpload = await _kirimLaporan();
  //     if (statusUpload == true) {
  //       await uploadImage();
  //       _kirimNotifikasi();
  //       final snackBar = SnackBar(
  //         /// need to set following properties for best effect of awesome_snackbar_content
  //         elevation: 0,
  //         padding: EdgeInsets.all(16),
  //         behavior: SnackBarBehavior.fixed,
  //         backgroundColor: Colors.transparent,
  //         content: AwesomeSnackbarContent(
  //           title: 'Laporan berhasil terkirim!',
  //           message:
  //               'Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!',

  //           /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //           contentType: ContentType.success,
  //         ),
  //       );

  //       ScaffoldMessenger.of(context)
  //         ..hideCurrentSnackBar()
  //         ..showSnackBar(snackBar);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => LaporanPage()),
  //       );
  //     }
  //   }
  // }

  Future getImage() async {
    final imagePicked = await _picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      rxImage.value = File(imagePicked.path);
      rxImage.value = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;
      update();
    } else {
      print('no image selected');
    }
  }

  // Future<void> uploadImage() async {
  //   setState(() {
  //     showSpinner = true;
  //   });

  //   var stream = new http.ByteStream(image!.openRead());
  //   stream.cast();
  //   var length = await image!.length();
  //   var uri = Uri.parse(
  //       "https://api.imgbb.com/1/upload?key=04b75a4aa8a6e4e3c7d0eb6236f1eae4");
  //   final request = http.MultipartRequest('POST', uri);
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'image',
  //       imagePath,
  //     ),
  //   );
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.statusCode);
  //   }
  // }
}
