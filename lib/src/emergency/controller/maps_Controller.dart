import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsAnonymController extends GetxController {
  late GoogleMapController googleMapController;
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);

  Set<Marker> markers = {};

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var jalan = '';
  var desa = '';
  var kecamatan = '';
  var kota = '';
  var kodepos = '';
  var address = 'Klik tombol Locator untuk menuju alamat kamu sekarang'.obs;

  //snackBar Message
  String title = "posisi tidak valid";
  String message = "Tentukan alamat terlebih dahulu";

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

    latitude.value = position.latitude;
    longitude.value = position.longitude;
    jalan = place.street.toString();
    desa = place.subLocality.toString();
    kecamatan = place.locality.toString();
    kota = place.subAdministrativeArea.toString();
    kodepos = place.postalCode.toString();
    address.value =
        "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}";
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

    latitude.value = position.latitude;
    longitude.value = position.longitude;

    return position;
  }

  goToPelaporan() {
    if (jalan.isEmpty) {
      Get.snackbar(title, message, backgroundColor: black3, colorText: white);
    } else {
      Map<String, dynamic> dataMaps = {
        'desa': desa,
        'jalan': jalan,
        'kecamatan': kecamatan,
        'kota': kota,
        'kodepos': kodepos,
        'latitude': latitude.value,
        'longitude': longitude.value
      };
      Get.toNamed(Routes.emePelaporan, arguments: dataMaps);
    }
  }
}
