import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../controllers/pelaporan_controller.dart';

// class LaporanPenyelamatan extends StatefulWidget {
//   // const BuatLaporan({Key? key}) : super(key: key);

//   String desa, jalan, kecamatan, kota, kodepos;
//   double latitude, longitude;
//   LaporanPenyelamatan(
//       {Key? key,
//       required this.desa,
//       required this.jalan,
//       required this.kecamatan,
//       required this.kota,
//       required this.kodepos,
//       required this.latitude,
//       required this.longitude})
//       : super(key: key);

//   @override
//   State<LaporanPenyelamatan> createState() => _LaporanPenyelamatanState();
// }
// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksSignUp = [
  {
    'Header': 'Kirimkan laporan anda!',
    'SubHeader': 'Pastikan data yang anda masukkan sudah benar',
    'namaBencana': 'Urgensi Penyelamatan',
    'namaBencanaHint':
        'Contoh: Orang jatuh di sumur, orang terjebak di lift, dll',
    'noTelp': 'Nomor Telepon',
    'noTelpHint': 'Masukkan nomor telepon aktif',
    'deskripsi': 'Deskripsi Laporan',
    'deskripsiHint':
        '(opsional) Jelaskan secara singkat kejadian yang sedang terjadi',
    'buttonKirim': 'Kirim',
    'buttonImage': 'Pilih gambar',
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleSignUp = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black,
        fontSize: (32),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: Colors.black45,
        fontSize: (16)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.blueAccent,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'SemiBold3': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.black45,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin2': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w600),
    'Thin3': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.grey,
        fontSize: (18),
        fontWeight: FontWeight.w600)
  }
];

// ------------------------------------------------------------------------------------------------------------------------------------------

class LaporanPenyelamatan extends GetView<PelaporanController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
              centerTitle: false,
              title: const Text(
                "Buat Laporan Anda",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "font/inter_bold.ttf",
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      for (final teks in teksSignUp)
                        for (final teksStyle in teksStyleSignUp)
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(teks['SubHeader'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: teksStyle['SemiBold1']),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 32),
                                      child: Material(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () => controller.getImage(),
                                          child: Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1.2,
                                              ),
                                            ),
                                            child: Obx(
                                              () => controller
                                                      .onImageLoading.value
                                                  ? Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text("Loading...",
                                                          style: teksStyle[
                                                              'Thin3']))
                                                  : controller.image.value !=
                                                          null
                                                      ? Image.file(
                                                          controller
                                                              .image.value!,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(Icons.image,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400,
                                                                  size: 24),
                                                              SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                  'Pilih Photo Bukti Kejadian',
                                                                  style: teksStyle[
                                                                      'Thin3']),
                                                            ],
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 24),
                                      child: Text(teks['namaBencana'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: teksStyle['Thin1']),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 1.2)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 6,
                                                child: TextFormField(
                                                  controller:
                                                      controller.namaBencanaCon,
                                                  cursorColor: Colors.black,
                                                  style: teksStyle['SemiBold1'],
                                                  decoration: InputDecoration(
                                                      hintText: teks[
                                                          'namaBencanaHint'],
                                                      prefixIcon: Icon(
                                                          Icons.fire_truck),
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 13, 10, 7),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: controller
                                                    .showDialogListPenyelamatan(
                                                        context),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Text(teks['noTelp'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: teksStyle['Thin1']),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1.2)),
                                        child: TextFormField(
                                          controller: controller.noTelpCon,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              Get.snackbar("Kosong",
                                                  "Nomor telepon tidak boleh kosong !");
                                              return 'Nomor Telepon tidak boleh kosong';
                                            }
                                            return null;
                                          },
                                          cursorColor: Colors.black,
                                          style: teksStyle['SemiBold1'],
                                          decoration: InputDecoration(
                                              hintText: teks['noTelpHint'],
                                              prefixIcon: Icon(Icons.phone),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 13, 10, 7),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Text(teks['deskripsi'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: teksStyle['Thin1']),
                                    ),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1.2)),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 6,
                                          controller: controller.deskripsiCon,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              Get.snackbar("Kosong",
                                                  "Deskripsi tidak boleh kosong !");
                                              return 'Deskripsi tidak boleh kosong';
                                            }
                                            return null;
                                          },
                                          cursorColor: Colors.black,
                                          style: teksStyle['SemiBold1'],
                                          decoration: InputDecoration(
                                              hintText: teks['deskripsiHint'],
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 13, 10, 7),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Material(
                                        color: Colors.red.shade400,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          splashColor: Colors.red.shade700,
                                          highlightColor: Colors.red.shade900,
                                          onTap: () =>
                                              controller.pushPelaporan(),
                                          child: Container(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(teks['buttonKirim'],
                                                    style: teksStyle['Thin2']),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text(imagePath ?? 'No image selected'),
                                ],
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ))));
  }
}
