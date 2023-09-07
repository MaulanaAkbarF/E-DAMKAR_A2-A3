import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LokasiKejadian extends StatefulWidget {
  final String kategori;
  const LokasiKejadian({Key? key, required this.kategori}) : super(key: key);

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
    'buttonKirim': 'Selanjutnya'
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
        height: 1.4,
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
  final TextEditingController kodePosCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String kategori;
  void initState() {
    super.initState();
    kategori = widget.kategori;
    print('lategori : ' + kategori.toString());
  }

  // void kirimButtonPressed(BuildContext context) {
  //   if (_formKey.currentState?.validate() == true) {
  //     if (kategori == "bencanaalam") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => LaporanBencanaAlam(
  //                   kecamatan: kecamatanCon.text,
  //                   desa: desaCon.text,
  //                   jalan: jalanCon.text,
  //                   kota: 'Nganjuk',
  //                   kodepos: '',
  //                   latitude: 0.0,
  //                   longitude: 0.0,
  //                 )),
  //       );
  //     } else if (kategori == "kebakaran") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => LaporanKebakaran(
  //                   kecamatan: kecamatanCon.text,
  //                   desa: desaCon.text,
  //                   jalan: jalanCon.text,
  //                   kota: 'Nganjuk',
  //                   kodepos: '',
  //                   latitude: 0.0,
  //                   longitude: 0.0,
  //                 )),
  //       );
  //     } else if (kategori == "hewanbuas") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => LaporanHewanBuas(
  //                   kecamatan: kecamatanCon.text,
  //                   desa: desaCon.text,
  //                   jalan: jalanCon.text,
  //                   kota: 'Nganjuk',
  //                   kodepos: '',
  //                   latitude: 0.0,
  //                   longitude: 0.0,
  //                 )),
  //       );
  //     } else if (kategori == "penyelamatan") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => LaporanPenyelamatan(
  //                   kecamatan: kecamatanCon.text,
  //                   desa: desaCon.text,
  //                   jalan: jalanCon.text,
  //                   kota: 'Nganjuk',
  //                   kodepos: '',
  //                   latitude: 0.0,
  //                   longitude: 0.0,
  //                 )),
  //       );
  //     } else if (kategori == "custom") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => LaporanCustom(
  //                   kecamatan: kecamatanCon.text,
  //                   desa: desaCon.text,
  //                   jalan: jalanCon.text,
  //                   kota: 'Nganjuk',
  //                   kodepos: '',
  //                   latitude: 0.0,
  //                   longitude: 0.0,
  //                 )),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tentukan Lokasi Kejadian" + kategori.toString(),
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
                for (final teks in teksLokasiKejadian)
                  for (final teksStyle in teksStyleLokasiKejadian)
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
                                        return 'Alamat kecamatan tidak boleh kosong';
                                      }
                                      return null;
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
                                        return 'Alamat Desa tidak boleh kosong';
                                      }
                                      return null;
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
                                        return 'Alamat Jalan tidak boleh kosong';
                                      }
                                      return null;
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
                              alignment: FractionalOffset.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Kode Pos',
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
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLines: 1,
                                    controller: kodePosCon,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Kode pos tidak boleh kosong';
                                      } else if (value.length != 5) {
                                        return 'Kode pos harus berisikan 5 digit';
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.black,
                                    style: teksStyle['Semibold1'],
                                    decoration: InputDecoration(
                                        hintText: 'Contoh : 64119',
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
                                    onTap: () {
                                      //     Get.toNamed(Routes.lpKebakaran, arguments: {
                                      //   'idKategori': 1,
                                      //   'kategori': 'Kebakaran',
                                      //   'jalan': jalanCon.text,
                                      //   'desa': desaCon.text,
                                      //   'kecamatan': kecamatanCon.text,
                                      //   'kota' : '',
                                      //   'kodepos' : '',
                                      //   'latitude' : 1,
                                      //   'longitude' : 1
                                      // }),
                                      var data = {
                                        'idKategori': 0,
                                        'kategori': '',
                                        'jalan': jalanCon.text,
                                        'desa': desaCon.text,
                                        'kecamatan': kecamatanCon.text,
                                        'kota': 'Nganjuk',
                                        'kodepos': kodePosCon.text,
                                        'latitude': 1,
                                        'longitude': 1,
                                      };
                                      if (jalanCon.text.isEmpty ||
                                          kecamatanCon.text.isEmpty ||
                                          desaCon.text.isEmpty ||
                                          kodePosCon.text.isEmpty) {
                                        // Tampilkan notifikasi "Pilih alamat"
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   SnackBar(
                                        //       content: Text(
                                        //     "Tentukan alamat terlebih dahulu",
                                        //     textAlign: TextAlign.center,
                                        //   )),
                                        // );

                                        //tampilan notifikasi dengan getx
                                        Get.snackbar('Alamat kosong',
                                            "Tentukan alamat terlebih dahulu",
                                            backgroundColor: black3,
                                            colorText: white);
                                      } else if (kodePosCon.text.length != 5) {
                                        Get.snackbar('Digit salah',
                                            "Kode pos harus berisikan 5 digit",
                                            backgroundColor: black3,
                                            colorText: white);
                                      } else {
                                        if (kategori == "bencanaalam") {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         LaporanBencanaAl(
                                          //       jalan: jalan,
                                          //       desa: desa,
                                          //       kecamatan: kecamatan,
                                          //       kota: kota,
                                          //       kodepos: kodepos,
                                          //       latitude: latitude,
                                          //       longitude: longitude,
                                          //     ),
                                          //   ),
                                          // );
                                          data['idKategori'] = 2;
                                          data['kategori'] = kategori;
                                          Get.toNamed(Routes.lpBencanaAlam,
                                              arguments: data);
                                        } else if (kategori == "kebakaran") {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => LaporanKebakaran(
                                          //       jalan: jalan,
                                          //       desa: desa,
                                          //       kecamatan: kecamatan,
                                          //       kota: kota,
                                          //       kodepos: kodepos,
                                          //       latitude: latitude,
                                          //       longitude: longitude,
                                          //     ),
                                          //   ),
                                          // );

                                          data['idKategori'] = 1;
                                          data['kategori'] = kategori;
                                          Get.toNamed(Routes.lpKebakaran,
                                              arguments: data);
                                        } else if (kategori == "hewanbuas") {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => LaporanHewanBuas(
                                          //       jalan: jalan,
                                          //       desa: desa,
                                          //       kecamatan: kecamatan,
                                          //       kota: kota,
                                          //       kodepos: kodepos,
                                          //       latitude: latitude,
                                          //       longitude: longitude,
                                          //     ),
                                          //   ),
                                          // );

                                          data['idKategori'] = 4;
                                          data['kategori'] = kategori;
                                          Get.toNamed(Routes.lpHewanBuas,
                                              arguments: data);
                                        } else if (kategori == "penyelamatan") {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => LaporanPenyelamatan(
                                          //       jalan: jalan,
                                          //       desa: desa,
                                          //       kecamatan: kecamatan,
                                          //       kota: kota,
                                          //       kodepos: kodepos,
                                          //       latitude: latitude,
                                          //       longitude: longitude,
                                          //     ),
                                          //   ),
                                          // );

                                          data['idKategori'] = 3;
                                          data['kategori'] = kategori;
                                          Get.toNamed(Routes.lpPenyelamatan,
                                              arguments: data);
                                        } else if (kategori == "custom") {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => LaporanCustom(
                                          //       jalan: jalan,
                                          //       desa: desa,
                                          //       kecamatan: kecamatan,
                                          //       kota: kota,
                                          //       kodepos: kodepos,
                                          //       latitude: latitude,
                                          //       longitude: longitude,
                                          //     ),
                                          //   ),
                                          // );

                                          data['idKategori'] = 5;
                                          data['kategori'] = kategori;
                                          Get.toNamed(Routes.lpCustom,
                                              arguments: data);
                                        }
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
