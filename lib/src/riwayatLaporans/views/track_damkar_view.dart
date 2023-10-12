import 'package:edamkar_1/src/riwayatLaporans/controller/track_damkar_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class TrackDamkarView extends GetView<TrackDamkarController> {
  const TrackDamkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: black),
          titleTextStyle: const TextStyle(color: black),
          title: const Text("Damkar Map Tracking"),
        ),
        body: Obx(() => controller.isWsDone.value
            ? GoogleMap(
                initialCameraPosition: controller.initialCamPosition,
                onMapCreated: controller.onMapCreated,
                markers: controller.marker.value,
                polylines: controller.polylines,
                zoomControlsEnabled: false,
              )
            : const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator())),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          type: ExpandableFabType.up,
          distance: 50,
          childrenOffset: const Offset(-3, 0),
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.menu),
          ),
          children: [
            FloatingActionButton.small(
              heroTag: 'carPosition',
              onPressed: controller.setToCurrentPosition,
              child: const Icon(Icons.location_history),
            ),
            FloatingActionButton.small(
              heroTag: 'destination',
              onPressed: controller.setPosition,
              child: const Icon(Icons.location_on_outlined),
            ),
          ],
        ));
  }
}
