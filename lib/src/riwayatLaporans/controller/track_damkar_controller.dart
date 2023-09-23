import 'dart:async';
import 'dart:convert';

// import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:edamkar_1/config/url_static.dart';
import 'dart:ui' as ui;

class TrackDamkarController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();
  final initialCamPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);
  // var channel;
  RxBool isWsDone = false.obs;
  Set<Marker> marker = <Marker>{}.obs;
  var dataArg = Get.arguments;

  bool conditon = false;
  @override
  void onInit() {
    initWs();
    super.onInit();
  }

  @override
  void onClose() {
    mapController = Completer();
    super.onClose();
  }

  var wsChannel;

  void initWs() {
    Uri url = Uri.parse('${URLWEBAPI.wsUrl}/tracking');
    wsChannel = WebSocketChannel.connect(url);
    listen(wsChannel);
    join(wsChannel);

    isWsDone.value = true;
  }

  void listen(WebSocketChannel ws) {
    ws.stream.listen(
      (event) {
        var decode = jsonDecode(event);
        var data = decode['message'];
        switch (decode['type']) {
          case 'connect':
            onRouteReq(ws);
            onPositionReq(ws);
            break;
          case 'RQALoc':
            setMarker(data['latitude'], data['longitude']);
            break;
          case 'RQARot':
            setPolyLines(data['route']);
            break;
          case "RQADone":
            doneTracking();
        }
      },
      onDone: () async {
        await Future.delayed(const Duration(seconds: 2));
        initWs();
      },
      onError: (e) async {
        await Future.delayed(const Duration(seconds: 2));
        initWs();
      },
    );
  }

  void join(WebSocketChannel ws) {
    const req = {"command": "Join", "id": 1};
    ws.sink.add(jsonEncode(req));
  }

  void doneTracking() {
    Get.dialog(Dialog(
      backgroundColor: white,
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical1),
                child: Center(
                  child: Text(
                    "Pelaporan anda telah di selesaikan",
                    textAlign: TextAlign.center,
                    style: StyleTxt.b(16, black),
                  ),
                ),
              ),
              const Divider(thickness: 2, color: grey1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical1),
                child: Center(
                  child: Text(
                    "Kembali untuk melihat data penanganan",
                    textAlign: TextAlign.center,
                    style: StyleTxt.m(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    leave(wsChannel);
                    Get.offAllNamed(Routes.dashboard, arguments: 2);
                  },
                  child: const Text("Kembali"))
            ],
          ),
        ),
      ),
    ));
  }

  leave(WebSocketChannel ws) {
    const req = {"command": "Leave", "id": 1};
    ws.sink.add(jsonEncode(req));
  }

  void onRouteReq(WebSocketChannel ws) {
    const req = {"command": "Message", "id": 1, "type": "RQURot"};
    ws.sink.add(jsonEncode(req));
  }

  void onPositionReq(WebSocketChannel ws) {
    const req = {"command": "Message", "id": 1, "type": "RQULoc"};
    ws.sink.add(jsonEncode(req));
  }

  void onMapCreated(GoogleMapController gm) {
    if (!mapController.isCompleted) {
      mapController.complete(gm);
    }
  }

  void setMarker(double lat, double lng) async {
    mapController.future.then((value) => value.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 18))));
    marker.add(Marker(
        markerId: const MarkerId("origin"),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
            'semuaAset/gambar/damkar_example.png', 100))));
    marker.add(Marker(
        markerId: const MarkerId("destination"),
        position: const LatLng(-7.5932817, 111.91509),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
  }

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
      polylineId: const PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polylines.add(polyline);
    update();
  }
}
