import 'package:edamkar_1/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-7.5947464, 111.8952029), zoom: 14);

  Set<Marker> markers = {};

  double latitude = 0.0;
  double longitude = 0.0;
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
            right: 16,
            bottom: 316,
            child: FloatingActionButton(
              onPressed: () async {
                Position position = await _determinePosition();
                googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 14)));

                markers.clear();

                markers.add(Marker(
                    markerId: const MarkerId('currentLocation'),
                    position: LatLng(position.latitude, position.longitude)));

                List<Placemark> placemarks = await placemarkFromCoordinates(
                    position.latitude, position.longitude);
                Placemark place = placemarks[0];
                setState(() {
                  latitude = position.latitude;
                  longitude = position.longitude;
                  address =
                      "${place.name}, ${place.street}, ${place.locality}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}";
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
          DraggableScrollableSheet(
            initialChildSize: 0.38,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
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
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 8),
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
                        padding: EdgeInsets.only(top: 32, left: 16, right: 16),
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
                            onPressed: () {},
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
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
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
                            onPressed: () {},
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
              );
            },
          ),
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
