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

void drawTextOnImage(Map<String, dynamic> params) async {
  final SendPort sendPort = params['sendPort'];
  final XFile xFile = params['xFile'];

  try {
    final decodeImg = img.decodeImage(File(xFile.path).readAsBytesSync());

    if (decodeImg != null) {
      final tdata = date.DateFormat("HH:mm:ss").format(DateTime.now());
      final cdate2 = date.DateFormat("dd-MMMM-yyyy").format(DateTime.now());
      final day = date.DateFormat("EEEEE").format(DateTime.now());
      final alamat =
          "${params['jalan']}, ${params['desa']}, ${params['kecamatan']}, ${params['kota']}, ${params['kodepos']}";

      img.drawString(decodeImg,
          "Pelapor : ${params['namaAnymCon']} \n\nwaktu : $tdata \n\nhari : $day \n\ntanggal : $cdate2 \n\nalamat: $alamat",
          font: img.arial48, x: 40);

      // final compressedImage = await FlutterImageCompress.compressWithList(
      //     img.encodeJpg(decodeImg, quality: 100),
      //     quality: 20);

      final imageResult = img.encodeJpg(decodeImg, quality: 20);

      final finalImage = File(xFile.path)..writeAsBytesSync(imageResult);
      sendPort.send(finalImage);
    } else {
      sendPort.send('Error: Image decoding failed');
    }
  } catch (e) {
    sendPort.send('Error: $e');
  }
}
