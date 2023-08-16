import 'dart:io';

import 'package:edamkar_1/config/url_static.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show PlatformException;

class EditProfileController extends GetxController {
  var Name = 'user1'.obs;
  var UserPic = "".obs;
  var nohp = "".obs;
  var iduser = 0;

  Rx<File?> imageShow = Rx<File?>(null);
  String? namaFile;

  final nama = TextEditingController().obs;
  final noHp = TextEditingController().obs;
  TextEditingController? getNoHp;
  var message = ''.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    nama.value.dispose();
    noHp.value.dispose();
  }

  void getUserData() async {
    DataUser().getUserId().then((value) => iduser = value);
    DataUser().getNama().then((value) {
      Name.value = value;
      nama.value.text = value;
    });
    DataUser().getGambar().then((value) => UserPic.value = value);
    DataUser().getNoHp().then((value) {
      nohp.value = value;
      noHp.value.text = value;
    });
  }

  String imgpath = '';
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      // setState(() {
      imageShow.value = img;
      imgpath = img!.path;
      // Random random = Random();
      // String namaFileBaru = "profile${random.nextInt(1000)}";
      // String pathBaru =
      //     Path.join(Path.dirname(_image.toString()), namaFileBaru);
      namaFile = path.basename(imageShow.toString());
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

  ImageProvider ChangeProfile() {
    if (imageShow.value == null) {
      if (UserPic == "") {
        return AssetImage("semuaAset/gambar/user1.png") as ImageProvider;
      } else {
        return NetworkImage("${URLWEBAPI.urlHost}/img-user/$UserPic");
      }
    } else {
      return FileImage(imageShow.value!) as ImageProvider;
    }
  }

  void pushUpdate() async {
    var stream = http.ByteStream(imageShow.value!.openRead());
    stream.cast();
    // var length = await image!.length();
    String title = "${iduser.toString()}_profile_${getRandomString(30)}";
    var uri = Uri.parse('${URLWEBAPI.apiUrl}user/Profile/update');
    print('${URLWEBAPI.apiUrl}user/Profile/update');
    print(imgpath);
    final request = http.MultipartRequest('POST', uri);
    request.fields['id_user'] = iduser.toString();
    request.fields['title'] = title;
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imgpath,
      ),
    );
    await request.send();
    Get.snackbar("berhasil", 'perubahan foto profile berhasil');
    Get.back();
  }

  // toss() {
  //   // final snackBar = SnackBar(
  //   //   /// need to set following properties for best effect of awesome_snackbar_content
  //   //   elevation: 0,
  //   //   padding: EdgeInsets.all(16),
  //   //   behavior: SnackBarBehavior.fixed,
  //   //   backgroundColor: Colors.transparent,
  //   //   content: AwesomeSnackbarContent(
  //   //     title: 'Berhasil',
  //   //     message: 'Anda Berhasil Merubah Profil',

  //   //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //   //     contentType: ContentType.success,
  //   //   ),
  //   // );

  //   // ScaffoldMessenger.of(context)
  //   //   ..hideCurrentSnackBar()
  //   //   ..showSnackBar(snackBar);
  //   // Navigator.pop(context);
  // }

  // gagal(BuildContext context) {
  //   // final snackBar = SnackBar(
  //   //   /// need to set following properties for best effect of awesome_snackbar_content
  //   //   elevation: 0,
  //   //   padding: EdgeInsets.all(16),
  //   //   behavior: SnackBarBehavior.fixed,
  //   //   backgroundColor: Colors.transparent,
  //   //   content: AwesomeSnackbarContent(
  //   //     title: 'Gagal',
  //   //     message: 'Anda Gagal Merubah Profil',

  //   //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //   //     contentType: ContentType.failure,
  //   //   ),
  //   // );

  //   // ScaffoldMessenger.of(context)
  //   //   ..hideCurrentSnackBar()
  //   //   ..showSnackBar(snackBar);
  // }
}
