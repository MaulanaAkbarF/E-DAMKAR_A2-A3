import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LokasiKejadian extends StatefulWidget {
  const LokasiKejadian({Key? key}) : super(key: key);

  @override
  State<LokasiKejadian> createState() => _LokasiKejadianState();
}

final List<Map> teksLokasiKejadian = [
  {
    'Header': 'Kirimkan laporan anda!',
    'SubHeader': 'Pastikan data yang anda masukkan sudah benar',
    'namaKecamatan': 'Kecamatan',
    'NamaKecamatanHint': 'Masukkan lokasi kecamatan',
    'namaDesa': 'Desa',
    'namaDesaHint': 'Masukkan lokasi desa',
    'namaJalan': 'Nama jalan',
    'namaJalanHint':
        '(opsional) Jelaskan secara singkat kejadian yang sedang terjadi',
    'buttonKirim': 'Kirim'
  }
].cast<Map<String, String>>();

final List<Map> teksStyleLokasiKejadian = [
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

class _LokasiKejadianState extends State<LokasiKejadian> {
  final TextEditingController kecamatanCon = TextEditingController();
  final TextEditingController desaCon = TextEditingController();
  final TextEditingController jalanCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                for (final teks in teksLokasiKejadian)
                  for (final teksStyle in teksStyleLokasiKejadian)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Text(
                                teks['Header'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Bold1'],
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(teks['Subheader'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: teksStyle['Semibold1']),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 32),
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.2)),
                                    child: TextFormField(
                                      controller: kecamatanCon,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Kecamatan tidak boleh kosong';
                                        }
                                      },
                                      cursorColor: Colors.black,
                                      style: teksStyle['Semibold1'],
                                      decoration: InputDecoration(
                                          hintText: teks['namaKecamatan'],
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 13, 10, 7),
                                          border: InputBorder.none),
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(
                                  teks['namaDesa'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Thin1'],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
