import 'package:edamkar_1/config/api_client.dart';
import 'package:edamkar_1/models/changePw.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahSandiController extends GetxController {
  var data = Get.arguments;
  var passwordVisible = true.obs;
  var passwordVisible1 = true.obs;
  var passwordVisible2 = true.obs;

  var pwOld = "".obs;
  var pwLama = "superone";
  var id = 0.obs;

  // late final _id;

  @override
  void onInit() {
    print("id : $id");
    print("pw lama :$pwOld");
    getUser();

    super.onInit();
  }

  void getUser() async {
    DataUser().getPassword().then((value) => pwOld.value = value);
    DataUser().getUserId().then((value) => id.value = value);
  }

  final formKey = GlobalKey<FormState>();

  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  showHidePass() => passwordVisible.value = !passwordVisible.value;
  showHidePass2() => passwordVisible1.value = !passwordVisible1.value;
  showHidePass3() => passwordVisible2.value = !passwordVisible2.value;

  bool checkInput() {
    return true;
  }

  postUbahSandi() async {
    if (formKey.currentState!.validate()) {
      
     if (newPasswordController.value.text ==
        confirmPasswordController.value.text) {
      var result = await APIClient().postData('user/password', {
        "id": id.toString(),
        "password_lama": oldPasswordController.value.text,
        "password_baru": newPasswordController.value.text
      }).catchError((err) {});

      if (result != null && result != false) {
        print("nilai result$result");
        var data = changePwFromJson(result);
        if (data.status == "gagal" || data.kode != "200") {
          Get.snackbar("Gagal", "Password anda gagal diubah!. Coba cek kembali inputan anda!");
          print("eror code : ${data.kode}");
          // throw Exception('error' + data.status.toString());
        } else if (data.status == "berhasil" || data.kode == "200") {
          Get.snackbar("Berhasil",
              "Password berhasil diubah!, gunakan password baru untuk login !");
          Get.offNamed(Routes.dashboard);
        }
      } else {
        Get.snackbar("Kesalahan", "Terdapat kesalahan dalam ubah passwor!");
      }
    } else {
      Get.snackbar(
          "Gagal", "Konfirmasi password tidak sama dengan password baru !");
    }
    }
  }

  showLoadingDialog(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      content: Row(
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
