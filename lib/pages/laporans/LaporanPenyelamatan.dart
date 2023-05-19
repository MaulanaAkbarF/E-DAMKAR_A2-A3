import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/pages/laporans/LaporanPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LaporanPenyelamatan extends StatefulWidget {
  // const BuatLaporan({Key? key}) : super(key: key);

  String desa, jalan, kecamatan, kota, kodepos;
  double latitude, longitude;
  LaporanPenyelamatan(
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
  State<LaporanPenyelamatan> createState() => _LaporanPenyelamatanState();
}
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

class _LaporanPenyelamatanState extends State<LaporanPenyelamatan> {
  final TextEditingController namaBencanaCon = TextEditingController();
  final TextEditingController noTelpCon = TextEditingController();
  final TextEditingController deskripsiCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DataUser().getNoHp().then((value) => noTelpCon.text = value);
  }

  void _kirimNotifikasi() async {
    var url = Uri.parse(APIClient
        .whatsappnotification); // Ganti dengan URL endpoint API yang sesuai

    // Data yang akan dikirim
    var data = {
      "desa": widget.desa,
      "jalan": widget.jalan,
      "kecamatan": widget.kecamatan,
      "kota": widget.kota,
      "kodepos": widget.kodepos,
      "latitude": widget.latitude.toString(),
      "longitude": widget.longitude.toString(),
      "noTelp": noTelpCon.text.toString(),
      "namaBencana": namaBencanaCon.text,
    };

    // Mengirim data ke server menggunakan metode POST
    var response = await http.post(url, body: data);

    // Menerima dan memproses respons dari server
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  Future<bool> _kirimLaporan() async {
    var res = await http.post(
      Uri.parse(APIClient.submit),
      body: {
        "gambar": imageName,
        "namaBencana": namaBencanaCon.text,
        "noTelp": noTelpCon.text,
        "deskripsi": deskripsiCon.text,
        "kecamatan": widget.kecamatan,
        "desa": widget.desa,
        "jalan": widget.jalan,
      },
    );
    var resp = res.body;
    Map<String, dynamic> status = jsonDecode(resp);
    bool statusKirim = status["success"];
    if (statusKirim == true) {
      return true;
    }
    return false;
  }

  void _onConfirm(context) async {
    if (_formKey.currentState?.validate() == true) {
      var statusUpload = await _kirimLaporan();
      if (statusUpload == true) {
        await uploadImage();
        _kirimNotifikasi();
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          padding: EdgeInsets.all(16),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Laporan berhasil terkirim!',
            message:
                'Laporan Anda akan segera kami tangani, lihat status untuk melihat kemajuan!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LaporanPage()),
        );
      }
    }
  }

  void show(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black);
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

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse(
        "https://api.imgbb.com/1/upload?key=04b75a4aa8a6e4e3c7d0eb6236f1eae4");
    final request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imagePath,
      ),
    );
    final response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.statusCode);
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
                                                    width: 1.2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: image != null
                                                      ? Container(
                                                          child: Image.file(
                                                            image!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : Container(),
                                                ),
                                                // Text(teks['buttonImage'],
                                                //     overflow: TextOverflow.ellipsis,
                                                //     style: teksStyle['Thin3']),
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
                                              return 'Nama tidak boleh kosong';
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
                                              return 'Nama tidak boleh kosong';
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
                                              return 'Email tidak boleh kosong';
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
                                            _onConfirm(context);
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
