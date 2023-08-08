import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TrackDamkarController extends GetxController {
  late GoogleMapController mapController;
  final initialCamPosition =
      const CameraPosition(target: LatLng(-7.589149, 111.887575), zoom: 18);
  var channel;
  RxBool isDone = false.obs;
  RxBool isWsDone = false.obs;
  // List<LatLng> polyPoints = [];
  // Set<Polyline> polylines = Set<Polyline>().obs;
  // Set<Marker> marker = Set<Marker>().obs;
  
  initWs() {
    // channel = WebSocketChannel.connect()
  }

  void onMapCreated(GoogleMapController gm) {
    mapController = gm;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // excWebsocket();
    // getLineJsonData();
    // getCurrentLocation();
  }
}
