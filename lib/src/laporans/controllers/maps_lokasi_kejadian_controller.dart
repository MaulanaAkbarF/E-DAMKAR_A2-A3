import 'dart:async';

import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/src/laporans/views/LokasiKejadian.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsLokasiKejadianController extends GetxController {
  late String kategori = Get.arguments;

  late GoogleMapController googleMapController;
  final CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);

  Set<Marker> markers = {};
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  String jalan = '';
  String desa = '';
  String kecamatan = '';
  String kota = '';
  String kodepos = '';
  RxString address =
      'Klik tombol Locator untuk menuju alamat kamu sekarang'.obs;

  void setGoogleMapC(GoogleMapController controller) {
    googleMapController = controller;
  }

  void userRePotition() async {
    Position position = await _determinePosition();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 18)));

    markers.clear();

    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude)));
    update();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    // setState(() {
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    jalan = "${place.street}";
    desa = "${place.subLocality}";
    kecamatan = "${place.locality}";
    kota = "${place.subAdministrativeArea}";
    kodepos = "${place.postalCode}";
    address.value =
        "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}";
    // });
  }
  Future<void> showSnackbar(String title, String message) {
    final completer = Completer<void>();

    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white70,
      colorText: Colors.black,
    );

    return completer.future;
  }

  Future<Position> _determinePosition() async {
  bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
       await showSnackbar(
            'GPS belum dinyalakan!', 'Harap menyalakan GPS di perangkat anda !');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await showSnackbar(
            'Izin GPS ditolak!', 'Harap Izinkan aplikasi untuk mengakses GPS');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await showSnackbar(
          'Izin GPS ditolak!', 'Harap Izinkan aplikasi untuk mengakses GPS');
      
    }

    Position position = await Geolocator.getCurrentPosition();
    // setState(() {
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    // });
    return position;
  }

  void goToPelaporan() {
    var data = {
      'idKategori': 0,
      'kategori': '',
      'jalan': jalan,
      'desa': desa,
      'kecamatan': kecamatan,
      'kota': kota,
      'kodepos': kodepos,
      'latitude': latitude.value,
      'longitude': longitude.value,
    };
    if (jalan.isEmpty) {
      // Tampilkan notifikasi "Pilih alamat"
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //     "Tentukan alamat terlebih dahulu",
      //     textAlign: TextAlign.center,
      //   )),
      // );

      //tampilan notifikasi dengan getx
      Get.snackbar('Alamat kosong', "Tentukan alamat terlebih dahulu",
          backgroundColor: black3, colorText: white);
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
        Get.toNamed(Routes.lpBencanaAlam, arguments: data);
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
        Get.toNamed(Routes.lpKebakaran, arguments: data);
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
        Get.toNamed(Routes.lpHewanBuas, arguments: data);
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
        Get.toNamed(Routes.lpPenyelamatan, arguments: data);
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
        Get.toNamed(Routes.lpCustom, arguments: data);
      }
    }
  }

  void goToLokasiKejadian() => Get.to(LokasiKejadian(
        kategori: kategori,
      ));
}
