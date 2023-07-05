import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/riwayat_laporan_controller.dart';

class Pencarian extends StatelessWidget {
  final rwtController = Get.put(RiwayatLaporanController());

  @override
  Widget build(BuildContext context) {
    return Text(rwtController.search.value.text);
  }
}
