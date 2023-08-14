import 'dart:io';

import 'package:camera/camera.dart';
import 'package:edamkar_1/main.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

class CameraAdmin extends StatefulWidget {
  const CameraAdmin({super.key});

  @override
  State<CameraAdmin> createState() => _CameraAdminState();
}

class _CameraAdminState extends State<CameraAdmin> {
  // bool _isCameraInitialized = false;
  late CameraController camController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    camController = CameraController(cameras[0], ResolutionPreset.max);
    camController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("camera error");
            break;
          default:
            // Handle other errors here.
            print("none");
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    camController.dispose();
  }

  Future takePicture() async {
    if (!camController.value.isInitialized) {
      return null;
    }
    if (camController.value.isTakingPicture) {
      return null;
    }
    try {
      await camController.setFlashMode(FlashMode.off);
      XFile picture = await camController.takePicture();
      var hasil = await drawTextOnImage(picture);
      // var img = await addTextOnImage(picture);
      Get.back(result: hasil);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future<File> drawTextOnImage(XFile xFile) async {
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);

    var decodeImg = img.decodeImage(File(xFile.path).readAsBytesSync());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    String cdate2 = DateFormat("dd, MMMM, yyyy").format(DateTime.now());
    String day = DateFormat("EEEEE").format(DateTime.now());
    img.drawString(decodeImg!,
        "Petugas : akeon \n\nwaktu : $tdata \n\nhari : $day \n\ntanggal : $cdate2 \n\nalamat: jl xxx kecamatan xxx",
        font: img.arial48, x: 40);
    // img.drawString(decodeImg!, arial24, 0, 0, DateTime.now().toString());

    var encodeImage = img.encodeJpg(decodeImg, quality: 100);

    var finalImage = File(xFile.path)..writeAsBytesSync(encodeImage);

    return finalImage;
  }

  // Future<Uint8List> addTextOnImage(XFile xFile) async {
  //   var bytes = await File(xFile.path).readAsBytes();
  //   var image = decodeImage(bytes);
  //   return drawString(image!, 'percobaan', font: arial24).getBytes();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (!camController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      CameraPreview(camController),
      SizedBox(
        height: paddingVertical3,
      ),
      ElevatedButton(
          onPressed: takePicture,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.white, // <-- Button color
            foregroundColor: Colors.red, //
          ),
          child: Icon(
            Icons.camera_alt_outlined,
            color: orange1,
          )),
    ])));
  }
}
