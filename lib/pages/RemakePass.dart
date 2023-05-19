import 'dart:async';

import 'package:edamkar_1/pages/signin.dart';
import 'package:flutter/material.dart';

import 'otpverification.dart';

class RemakePassPage extends StatefulWidget {
  const RemakePassPage({Key? key}) : super(key: key);

  @override
  State<RemakePassPage> createState() => _RemakePassPageState();
}

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksRemakePass = [
  {
    'Header': 'Lupa Kata Sandi',
    'SubHeader':
        'Silahkan masukan kata sandi baru untuk akun anda yang sudah terdaftar di E-Damkar!',
    'Password1': 'Kata Sandi',
    'Password2': 'Ulangi Kata Sandi',
    'ButtonLogin': 'Konfirmasi'
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleRemakePass = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black,
        fontSize: (32),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: Colors.black45,
        fontSize: (16)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.blueAccent,
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

class _RemakePassPageState extends State<RemakePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksRemakePass)
                for (final teksStyle in teksStyleRemakePass)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.grey.shade400,
                                  highlightColor: Colors.grey.shade600,
                                  onTap: () {
                                    navToSignInPage(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Icon(Icons.arrow_back_ios_new),
                                    ),
                                  ),
                                ),
                              ),
                              Text(teks['Header'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Bold1']),
                            ],
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(teks['SubHeader'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: teksStyle['SemiBold1']),
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
                              padding: EdgeInsets.only(top: 5),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: TextField(
                                  // controller: pass,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon:
                                          Icon(Icons.remove_red_eye_outlined),
                                      suffixIconColor: Colors.black,
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
                              child: Text(teks['Password2'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Thin1']),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: TextField(
                                  // controller: pass,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon:
                                          Icon(Icons.remove_red_eye_outlined),
                                      suffixIconColor: Colors.black,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 13, 10, 7),
                                      border: InputBorder.none),
                                ),
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
                                child: InkWell(
                                  splashColor: Colors.red.shade700,
                                  highlightColor: Colors.red.shade900,
                                  onTap: () {
                                    navToOtpVerificationPage(context);
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(teks['ButtonLogin'],
                                            style: teksStyle['Thin2']),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
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
                begin: Offset(-1, 0),
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

void navToOtpVerificationPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    // Navigator.push(context, PageRouteBuilder(
    //   pageBuilder: (_, __, ___) => OtpVerificationPage(),
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     return SlideTransition(
    //       position: Tween<Offset>(
    //         begin: Offset(-1, 0),
    //         end: Offset.zero,
    //       ).animate(
    //         CurvedAnimation(
    //           parent: animation,
    //           curve: Curves.easeInOut,
    //         ),
    //       ),
    //       child: child,
    //     );
    //   },
    // ));
  });
}
