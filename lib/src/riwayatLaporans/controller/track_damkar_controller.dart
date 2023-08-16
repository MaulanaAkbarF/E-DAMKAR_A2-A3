import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:edamkar_1/config/url_static.dart';
import 'dart:ui' as ui;

class TrackDamkarController extends GetxController {
  late GoogleMapController mapController;
  final initialCamPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);
  var channel;
  RxBool isWsDone = false.obs;
  Set<Marker> marker = Set<Marker>().obs;

  @override
  void onInit() {
    initWs();
    super.onInit();
  }

  late final wsChannel;

  void initWs() {
    Uri url = Uri.parse('${URLWEBAPI.wsUrl}/tracking');
    wsChannel = WebSocketChannel.connect(url);
    listen(wsChannel);
    onRouteReq(wsChannel);
    onPositionReq(wsChannel);
    isWsDone.value = true;
  }

  void listen(WebSocketChannel ws) {
    ws.stream.listen((event) {
      var decode = jsonDecode(event);
      var data = decode['message'];
      switch (decode['type']) {
        case 'connect':
          print(decode);
          break;
        case 'RQALoc':
          setMarker(data['latitude'], data['longitude']);
          break;
        case 'RQARot':
          setPolyLines(data['route']);
          break;
      }
    });
  }

  void onRouteReq(WebSocketChannel ws) {
    const req = {"command": "Request", "type": "RQURot"};
    ws.sink.add(jsonEncode(req));
  }

  void onPositionReq(WebSocketChannel ws) {
    const req = {"command": "Request", "type": "RQULoc"};
    ws.sink.add(jsonEncode(req));
  }

  void onMapCreated(GoogleMapController gm) {
    mapController = gm;
  }

  void setMarker(double lat, double lng) async {
    marker.add(Marker(
        markerId: MarkerId("origin"),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
            'semuaAset/gambar/damkar_example.png', 100))));
    marker.add(Marker(
        markerId: MarkerId("destination"),
        position: LatLng(-7.603006, 111.900885),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
  }

  // void updatePosition(double latd, double long) async {
  //   marker
  //       .removeWhere((element) => element.markerId == const MarkerId("origin"));
  //   marker.add(Marker(
  //       markerId: MarkerId("origin"),
  //       position: LatLng(latd, long),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)));
  //   // marker.elementAt(0).copyWith(positionParam: LatLng(latd, long));
  // }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  final List<LatLng> polyPoints = [];
  final Set<Polyline> polylines = {};
  setPolyLines(line) {
    for (int i = 0; i < line.length; i++) {
      polyPoints.add(LatLng(line[i][0], line[i][1]));
    }
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polylines.add(polyline);
    update();
  }
}
