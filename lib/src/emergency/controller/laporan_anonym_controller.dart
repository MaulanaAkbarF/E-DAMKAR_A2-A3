import 'dart:io';

import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class LaporanAnonymController extends GetxController {
  final namaBencanaCon = TextEditingController();
  final noTelpCon = TextEditingController();
  final deskripsiCon = TextEditingController();
  final iduser = 1;
  String? desa, jalan, kecamatan, kota, kodepos, latitude, longitude;

  LaporanAnonymController(
      {this.desa,
      this.jalan,
      this.kota,
      this.kodepos,
      this.latitude,
      this.longitude});

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
    await APIClient().postMulti('addImage', image, imagePath, title);
    var result2 = await APIClient().postData('addPelaporan', {
      'user_listdata_id': "1",
      'kategori_laporan_id': '5',
      'tgl_lap': date.toString().replaceAll("00:00:00.000", ""),
      'deskripsi_laporan': deskripsiCon.text,
      'gambar_bukti_pelaporan': title,
      'alamat_kejadian': alamat,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'urgensi': namaBencanaCon.text
    });
    _kirimNotifikasi();
    if (result2 != null) {
      // FloatNotif().snackBar(context, "Laporan Berhasil dikirim!",
      //     "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!");
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => const EmergencyCall()));
    } else {
      // FloatNotif().snackBarFail(context, "Laporan gagal dikirim!",
      //     "Lakukan Emergency Call jika terdapat kenadala");
    }
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
  Rx<File?> rxImage = Rx<File?>(null);
  File? image;
  String? imageName;
  var imagePath;
  bool showSpinner = false;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final imagePicked = await _picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      rxImage.value = File(imagePicked.path);
      image = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;
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
