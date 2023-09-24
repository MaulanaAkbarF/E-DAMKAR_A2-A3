import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Text(teks['Header'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: teksStyle['Bold1']),
                  ),
                ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () => Get.toNamed(Routes.mpLap,
                              arguments: "bencanaalam"),
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
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/bencana-alam-icon.svg',
                                      width: 50, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16, left: 16),
                                    child: Text("Laporan Bencana Alam",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.black45,
                                            fontSize:
                                                paddingHorozontal1 / 1.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () =>
                              Get.toNamed(Routes.mpLap, arguments: "kebakaran"),
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
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/kebakaran-icon.svg',
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Text(
                                    "Laporan Kebakaran",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: teksStyle['SemiBold3'],
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(
                                      teks['deskripsiLaporan'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: "font/inter_bold.ttf",
                                          color: Colors.black45,
                                          fontSize: paddingHorozontal1 / 1.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () =>
                              Get.toNamed(Routes.mpLap, arguments: "hewanbuas"),
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
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 24, bottom: 24),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/hewan-buas-icon.svg',
                                      width: 50, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16, left: 16),
                                    child: Text("Laporan Hewan Buas",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.black45,
                                            fontSize:
                                                paddingHorozontal1 / 1.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    for (final teks in teksLaporan)
                      for (final teksStyle in teksStyleLaporan)
                        InkWell(
                          onTap: () => Get.toNamed(Routes.mpLap,
                              arguments: "penyelamatan"),
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
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(253, 232, 232, 1.000),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 28, bottom: 28),
                                    child: SvgPicture.asset(
                                      'semuaAset/gambar/penyelamatan-icon.svg',
                                      width: 70, // ukuran ikon yang diinginkan
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16, left: 16),
                                    child: Text("Laporan Penyelamatan",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: teksStyle['SemiBold3']),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 16, right: 16),
                                    child: Text(teks['deskripsiLaporan'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.black45,
                                            fontSize:
                                                paddingHorozontal1 / 1.5)),
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
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(teks['deskripsiBawah'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: teksStyle['SemiBold1']),
                  ),
                ),
            // for (final teks in teksLaporan)
            //   for (final teksStyle in teksStyleLaporan)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
                child: Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(8),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onPressed: () =>
                        Get.toNamed(Routes.mpLap, arguments: "custom"),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buat Laporan Anda Sendiri',
                          style: TextStyle(
                            // Properti gaya teks
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
