import 'package:edamkar_1/src/login/controller/login_controller.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../utils/app_style.dart';

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksSignIn = [
  {
    'Header': 'Masuk',
    'SubHeader':
        'Kami senang melihatmu kembali!\nMasuk dan mulalilah menyelamatkan lebih banyak orang.',
    'Email': 'Username atau No Whatsapp',
    'EmailHint': 'Username atau No Whatsapp kamu',
    'Password': 'Kata Sandi',
    'PasswordHint': 'Sandi minimal 8 karakter',
    'LupaPass': 'Lupa Kata Sandi?',
    'ButtonLogin': 'Masuk',
    'Footer': 'Belum punya akun?  ',
    'FooterButton': 'Daftar'
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleSignIn = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black,
        fontSize: (32),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: Colors.black45,
        height: 1.4,
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

class SignInPage extends GetView<LoginController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var sty = styleNColor();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksSignIn)
                for (final teksStyle in teksStyleSignIn)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(teks['SubHeader'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: teksStyle['SemiBold1']),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text(teks['Email'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Thin1']),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: TextFormField(
                                  controller: controller.account.value,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      hintText: teks['EmailHint'],
                                      prefixIcon: const Icon(Icons.mail),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 13, 10, 7),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(teks['Password'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Thin1']),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: Obx(() => TextFormField(
                                      controller: controller.pass.value,
                                      obscureText:
                                          controller.passwordVisible.value,
                                      cursorColor: Colors.black,
                                      style: teksStyle['SemiBold1'],
                                      decoration: InputDecoration(
                                          hintText: teks['PasswordHint'],
                                          prefixIcon: const Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                controller.showHidePass(),
                                            splashColor: Colors.transparent,
                                            icon: Icon(controller
                                                    .passwordVisible.value
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                            color: const Color.fromARGB(
                                                255, 143, 143, 143),
                                          ),
                                          suffixIconColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 13, 10, 7),
                                          border: InputBorder.none),
                                    )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () => controller.goToResetPass(),
                                child: Text(teks['LupaPass'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: teksStyle['SemiBold2']),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Material(
                                color: Colors.red.shade400,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: Obx(() => InkWell(
                                      splashColor: Colors.red.shade700,
                                      highlightColor: Colors.red.shade900,
                                      onTap: () => controller.loginPost(),
                                      child: SizedBox(
                                        height: 50,
                                        child: controller.isLoading.value
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
                                                      width: paddingVertical2),
                                                  Text(
                                                    'loading...',
                                                    style: sty.b(16, white),
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
                                              ),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              for (final teks in teksSignIn)
                for (final teksStyle in teksStyleSignIn)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(teks['Footer'], style: teksStyle['SemiBold3']),
                        GestureDetector(
                          onTap: () => controller.goToSignUp(),
                          child: Text(teks['FooterButton'],
                              style: teksStyle['SemiBold2']),
                        )
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

// // fungsi
// void navToSignUpPage(BuildContext context) {
//   Timer(Duration(seconds: 0), () {
//     Navigator.push(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (_, __, ___) => SignUpPage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(
//                 CurvedAnimation(
//                   parent: animation,
//                   curve: Curves.easeInOut,
//                 ),
//               ),
//               child: child,
//             );
//           },
//         ));
//   });
// }

// void navToResetPassPage(BuildContext context) {
//   Timer(Duration(seconds: 0), () {
//     Navigator.push(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (_, __, ___) => ResetPassPage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(
//                 CurvedAnimation(
//                   parent: animation,
//                   curve: Curves.easeInOut,
//                 ),
//               ),
//               child: child,
//             );
//           },
//         ));
//   });
// }
