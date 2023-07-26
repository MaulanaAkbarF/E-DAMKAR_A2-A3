import 'package:edamkar_1/src/riwayatLaporans/controller/track_damkar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackDamkarView extends GetView<TrackDamkarController> {
  const TrackDamkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Damkar Map Tracking"),
      ),
      body: Obx(() => GoogleMap(
            initialCameraPosition: controller.initialCamPosition,
            onMapCreated: controller.onMapCrete,
            markers: controller.markers,
            polylines: controller.polylines,
          )),
          
    );
  }
}
