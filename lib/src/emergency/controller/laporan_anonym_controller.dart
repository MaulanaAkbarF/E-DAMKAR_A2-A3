import 'dart:io';

import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

class LaporanAnonymController extends GetxController {
  final namaBencanaCon = TextEditingController();
  final noTelpCon = TextEditingController();
  final deskripsiCon = TextEditingController();
  final namaAnymCon = TextEditingController();
  final nikAnymCon = TextEditingController();
  final umurAnymCon = TextEditingController();
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
    String title = "${iduser}_image_${getRandomString(30)}";
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    String alamat = "${jalan!}, ${desa!}, ${kecamatan!}, ${kota!}, ${kodepos!}";

    if (imagePath == null) {
      Get.snackbar("Gambar bukti Kosong !", "Harus melampirkan bukti kejadian",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else if (namaBencanaCon == "" || namaBencanaCon.text.isEmpty) {
      Get.snackbar("Urgensi Kosong !", "Harap isikan urgensi",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else if (noTelpCon == "" || noTelpCon.text.isEmpty) {
      Get.snackbar("Nomor telepon Kosong !", "Harap isikan nomor telepon anda",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else if (noTelpCon.text.length < 9 || noTelpCon.text.length > 14) {
      Get.snackbar("Input nomor telepon salah!",
          "Input No.Telp harus lebih dari 9 dan kurang dari 14",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else if (deskripsiCon == "" || deskripsiCon.text.isEmpty) {
      Get.snackbar("Deskripsi Kosong !", "Harap isikan deskripsi laporan anda",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else {
      await APIClient().postMulti('addImage', rxImage, imagePath, title);
      var result2 = await APIClient().postData('addPelaporan', {
        'kategori_laporan_id': "1",
        'user_listdata_id': "1",
        'deskripsi_laporan': deskripsiCon.text,
        'nama_hewan': '-',
        'waktu_pelaporan': tdata,
        'tgl_pelaporan': date.toString().replaceAll("00:00:00.000", ""),
        'urgensi': namaBencanaCon.text,
        'alamat': alamat,
        'latitude': latitude,
        'longitude': longitude,
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
    final imagePicked = await _picker.pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      rxImage.value = await drawTextOnImage(imagePicked);
      // rxImage.value = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;
      update();
    } else {
      print('no image selected');
    }
  }

  Future<File> drawTextOnImage(XFile xFile) async {
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);

    var decodeImg = img.decodeImage(File(xFile.path).readAsBytesSync());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    String cdate2 = DateFormat("dd-MMMM-yyyy").format(DateTime.now());
    String day = DateFormat("EEEEE").format(DateTime.now());
    String alamat = "${jalan!}, ${desa!}, ${kecamatan!}, ${kota!}, ${kodepos!}";
    img.drawString(decodeImg!,
        "Pelapor : ${namaAnymCon.text} \n\nwaktu : $tdata \n\nhari : $day \n\ntanggal : $cdate2 \n\nalamat: $alamat",
        font: img.arial48, x: 40);
    // img.drawString(decodeImg!, arial24, 0, 0, DateTime.now().toString());

    var encodeImage = img.encodeJpg(decodeImg, quality: 100);

    var finalImage = File(xFile.path)..writeAsBytesSync(encodeImage);

    return finalImage;
  }

  goToLaporanAnonymView() =>
      checkFieldFPage() ? Get.toNamed(Routes.emePelaporan) : none();

  bool checkFieldFPage() {
    if (namaAnymCon.text.length < 5 || namaAnymCon.text.length > 30) {
      Get.snackbar(
          "Gagal", "Tolong isi nama harus lebih dari 5 dan kurang dari 30",
          backgroundColor: white, colorText: black);
      return false;
    }
    
    if (umurAnymCon.text.isEmpty || umurAnymCon.text.length > 2) {
      Get.snackbar("Gagal", "Digit umur tidak sesuai",
          backgroundColor: white, colorText: black);
      return false;
    }

    return true;
  }

  void none() {}
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
