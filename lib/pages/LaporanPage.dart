import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/pages/buatLaporan.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({Key? key}) : super(key: key);

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}
// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksLaporan = [
  {
    'Header': 'Laporan',
    'judulLaporan': 'Laporan Bencana Alam',
    'deskripsiLaporan': 'Salah satu layanan dari E-Damkar ',
    'namaBencanaHint': 'contoh: Tsunami, Banjir, Kebakaran, dll',
    'noTelp': 'Nomor Telepon',
    'noTelpHint': 'Masukkan nomor telepon aktif',
    'deskripsiBawah':
        'Tidak menemukan kategori yang anda cari? Buat laporan anda sendiri',
    'deskripsiHint':
        '(opsional) Jelaskan secara singkat kejadian yang sedang terjadi',
    'buttonKirim': 'Buat laporan anda',
    'buttonImage': 'Pilih gambar',
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleLaporan = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black87,
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
        color: Colors.black54,
        fontSize: (18),
        fontWeight: FontWeight.w700),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin2': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black54,
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

class _LaporanPageState extends State<LaporanPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (final teks in teksLaporan)
              for (final teksStyle in teksStyleLaporan)
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Text(teks['Header'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: teksStyle['Bold1']),
                  ),
                ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuatLaporan()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/bencana-alam-icon.svg',
                                      width: 50, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16, left: 16),
                                    child: Text(teks['judulLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold1']),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuatLaporan()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/kebakaran-icon.svg',
                                      width: 50, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16, left: 16),
                                    child: Text(teks['judulLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold1']),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuatLaporan()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/hewan-buas-icon.svg',
                                      width: 50, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16, left: 16),
                                    child: Text(teks['judulLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold1']),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuatLaporan()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 28, bottom: 28),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/penyelamatan-icon.svg',
                                      width: 70, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16, left: 16),
                                    child: Text(teks['judulLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold1']),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
            for (final teks in teksLaporan)
              for (final teksStyle in teksStyleLaporan)
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(teks['deskripsiBawah'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: teksStyle['SemiBold1']),
                  ),
                ),
            for (final teks in teksLaporan)
              for (final teksStyle in teksStyleLaporan)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 40),
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: Colors.grey.shade100,
                        highlightColor: Colors.grey.shade200,
                        onTap: () {},
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
      bottomNavigationBar: AppMenu(),
    );
  }
}
