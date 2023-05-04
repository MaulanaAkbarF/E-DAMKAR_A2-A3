import 'package:edamkar_1/pages/LokasiKejadian.dart';
import 'package:edamkar_1/pages/current_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MapsLokasiKejadian extends StatefulWidget {
  const MapsLokasiKejadian({Key? key}) : super(key: key);

  @override
  State<MapsLokasiKejadian> createState() => _MapsLokasiKejadian();
}

final List<Map> teksMapsLokasiKejadian = [
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

final List<Map> teksStyleMapsLokasiKejadian = [
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

class _MapsLokasiKejadian extends State<MapsLokasiKejadian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksMapsLokasiKejadian)
                for (final teksStyle in teksStyleMapsLokasiKejadian)
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
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const CurrentLocationScreen();
                            }));
                          },
                          child: const Text("Lokasi terkini"),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
