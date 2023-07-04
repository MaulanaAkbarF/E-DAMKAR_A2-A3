import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/laporans/LaporanPage.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'LokasiKejadian.dart';

class LaporanBencanaAlam extends StatefulWidget {
  // const BuatLaporan({Key? key}) : super(key: key);

  String desa, jalan, kecamatan, kota, kodepos;
  double latitude, longitude;
  LaporanBencanaAlam(
      {Key? key,
      required this.desa,
      required this.jalan,
      required this.kecamatan,
      required this.kota,
      required this.kodepos,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  State<LaporanBencanaAlam> createState() => _LaporanBencanaAlamState();
}
// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksSignUp = [
  {
    'Header': 'Kirimkan laporan anda!',
    'SubHeader': 'Pastikan data yang anda masukkan sudah benar',
    'namaBencana': 'Nama Bencana',
    'namaBencanaHint': 'contoh: Tsunami, Banjir, Tanah Longsor, dll',
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

class _LaporanBencanaAlamState extends State<LaporanBencanaAlam> {
  final TextEditingController namaBencanaCon = TextEditingController();
  final TextEditingController noTelpCon = TextEditingController();
  final TextEditingController deskripsiCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var iduser;

  @override
  void initState() {
    super.initState();
    DataUser().getNoHp().then((value) => noTelpCon.text = value);
    DataUser().getUserId().then((value) => iduser = value);
  }

  void _kirimNotifikasi() async {
    // Ganti dengan URL endpoint API yang sesuai
var url = Uri.parse(APIClient
        .whatsappnotification);
    // Data yang akan dikirim
    var data = {
      "desa": widget.desa,
      "jalan": widget.jalan,
      "kecamatan": widget.kecamatan,
      "kota": widget.kota,
      "kodepos": widget.kodepos,
      "latitude": widget.latitude.toString(),
      "longitude": widget.longitude.toString(),
      "namaBencana": namaBencanaCon.text,
      "noTelp": noTelpCon.text.toString(),
    };

    // Mengirim data ke server menggunakan metode POST
    var response2 = await http.post(url, body: data);
    // var response = await APIClient().postData("sendToWa", data);
    // Menerima dan memproses respons dari server
    if (response2.statusCode == "200") {
      var responseData = json.decode(response2.body);
      print('Respon dari server: $responseData');
    } else {
      print('Gagal mengirim data. Kode status: ${response2.statusCode}');
    }
  }

  void pushLaporan() async {
    _kirimNotifikasi();
    setState(() {
      showSpinner = true;
    });
    String title = iduser.toString() + "_image_" + getRandomString(30);
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String alamat = widget.jalan +
        ', ' +
        widget.desa +
        ', ' +
        widget.kecamatan +
        ', ' +
        widget.kota +
        ', ' +
        widget.kodepos;
    var result =
        await APIClient().postMulti('addImage', image, imagePath, title);
    var result2 = await APIClient().postData('addPelaporan', {
      'user_listdata_id': iduser.toString(),
      'kategori_laporan_id': '2',
      'tgl_lap': date.toString().replaceAll("00:00:00.000", ""),
      'deskripsi_laporan': deskripsiCon.text,
      'gambar_bukti_pelaporan': title,
      'alamat_kejadian': alamat,
      'latitude': widget.latitude.toString(),
      'longitude': widget.longitude.toString(),
      'urgensi': namaBencanaCon.text
    });
    _kirimNotifikasi();
    if (result2 != null) {
      FloatNotif().snackBar(context, "Laporan Berhasil dikirim!",
          "Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const AppMenu()));
    } else {
      FloatNotif().snackBarFail(context, "Laporan gagal dikirim!",
          "Lakukan Emergency Call jika terdapat kenadala");
    }
  }

  File? image;
  String? imageName;
  var imagePath;
  bool showSpinner = false;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final imagePicked = await _picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      image = File(imagePicked.path);
      imageName = imagePicked.name;
      imagePath = imagePicked.path;
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                key: _formKey,
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
                                  // Text('Name: ${widget.kecamatan}'),
                                  // Text('Name: ${widget.desa}'),
                                  // Text('Name: ${widget.jalan}'),
                                  // Text('Name: ${widget.kota}'),
                                  // Text('Name: ${widget.latitude}'),
                                  // Text('Name: ${widget.longitude}'),
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
                                          onTap: () async {
                                            await getImage();
                                          },
                                          child: Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1.2,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                if (image != null)
                                                  Positioned.fill(
                                                    child: Image.file(
                                                      image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (image == null)
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(Icons.image,
                                                            color: Colors
                                                                .grey.shade400,
                                                            size: 24),
                                                        SizedBox(width: 8),
                                                        Text(
                                                            'Pilih Photo Bukti Kejadian',
                                                            style: teksStyle[
                                                                'Thin3']),
                                                      ],
                                                    ),
                                                  ),
                                              ],
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
                                        child: TextFormField(
                                          controller: namaBencanaCon,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Urgensi tidak boleh kosong';
                                            }
                                          },
                                          cursorColor: Colors.black,
                                          style: teksStyle['SemiBold1'],
                                          decoration: InputDecoration(
                                              hintText: teks['namaBencanaHint'],
                                              prefixIcon:
                                                  Icon(Icons.fire_truck),
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
                                          controller: noTelpCon,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Nomor Telepon tidak boleh kosong';
                                            }
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
                                          controller: deskripsiCon,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Deskripsi tidak boleh kosong';
                                            }
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
                                          onTap: () {
                                            if (_formKey.currentState
                                                    ?.validate() ==
                                                true) {
                                              pushLaporan();
                                            }
                                          },
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
            )));
  }
}
