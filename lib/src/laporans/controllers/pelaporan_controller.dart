import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
// import 'package:edamkar_1/src/camera/camera.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/draw_text_image.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';e
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as img;
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
  RxBool onImageLoading = false.obs;

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
      "desa": dataArgs["desa"],
      "jalan": dataArgs["jalan"],
      "kecamatan": dataArgs["kecamatan"],
      "kota": dataArgs["kota"],
      "kodepos": dataArgs["kodepos"],
      "latitude": dataArgs["latitude"].toString(),
      "longitude": dataArgs["longitude"].toString(),
      "namaBencana": namaBencanaCon.text,
      "noTelp": noTelpCon.text.toString(),
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
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    //eksekuis post kirim photo
    if (imagePath == null) {
      Get.snackbar(
          "Gambar bukti Kosong !", "Harus melampirkan bukti penanganan",
          backgroundColor: red1, colorText: white);
      showSpinner.value = false;
    } else {
      await APIClient().postMulti('addImage', image, imagePath, title);
      var result = await APIClient().postData('addPelaporan', {
        'kategori_laporan_id': dataArgs['idKategori'].toString(),
        'user_listdata_id': iduser.toString(),
        'deskripsi_laporan': deskripsiCon.text,
        'nama_hewan': '-',
        'waktu_pelaporan': tdata,
        'tgl_pelaporan': date.toString().replaceAll("00:00:00.000", ""),
        'urgensi':
            dataArgs['idKategori'] != 1 ? namaBencanaCon.text : "kebakaran",
        'alamat': alamat,
        'latitude': dataArgs["latitude"].toString(),
        'longitude': dataArgs["longitude"].toString(),
        'bukti_foto_laporan_pengguna': title,
      });
      _kirimNotifikasi();
      if (result != null) {
        Get.snackbar("Laporan Berhasil dikirim!",
            "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!",
            icon: const Icon(
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
  }

  Future getImage() async {
    onImageLoading.value = true;
    final imagePicked = await _picker.pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      image.value = await drawTextOnImageInIsolate(imagePicked);
      // image.value = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;

      // update();
    } else {
      print('no image selected');
      Get.snackbar("Foto tidak boleh kosong", "Masukan foto bukti penanganan");
    }
    onImageLoading.value = false;
  }

  Future<File> drawTextOnImageInIsolate(XFile xFile) async {
    Completer<File> completer = Completer();

    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(drawTextOnImageInIsolateAll, {
      'xFile': xFile,
      'jalan': dataArgs["jalan"],
      'desa': dataArgs["desa"],
      'kecamatan': dataArgs["kecamatan"],
      'kota': dataArgs["kota"],
      'kodepos': dataArgs["kodepos"],
      'namaAnymCon': namaUser,
      'sendPort': receivePort.sendPort,
    });

    receivePort.listen((message) {
      if (message is File) { 
        completer.complete(message);
      } else {
        completer.completeError('Error occurred in isolate $message');
      }
      receivePort.close();
    });

    return completer.future;
  }

  void pushPelaporan() {
    if (formKey.currentState?.validate() == true) {
      pushLaporan();
    }
  }

  void onUrgenChange(String? newValue) => namaBencanaCon.text = newValue!;

  showDialogListBencanaAlam(context) {
    final List<PopupMenuEntry> menuList = [
      const PopupMenuItem(
        value: 0,
        child: Text("Gempa"),
      ),
      const PopupMenuItem(
        value: 1,
        child: Text("Banjir"),
      ),
      const PopupMenuItem(
        value: 2,
        child: Text("Longsor"),
      ),
    ];
    return PopupMenuButton(
      constraints:
          BoxConstraints.expand(width: SizeConfig.screenWidth, height: 160),
      offset: const Offset(-90, 10),
      itemBuilder: ((context) => menuList),
      icon: const Icon(Icons.arrow_drop_down),
      onSelected: (value) {
        switch (value) {
          case 0:
            namaBencanaCon.text = "Gempa";
            break;
          case 1:
            namaBencanaCon.text = "Banjir";
            break;
          case 2:
            namaBencanaCon.text = "Longsor";
            break;
        }
      },
    );
  }

  showDialogListhewanBuas(context) {
    final List<PopupMenuEntry> menuList = [
      const PopupMenuItem(
        value: 0,
        child: Text("Ular"),
      ),
      const PopupMenuItem(
        value: 1,
        child: Text("Biawak"),
      ),
      const PopupMenuItem(
        value: 2,
        child: Text("Lebah"),
      ),
      const PopupMenuItem(
        value: 3,
        child: Text("Monyet"),
      ),
    ];
    return PopupMenuButton(
      constraints:
          BoxConstraints.expand(width: SizeConfig.screenWidth, height: 200),
      offset: const Offset(-90, 10),
      itemBuilder: ((context) => menuList),
      icon: const Icon(Icons.arrow_drop_down),
      onSelected: (value) {
        switch (value) {
          case 0:
            namaBencanaCon.text = "Ular";
            break;
          case 1:
            namaBencanaCon.text = "Biawak";
            break;
          case 2:
            namaBencanaCon.text = "Lebah";
            break;
          case 3:
            namaBencanaCon.text = "Monyet";
            break;
        }
      },
    );
  }

  showDialogListPenyelamatan(context) {
    final List<PopupMenuEntry> menuList = [
      const PopupMenuItem(
        value: 0,
        child: Text("Evakuasi"),
      ),
      const PopupMenuItem(
        value: 1,
        child: Text("Penyelamatan orang"),
      ),
    ];
    return PopupMenuButton(
      constraints:
          BoxConstraints.expand(width: SizeConfig.screenWidth, height: 160),
      offset: const Offset(-90, 10),
      itemBuilder: ((context) => menuList),
      icon: const Icon(Icons.arrow_drop_down),
      onSelected: (value) {
        switch (value) {
          case 0:
            namaBencanaCon.text = "Evakuasi";
            break;
          case 1:
            namaBencanaCon.text = "Penyelamatan Orang";
            break;
        }
      },
    );
  }
}
