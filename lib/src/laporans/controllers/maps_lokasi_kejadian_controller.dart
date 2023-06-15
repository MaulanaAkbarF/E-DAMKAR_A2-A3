import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsLokasiKejadianController extends GetxController {
  late String kategori;

  late GoogleMapController googleMapController;
  final CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-7.2232139, 112.6226935), zoom: 15);

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
    // setState(() {
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    // });
    return position;
  }
}
