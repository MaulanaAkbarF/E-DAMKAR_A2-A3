import 'dart:async';

import 'package:edamkar_1/resetpass.dart';
import 'package:edamkar_1/signin.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksOtpVerification = [{
  'Header': 'Verifikasi Akun',
  'SubHeader': 'Masukkan kode OTP yang telah dikirim ke alamat E-Mail-mu.',
  'Email': 'Kode OTP',
  'EmailHint': 'E-Mail Kamu',
  'SendCodeText': 'Belum menerima kode?  ',
  'SendCodeButton': 'Kirim Ulang',
  'ButtonLogin': 'Konfirmasi'
}
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleOtpVerification = [{
  'Bold1': const TextStyle(fontFamily: "font/inter_black.ttf", color: Colors.black, fontSize: (32), fontWeight: FontWeight.w700),
  'SemiBold1': const TextStyle(fontFamily: "font/inter_bold.ttf", color: Colors.black45, fontSize: (16)),
  'SemiBold2': const TextStyle(fontFamily: "font/inter_extrabold.ttf", color: Colors.blueAccent, fontSize: (18), fontWeight: FontWeight.w500),
  'SemiBold3': const TextStyle(fontFamily: "font/inter_extrabold.ttf", color: Colors.black45, fontSize: (18), fontWeight: FontWeight.w500),
  'Thin1': const TextStyle(fontFamily: "font/inter_regular.ttf", color: Colors.black, fontSize: (18), fontWeight: FontWeight.w500),
  'Thin2': const TextStyle(fontFamily: "font/inter_regular.ttf", color: Colors.white, fontSize: (18), fontWeight: FontWeight.w600)
}];

// ------------------------------------------------------------------------------------------------------------------------------------------

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksOtpVerification) for (final teksStyle in teksStyleOtpVerification)
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
                                onTap: (){
                                  navToResetPassPage(context);
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
                            Text(teks['Header'],overflow: TextOverflow.ellipsis, maxLines: 1, style: teksStyle['Bold1']),
                          ],
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(teks['SubHeader'],overflow: TextOverflow.ellipsis, maxLines: 4, style: teksStyle['SemiBold1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(teks['Email'],overflow: TextOverflow.ellipsis, maxLines: 1, style: teksStyle['Thin1']),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6, // panjang kode OTP
                              onChanged: (value) {
                                // aksi yang dijalankan setiap kali kode OTP berubah
                              },
                              cursorColor: Colors.black,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                fieldHeight: 50,
                                fieldWidth: 50,
                                activeFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                activeColor: Colors.grey.shade300,
                                inactiveColor: Colors.grey.shade300,
                                selectedColor: Colors.grey.shade300,
                                selectedFillColor: Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              textStyle: teksStyle['SemiBold1'],
                              // backgroundColor: Colors.grey.shade100,
                              enableActiveFill: true,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(teks['SendCodeText'], style: teksStyle['SemiBold3']),
                            Text(teks['SendCodeButton'], style: teksStyle['SemiBold2']),
                          ],
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
                                onTap: (){

                                },
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(teks['ButtonLogin'], style: teksStyle['Thin2']),
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
void navToResetPassPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (_, __, ___) => ResetPassPage(),
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
