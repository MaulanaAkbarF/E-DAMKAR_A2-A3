import 'package:edamkar_1/pages/buatLaporan.dart';
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
    'Header': 'Tentukan Lokasi Kejadian!',
    'SubHeader':
        'Jangan khawatir! kami tidak akan berbagi dengan siapapun tentang informasi pribadimu',
    'namaKecamatan': 'Kecamatan',
    'namaKecamatanHint': 'Masukkan lokasi kecamatan',
    'namaDesa': 'Desa',
    'namaDesaHint': 'Masukkan lokasi desa',
    'namaJalan': 'Nama jalan',
    'namaJalanHint': 'Alamat jalan kejadian',
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

class MyClass {
  String namaKecamatan = 'Hello world!';
}

class _LokasiKejadianState extends State<LokasiKejadian> {
  final TextEditingController kecamatanCon = TextEditingController();
  final TextEditingController desaCon = TextEditingController();
  final TextEditingController jalanCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _kirimButtonPressed(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BuatLaporan()),
      );
    }
  }

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
                                child: Text(teks['SubHeader'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: teksStyle['SemiBold1']),
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(teks['namaKecamatan'],
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
                                    style: teksStyle['SemiBold1'],
                                    decoration: InputDecoration(
                                        hintText: teks['namaKecamatanHint'],
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(teks['namaDesa'],
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
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1.2)),
                                  child: TextFormField(
                                    controller: desaCon,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Desa tidak boleh kosong';
                                      }
                                    },
                                    cursorColor: Colors.black,
                                    style: teksStyle['SemiBold1'],
                                    decoration: InputDecoration(
                                        hintText: teks['namaDesaHint'],
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(teks['namaJalan'],
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
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1.2)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    controller: jalanCon,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Jalan tidak boleh kosong';
                                      }
                                    },
                                    cursorColor: Colors.black,
                                    style: teksStyle['Semibold1'],
                                    decoration: InputDecoration(
                                        hintText: teks['namaJalanHint'],
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    splashColor: Colors.red.shade700,
                                    highlightColor: Colors.red.shade900,
                                    onTap: () => _kirimButtonPressed(context),
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
