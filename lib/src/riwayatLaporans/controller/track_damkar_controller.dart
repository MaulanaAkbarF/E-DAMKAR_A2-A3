import 'dart:convert';

import 'package:edamkar_1/models/UbahPassword.dart';
import 'package:edamkar_1/src/riwayatLaporans/controller/network_helper.dart';
import 'package:edamkar_1/src/riwayatLaporans/models/line_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TrackDamkarController extends GetxController {
  late GoogleMapController mapController;
  final initialCamPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);
  var channel;
  List<LatLng> polyPoints = [];
  Set<Polyline> polylines = Set<Polyline>().obs;
  Set<Marker> markers = Set<Marker>().obs;
  var data;
  RxDouble admLat = 7.589149.obs;
  var admLng = 111.887575.obs;

  onMapCrete(GoogleMapController gmc) {
    mapController = gmc;
    setMarker();
  }

  void excWebsocket() {
    channel = WebSocketChannel.connect(Uri.parse("ws://172.16.106.211:3000"));
    channel.stream.listen((data) {
      var JsonData = jsonDecode(data);
      admLat = JsonData["position"]["latitude"];
      admLng = JsonData["position"]["longitude"];
    });
  }

  void setMarker() {
    markers.add(Marker(
        markerId: MarkerId("origin"),
        position: LatLng(-7.589149, 111.887575),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
    markers.add(Marker(
        markerId: MarkerId("destination"),
        position: LatLng(-7.603006, 111.900885),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));

    Update();
  }

  getLineJsonData() async {
    NetworkHelper network = NetworkHelper(
        startLat: -admLat.value,
        startlng: admLng.value,
        endlat: -7.603006,
        endlng: 111.900885);

    try {
      data = await network.getData();
      LineModel line =
          LineModel(lineString: data['features'][0]['geometry']['coordinates']);
      for (int i = 0; i < line.lineString.length; i++) {
        polyPoints.add(LatLng(line.lineString[i][1], line.lineString[i][0]));
      }
      setPolyLines();
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polylines.add(polyline);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    excWebsocket();
    getLineJsonData();
  }
}
