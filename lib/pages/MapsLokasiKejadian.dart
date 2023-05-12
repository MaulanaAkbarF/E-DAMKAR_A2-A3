import 'package:edamkar_1/pages/LaporanBencanaAlam.dart';
import 'package:edamkar_1/pages/LaporanHewanBuas.dart';
import 'package:edamkar_1/pages/LaporanKebakaran.dart';
import 'package:edamkar_1/pages/LaporanPenyelamatan.dart';
import 'package:edamkar_1/pages/LokasiKejadian.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapsLokasiKejadian extends StatefulWidget {
  String kategori;
  MapsLokasiKejadian({Key? key, required this.kategori}) : super(key: key);

  @override
  State<MapsLokasiKejadian> createState() => _MapsLokasiKejadian();
}

class _MapsLokasiKejadian extends State<MapsLokasiKejadian> {
  late String kategori;
  void initState() {
    super.initState();
    kategori = widget.kategori;
  }

  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-7.2232139, 112.6226935), zoom: 15);

  Set<Marker> markers = {};

  double latitude = 0.0;
  double longitude = 0.0;
  String jalan = '';
  String desa = '';
  String kecamatan = '';
  String kota = '';
  String kodepos = '';
  String address = 'Klik tombol Locator untuk menuju alamat kamu sekarang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tentukan Lokasi Kejadian",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_bold.ttf",
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 16),
                  child: FloatingActionButton(
                    onPressed: () async {
                      Position position = await _determinePosition();
                      googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target:
                                  LatLng(position.latitude, position.longitude),
                              zoom: 18)));

                      markers.clear();

                      markers.add(Marker(
                          markerId: const MarkerId('currentLocation'),
                          position:
                              LatLng(position.latitude, position.longitude)));

                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              position.latitude, position.longitude);
                      Placemark place = placemarks[0];
                      setState(() {
                        latitude = position.latitude;
                        longitude = position.longitude;
                        jalan = "${place.street}";
                        desa = "${place.subLocality}";
                        kecamatan = "${place.locality}";
                        kota = "${place.subAdministrativeArea}";
                        kodepos = "${place.postalCode}";
                        address =
                            "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}";
                      });
                    },
                    child: SvgPicture.asset(
                      'semuaAset/icon/Discovery.svg',
                      width: 24,
                      height: 24,
                      color: white,
                    ),
                    backgroundColor: Colors.red.shade400,
                    elevation: 0,
                    splashColor: Colors.red.shade800,
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.grey.withOpacity(0.5),
                        //   spreadRadius: 2,
                        //   blurRadius: 20,
                        //   offset: Offset(0, 10),
                        // ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 20),
                          child: Text(
                            'Alamat Lokasi Kejadian',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "font/inter_bold.ttf",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          child: Text(
                            'Alamat: $address',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.4,
                              fontFamily: "font/inter_bold.ttf",
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 32, left: 16, right: 16),
                            child: Material(
                              color: Colors.red.shade400,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  minimumSize: Size.fromHeight(50),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                onPressed: () {
                                  if (jalan.isEmpty) {
                                    // Tampilkan notifikasi "Pilih alamat"
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                        "Tentukan alamat terlebih dahulu",
                                        textAlign: TextAlign.center,
                                      )),
                                    );
                                  } else {
                                    if (kategori == "bencanaalam") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LaporanBencanaAlam(
                                            jalan: jalan,
                                            desa: desa,
                                            kecamatan: kecamatan,
                                            kota: kota,
                                            kodepos: kodepos,
                                            latitude: latitude,
                                            longitude: longitude,
                                          ),
                                        ),
                                      );
                                    } else if (kategori == "kebakaran") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LaporanKebakaran(
                                            jalan: jalan,
                                            desa: desa,
                                            kecamatan: kecamatan,
                                            kota: kota,
                                            kodepos: kodepos,
                                            latitude: latitude,
                                            longitude: longitude,
                                          ),
                                        ),
                                      );
                                    } else if (kategori == "hewanbuas") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LaporanHewanBuas(
                                            jalan: jalan,
                                            desa: desa,
                                            kecamatan: kecamatan,
                                            kota: kota,
                                            kodepos: kodepos,
                                            latitude: latitude,
                                            longitude: longitude,
                                          ),
                                        ),
                                      );
                                    } else if (kategori == "penyelamatan") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LaporanPenyelamatan(
                                            jalan: jalan,
                                            desa: desa,
                                            kecamatan: kecamatan,
                                            kota: kota,
                                            kodepos: kodepos,
                                            latitude: latitude,
                                            longitude: longitude,
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ya, Lokasi Saya Sudah Sesuai',
                                      style: TextStyle(
                                        // Properti gaya teks
                                        color: Colors.white,
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
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 16, left: 16, right: 16, bottom: 24),
                            child: Material(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.grey.shade300, width: 1.5),
                                  backgroundColor: Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  minimumSize: Size.fromHeight(50),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LokasiKejadian(
                                              kategori: kategori,
                                            )),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tidak ketemu? Isi alamat secara manual',
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("GPS kamu belum dinyalakan nih :(");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin GPS ditolak :(');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Izin GPS ditolak. Harap izinkan aplikasi untuk mengakses GPS');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    return position;
  }
}
