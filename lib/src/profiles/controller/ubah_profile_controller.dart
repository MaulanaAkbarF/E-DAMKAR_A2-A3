import 'dart:io';

import 'package:edamkar_1/config/url_static.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show PlatformException;

class EditProfileController extends GetxController {
  var Name = 'user1'.obs;
  var UserPic = "".obs;
  var nohp = "".obs;

  File? _image;
  String? namaFile;

  final nama = TextEditingController().obs;
  final noHp = TextEditingController().obs;
  TextEditingController? getNoHp;
  var message = ''.obs;

  // TextEditingController? getNama;
  //TextEditingController? getnoHp;

  @override
  void onClose() {
    super.onClose();
    nama.value.dispose();
    noHp.value.dispose();
  }

  void getUserData() async {
    var data = DataUser().getNama();
    var gambar = DataUser().getGambar();
    // var nomor = DataUser().getNoHp();
    // var email = DataUser().getUsername();
    var basenoHp = DataUser().getNoHp();

    gambar.then((value) {
      UserPic.value = value.toString();
    });
    basenoHp.then((value) {
      nohp.value = value.toString();
      // noHp.value.text = nohp;
    });

    data.then((value) {
      Name.value = value.toString();
      // nama.text = Name;
    });
    // email.then((value) {
    //   setState(() {
    //     _email = value.toString();
    //   });
    // });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getUserData();

  //   // widget.userId = _idUser as int;
  // }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      // setState(() {
      _image = img;
      // Random random = Random();
      // String namaFileBaru = "profile${random.nextInt(1000)}";
      // String pathBaru =
      //     Path.join(Path.dirname(_image.toString()), namaFileBaru);
      namaFile = path.basename(_image.toString());
      // Navigator.of(context).pop();
      // });
    } on PlatformException catch (e) {
      print("eror gambar :: ${e}");
      // Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  ImageProvider ChangeProfile({String? urlGambar, File? gambar}) {
    if (gambar == null) {
      if (urlGambar == "" || urlGambar == null) {
        return AssetImage("semuaAset/gambar/user1.png") as ImageProvider;
      } else {
        return NetworkImage(
                "${URLWEBAPI.urlHost}storage/foto_user/${urlGambar.replaceAll("'", "")}")
            as ImageProvider;
      }
    } else {
      return FileImage(gambar) as ImageProvider;
    }
  }

  void pushUpdate() {
    // // if (_formKey.currentState!.validate()) {
    //   print("Nama File Nya adalah == ${_namaFile}");
    //   if (_image == null || _namaFile == "") {
    //     UpdateProfil.ubahProfil(widget.userId.toString(), nama.text, noHp.text)
    //         .then((value) => {
    //               if (value.kode.toString() == "200")
    //                 {
    //                   toss(context),
    //                   DataUser()
    //                       .udpateUser(nama.text, noHp.text, UserPic.toString())
    //                 }
    //               else
    //                 {gagal(context)}
    //             });
    //   } else {
    //     UpdateProfil.sendRequestWithFile(
    //             nama: nama.text,
    //             nomorHp: noHp.text,
    //             id_akun: widget.userId.toString(),
    //             delPic: UserPic.toString(),
    //             file: _image)
    //         .then((value) => {
    //               if (value.kode.toString() == "200")
    //                 {
    //                   DataUser().udpateUser(
    //                       nama.text, noHp.text, _namaFile.toString()),
    //                   toss(context)
    //                 }
    //               else
    //             });
    //   }
  }

  // @override
  // void onCLose() {
  //   n
  //   super.dispose();
  // }

  toss() {
    // final snackBar = SnackBar(
    //   /// need to set following properties for best effect of awesome_snackbar_content
    //   elevation: 0,
    //   padding: EdgeInsets.all(16),
    //   behavior: SnackBarBehavior.fixed,
    //   backgroundColor: Colors.transparent,
    //   content: AwesomeSnackbarContent(
    //     title: 'Berhasil',
    //     message: 'Anda Berhasil Merubah Profil',

    //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //     contentType: ContentType.success,
    //   ),
    // );

    // ScaffoldMessenger.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);
    // Navigator.pop(context);
  }

  gagal(BuildContext context) {
    // final snackBar = SnackBar(
    //   /// need to set following properties for best effect of awesome_snackbar_content
    //   elevation: 0,
    //   padding: EdgeInsets.all(16),
    //   behavior: SnackBarBehavior.fixed,
    //   backgroundColor: Colors.transparent,
    //   content: AwesomeSnackbarContent(
    //     title: 'Gagal',
    //     message: 'Anda Gagal Merubah Profil',

    //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //     contentType: ContentType.failure,
    //   ),
    // );

    // ScaffoldMessenger.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}
