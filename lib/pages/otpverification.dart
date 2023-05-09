import 'dart:async';
import 'package:edamkar_1/pages/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'RemakePass.dart';

class OtpVerificationPage extends StatefulWidget {
  String noHp;

  OtpVerificationPage({Key? key, required this.noHp}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksOtpVerification = [
  {
    'Header': 'Verifikasi Akun',
    'SubHeader': 'Masukkan kode OTP yang telah dikirim ke nomor Whatsapp kamu',
    'Email': 'Kode OTP',
    'EmailHint': 'E-Mail Kamu',
    'SendCodeText': 'Belum menerima kode?  ',
    'SendCodeButton': 'Kirim Ulang',
    'ButtonLogin': 'Konfirmasi'
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleOtpVerification = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_black.ttf",
        color: Colors.black,
        fontSize: (32),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: Colors.black45,
        fontSize: (18)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.blueAccent,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'SemiBold3': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black45,
        fontSize: (18),
        fontWeight: FontWeight.w400),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.black87,
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

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Verifikasi Nomor Whatsapp",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_bold.ttf",
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksOtpVerification)
                for (final teksStyle in teksStyleOtpVerification)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('noHp: ${widget.noHp}'),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0),
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
                              child: Text(teks['Email'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: teksStyle['Thin1']),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: 16),
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
                                    fieldHeight: 56,
                                    fieldWidth: 56,
                                    activeFillColor: Colors.white,
                                    inactiveFillColor: Colors.grey.shade100,
                                    activeColor: Colors.grey.shade300,
                                    inactiveColor: Colors.grey.shade300,
                                    selectedColor: Colors.blue.shade500,
                                    selectedFillColor: Colors.white,
                                    borderWidth: 1.5),
                                animationDuration: Duration(milliseconds: 300),
                                textStyle: teksStyle['SemiBold1'],
                                // backgroundColor: Colors.grey.shade100,
                                enableActiveFill: true,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(teks['SendCodeText'],
                                  style: teksStyle['SemiBold3']),
                              Text(teks['SendCodeButton'],
                                  style: teksStyle['SemiBold2']),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: 32),
                              child: Material(
                                color: Colors.red.shade400,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.red.shade700,
                                  highlightColor: Colors.red.shade900,
                                  onTap: () {
                                    navToRemakePassPage(context);
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
void navToResetPassPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(
        context,
        PageRouteBuilder(
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

void navToRemakePassPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => RemakePassPage(),
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
