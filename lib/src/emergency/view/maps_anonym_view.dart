import 'package:edamkar_1/src/emergency/controller/maps_Controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MapsAnonym extends GetView<MapsAnonymController> {
  const MapsAnonym({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.snackbar(
              "Laporan Belum Selesai", "Tolong selesaikan Pelaporan anda",
              backgroundColor: black3, colorText: white);
          return false;
        },
        child: Scaffold(
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
            body: Obx(
              () => Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: controller.initialCameraPosition,
                    markers: controller.markers,
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController gmController) =>
                        controller.setGoogleMapC(gmController),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24, right: 16),
                          child: FloatingActionButton(
                            onPressed: controller.userRePotition,
                            backgroundColor: Colors.red.shade400,
                            elevation: 0,
                            splashColor: Colors.red.shade800,
                            child: SvgPicture.asset(
                              'semuaAset/icon/Discovery.svg',
                              width: 24,
                              height: 24,
                              color: white,
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
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
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, top: 20),
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
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 8),
                                  child: Text(
                                    'Alamat: ${controller.address.value}',
                                    style: const TextStyle(
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
                                    padding: const EdgeInsets.only(
                                        top: 32, left: 16, right: 16),
                                    child: Material(
                                      color: Colors.red.shade400,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      borderRadius: BorderRadius.circular(8),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red.shade400,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                          minimumSize: const Size.fromHeight(50),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                        ),
                                        onPressed: controller.goToPelaporan,
                                        child: const Text(
                                          'Ya, Lokasi Saya Sudah Sesuai',
                                          style: TextStyle(
                                            // Properti gaya teks
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16,
                                        left: 16,
                                        right: 16,
                                        bottom: 24),
                                    child: Material(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      borderRadius: BorderRadius.circular(8),
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1.5),
                                          backgroundColor: Colors.grey.shade100,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                          minimumSize: const Size.fromHeight(50),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                        ),
                                        onPressed: () {
                                          controller.goToLokasiKejadian();
                                        },
                                        child: const Text(
                                          'Tidak ketemu? Isi alamat secara manual',
                                          style: TextStyle(
                                            // Properti gaya teks
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
