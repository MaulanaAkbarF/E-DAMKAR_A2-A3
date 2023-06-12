import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/models/changePw.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahSandiController extends GetxController {
  var data = Get.arguments;
  var passwordVisible = true.obs;
  var passwordVisible1 = true.obs;
  var passwordVisible2 = true.obs;

  var pwOld = "";

  // late final _id;

  void getUserpw() async {
    var dataPw = DataUser().getPassword();
    dataPw.then((value) {
      pwOld = value.toString();
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUserpw();
  }

  // final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  showHidePass() => passwordVisible.value = !passwordVisible.value;
  showHidePass2() => passwordVisible1.value = !passwordVisible1.value;
  showHidePass3() => passwordVisible2.value = !passwordVisible2.value;

  bool checkInput() {
    return true;
  }

  postUbahSandi() async {
    if (checkInput()) {
      var result = await APIClient().postData('user/password', {
        // "id": id,
        // "password_lama": pwLama,
        // "password_baru": pwBaru
      }).catchError((err) {});

      if (result != null && result != false) {
        var data = changePwFromJson(result);
        if (data.kode == "200") {
        } else {}
      }
    }
  }

  showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // @override
  // void dispose() {
  //   _oldPasswordController.dispose();
  //   _newPasswordController.dispose();
  //   _confirmPasswordController.dispose();
  //   super.dispose();
  // }

  // toss(BuildContext context) {
  //   final snackBar = SnackBar(
  //     /// need to set following properties for best effect of awesome_snackbar_content
  //     elevation: 0,
  //     padding: EdgeInsets.all(16),
  //     behavior: SnackBarBehavior.fixed,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: 'Kata Sandi Berhasil Di Ubah',
  //       message: 'Pastikan Anda Ingat Kata Sandi Baru Yaaaa :)',

  //       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //       contentType: ContentType.success,
  //     ),
  //   );

  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => Profile()),
  //   // );
  // }

  // gagal(BuildContext context) {
  //   final snackBar = SnackBar(
  //     /// need to set following properties for best effect of awesome_snackbar_content
  //     elevation: 0,
  //     padding: EdgeInsets.all(16),
  //     behavior: SnackBarBehavior.fixed,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: 'Kata Sandi Gagal Di Ubah',
  //       message: 'Diteliti Lagi Dong..!!!!',

  //       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //       contentType: ContentType.failure,
  //     ),
  //   );

  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
}
