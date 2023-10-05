import 'dart:io';
import 'dart:isolate';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as date;

void drawTextOnImageInIsolateAll(Map<String, dynamic> params) {
  final SendPort sendPort = params['sendPort'];
  drawTextOnImage(params);
  sendPort.send('Done');
}


void drawTextOnImage(Map<String, dynamic> params) {
    final SendPort sendPort = params['sendPort'];
    final XFile xFile = params['xFile'];

    try {
      var decodeImg = img.decodeImage(File(xFile.path).readAsBytesSync());
      String tdata = date.DateFormat("HH:mm:ss").format(DateTime.now());
      String cdate2 = date.DateFormat("dd-MMMM-yyyy").format(DateTime.now());
      String day = date.DateFormat("EEEEE").format(DateTime.now());
      String alamat =
          "${params['jalan']}, ${params['desa']}, ${params['kecamatan']}, ${params['kota']}, ${params['kodepos']}";
      img.drawString(decodeImg!,
          "Pelapor : ${params['namaAnymCon']} \n\nwaktu : $tdata \n\nhari : $day \n\ntanggal : $cdate2 \n\nalamat: $alamat",
          font: img.arial48, x: 40);

      var encodeImage = img.encodeJpg(decodeImg, quality: 100);

      var finalImage = File(xFile.path)..writeAsBytesSync(encodeImage);

      sendPort.send(finalImage);
    } catch (e) {
      sendPort.send('Error: $e');
    }
  }