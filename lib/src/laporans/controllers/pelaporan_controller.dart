import 'dart:io';
import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
// import 'package:edamkar_1/src/camera/camera.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

class PelaporanController extends GetxController {
  final TextEditingController namaBencanaCon = TextEditingController();
  final TextEditingController noTelpCon = TextEditingController();
  final TextEditingController deskripsiCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var iduser;
  var namaUser = '';
  var dataArgs = Get.arguments;
  String alamat = '';

  Rx<File?> image = Rx<File?>(null);
  String? imageName;
  var imagePath;
  RxBool showSpinner = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    DataUser().getNoHp().then((value) => noTelpCon.text = value);
    DataUser().getUserId().then((value) => iduser = value);
    DataUser().getNama().then((value) => namaUser = value);
    alamat = dataArgs["jalan"] +
        ', ' +
        dataArgs["desa"] +
        ', ' +
        dataArgs["kecamatan"] +
        ', ' +
        dataArgs["kota"] +
        ', ' +
        dataArgs["kodepos"];
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
    // _kirimNotifikasi();
    showSpinner.value = true;
    String title = "${iduser.toString()}_image_${getRandomString(30)}";
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    //eksekuis post kirim photo
    await APIClient().postMulti('addImage', image, imagePath, title);
    var result = await APIClient().postData('addPelaporan', {
      'kategori_laporan_id': dataArgs['idKategori'].toString(),
      'user_listdata_id': iduser.toString(),
      'deskripsi_laporan': deskripsiCon.text,
      'nama_hewan': '-',
      'waktu_pelaporan': '12:00',
      'tgl_pelaporan': date.toString().replaceAll("00:00:00.000", ""),
      'urgensi':
          dataArgs['idKategori'] != 1 ? namaBencanaCon.text : "kebakaran",
      'alamat': alamat,
      'latitude': dataArgs["latitude"].toString(),
      'longitude': dataArgs["longitude"].toString(),
      'bukti_foto_laporan_pengguna': title,
    });
    // _kirimNotifikasi();
    if (result != null) {
      Get.snackbar("Laporan Berhasil dikirim!",
          "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!",
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          colorText: Colors.white);
      // Get.back();
      Get.offAllNamed(Routes.dashboard, arguments: 2);
      // FloatNotif().snackBar(context, "Laporan Berhasil dikirim!",
      //     "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!");
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => const AppMenu()));
    } else {
      // FloatNotif().snackBarFail(context, "Laporan gagal dikirim!",
      //     "Lakukan Emergency Call jika terdapat kenadala");

      Get.snackbar("Laporan gagal dikirim!",
          "Lakukan Emergency Call jika terdapat kenadala");
    }
    showSpinner.value = false;
  }

  Future getImage() async {
    final imagePicked = await _picker.pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      image.value = await drawTextOnImage(imagePicked);
      // image.value = File(imagePicked.path);
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
    String cdate2 = DateFormat("dd, MMMM, yyyy").format(DateTime.now());
    String day = DateFormat("EEEEE").format(DateTime.now());
    img.drawString(decodeImg!,
        "Pelapor : $namaUser \n\nwaktu : $tdata \n\nhari : $day \n\ntanggal : $cdate2 \n\nalamat: $alamat",
        font: img.arial48, x: 40);
    // img.drawString(decodeImg!, arial24, 0, 0, DateTime.now().toString());

    var encodeImage = img.encodeJpg(decodeImg, quality: 100);

    var finalImage = File(xFile.path)..writeAsBytesSync(encodeImage);

    return finalImage;
  }

  // void goToCamera() async {
  //   img = await Get.to(const CameraAdmin());
  //   update();
  // }

  void pushPelaporan() {
    if (formKey.currentState?.validate() == true) {
      pushLaporan();
    }
  }
}
