import 'dart:async';
import 'package:edamkar_1/src/login/view/login_view.dart';
import 'package:edamkar_1/src/register/controller/register_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksSignUp = [
  {
    'Header': 'Buat Akun',
    'SubHeader':
        'Masukkan data diri dan buat sebuah akun untuk mengakses seluruh layanan E-Damkar!',
    'Nama': 'Nama Lengkap',
    'NamaHint': 'Contoh: John Doe',
    'Email': 'Username',
    'EmailHint': 'Contoh: johndoe',
    'Telepon': 'No. Telp (Whatsapp)',
    'TeleponHint': '08....',
    'Password1': 'Kata Sandi',
    'Password2': 'Ulangi Kata Sandi',
    'LupaPass': 'Lupa Kata Sandi?',
    'ButtonLogin': 'Daftar',
    'Footer': 'Sudah punya akun?  ',
    'FooterButton': 'Masuk'
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleSignUp = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black,
        fontSize: (32),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        height: 1.4,
        color: Colors.black45,
        fontSize: (18)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.blueAccent,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'SemiBold3': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.black45,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin2': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w600)
  }
];

// ------------------------------------------------------------------------------------------------------------------------------------------

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            for (final teks in teksSignUp)
              for (final teksStyle in teksStyleSignUp)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Text("random: $randomNumber"),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Text(teks['Header'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: teksStyle['Bold1']),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(teks['SubHeader'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: teksStyle['SemiBold1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: Text(teks['Nama'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.2)),
                              child: TextFormField(
                                controller: controller.namalengkap,
                                cursorColor: Colors.black,
                                style: teksStyle['SemiBold1'],
                                decoration: InputDecoration(
                                    hintText: teks['NamaHint'],
                                    prefixIcon: Icon(Icons.person),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 13, 10, 7),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(teks['Email'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.2)),
                              child: TextFormField(
                                controller: controller.username,
                                cursorColor: Colors.black,
                                style: teksStyle['SemiBold1'],
                                decoration: InputDecoration(
                                    hintText: teks['EmailHint'],
                                    prefixIcon: Icon(Icons.mail),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 13, 10, 7),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(teks['Telepon'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.2)),
                              child: TextFormField(
                                controller: controller.notelp,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter(
                                      RegExp(r'[0-9]'),
                                      allow: true)
                                ],
                                cursorColor: Colors.black,
                                style: teksStyle['SemiBold1'],
                                decoration: InputDecoration(
                                    hintText: teks['TeleponHint'],
                                    prefixIcon: Icon(Icons.phone),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 13, 10, 7),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(teks['Password1'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.2)),
                              child: Obx(() => TextFormField(
                                    controller: controller.password,
                                    obscureText:
                                        controller.passwordVisible.value,
                                    cursorColor: Colors.black,
                                    style: teksStyle['SemiBold1'],
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.passVisible(),
                                          icon: Icon(!controller
                                                  .passwordVisible.value
                                              ? Icons.visibility_outlined
                                              : Icons
                                                  .visibility_off_outlined),
                                          color: Color.fromARGB(
                                              255, 143, 143, 143),
                                        ),
                                        suffixIconColor: Colors.black,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10, 13, 10, 7),
                                        border: InputBorder.none),
                                  )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(teks['Password2'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.2)),
                              child: Obx(() => TextFormField(
                                    controller: controller.validatepass,
                                    obscureText:
                                        controller.passwordVisible1.value,
                                    cursorColor: Colors.black,
                                    style: teksStyle['SemiBold1'],
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.validVisible(),
                                          icon: Icon(!controller
                                                  .passwordVisible1.value
                                              ? Icons.visibility_outlined
                                              : Icons
                                                  .visibility_off_outlined),
                                          color: Color.fromARGB(
                                              255, 143, 143, 143),
                                        ),
                                        suffixIconColor: Colors.black,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10, 13, 10, 7),
                                        border: InputBorder.none),
                                  )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Material(
                              color: Colors.red.shade400,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: Obx(() => InkWell(
                                    splashColor: Colors.red.shade700,
                                    highlightColor: Colors.red.shade900,
                                    onTap: controller.RegisterPost,
                                    child: Container(
                                        height: 50,
                                        child: controller.isloading.value
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          paddingVertical2),
                                                  Text(
                                                    'loading...',
                                                    style:
                                                        StyleTxt.b(16, white),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(teks['ButtonLogin'],
                                                      style:
                                                          teksStyle['Thin2']),
                                                ],
                                              )),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            for (final teks in teksSignUp)
              for (final teksStyle in teksStyleSignUp)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(teks['Footer'], style: teksStyle['SemiBold3']),
                      GestureDetector(
                        onTap: () {
                          navToSignInPage(context);
                        },
                        child: Text(teks['FooterButton'],
                            style: teksStyle['SemiBold2']),
                      )
                    ],
                  ),
                )
          ],
        ),
      ),
    ));
  }
}

// fungsi
void navToSignInPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ));
  });
}
