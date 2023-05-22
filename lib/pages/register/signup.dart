import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/login/signin.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../../APIRequest/APIClient.dart';
import '../../models/RegisterModel.dart';
import '../otpVerifications/otpverification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

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

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController namalengkap = TextEditingController();
  final TextEditingController notelp = TextEditingController();
  final TextEditingController validatepass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isloading = false;
  bool _passwordVisible = true;
  bool _passwordVisible1 = true;

  bool checkField() {
    if (namalengkap.text.isEmpty) {
      FloatNotif().snackBarFail(context, "", "Nama Lengkap tidak boleh kosong");
      return false;
    }
    if (namalengkap.text.length < 5) {
      FloatNotif()
          .snackBarFail(context, "", "Nama Yang kamu masukkan terlalu pendek");
      return false;
    }
    if (namalengkap.text.length > 30) {
      FloatNotif()
          .snackBarFail(context, "", "Nama yang kamu masukkan terlalu pendek");
      return false;
    }
    if (username.text.isEmpty) {
      FloatNotif().snackBarFail(context, "", "Username tidak boleh kosong");
      return false;
    }
    if (username.text.contains(" ")) {
      FloatNotif()
          .snackBarFail(context, "", "Username tidak boleh pakai spasi");
      return false;
    }
    if (username.text.length < 5) {
      FloatNotif().snackBarFail(context, "", "Username terlalu pendek");
      return false;
    }
    if (username.text.length > 30) {
      FloatNotif().snackBarFail(context, "", "username terlalu panjang");
      return false;
    }
    if (password.text.isEmpty) {
      FloatNotif().snackBarFail(context, "", "password tidak boleh kosong");
      return false;
    }
    if (password.text.length < 8) {
      FloatNotif().snackBarFail(context, "", "password terlalu pendek");
      return false;
    }
    if (password.text.length > 30) {
      FloatNotif().snackBarFail(context, "", "password terlalu panjang");
      return false;
    }
    if (validatepass.text.isEmpty) {
      FloatNotif()
          .snackBarFail(context, "", "Validasi password tidak boleh kosong");
      return false;
    }
    if (validatepass.text != password.text) {
      FloatNotif().snackBarFail(
          context, "", "validasi password tidak sesuai dengan password");
      return false;
    }
    if (notelp.text.length < 9) {
      FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu pendek");
      return false;
    }
    if (notelp.text.length > 13) {
      FloatNotif().snackBarFail(context, "", "Nomor Hp terlalu panjang");
      return false;
    }
    return true;
  }

  void RegisterPost(context) async {
    setState(() => isloading = true);
    var result = await APIClient().postData('register', {
      "username": username.text,
      "password": password.text,
      "namaLengkap": namalengkap.text,
      "noHp": notelp.text,
      "kodeOtp": randomNumber.toString(),
      "status": 'Unverified'
    }).catchError((err) {
      return null;
    });
    if (result != null) {
      var data = registerModelFromJson(result);
      if (data.kondisi!) {
        FloatNotif().snackBar2(context, "Registrasi Berhasil");
        setState(() => isloading = false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationPage(
              noHp: notelp.text,
              kodeOtp: randomNumber.toString(),
            ),
          ),
        );
      } else {
        setState(() => isloading = false);
        if (data.message!.toString().split(" ").contains("username")) {
          FloatNotif().snackBarFail(
              context, "Gagal Membuat Akun", "username sudah digunakan");
        } else if (data.message!.toString().split(" ").contains("hp")) {
          FloatNotif().snackBarFail(
              context, "Gagal Membuat Akun", "No Hp kamu sudah digunakan");
        }
      }
    } else {
      setState(() => isloading = false);
      FloatNotif().snackBar2(context, "coba kembali beberapa saat");
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    random();
    super.initState();
  }

  int randomNumber = 100000;

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void show(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var sty = styleNColor();
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Expanded(
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
                                  controller: namalengkap,
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
                                  controller: username,
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
                                  controller: notelp,
                                  keyboardType: TextInputType.number,
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
                                child: TextFormField(
                                  controller: password,
                                  obscureText: _passwordVisible,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                        color:
                                            Color.fromARGB(255, 143, 143, 143),
                                      ),
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
                                  controller: validatepass,
                                  obscureText: _passwordVisible1,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible1 =
                                                !_passwordVisible1;
                                          });
                                        },
                                        icon: Icon(_passwordVisible1
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                        color:
                                            Color.fromARGB(255, 143, 143, 143),
                                      ),
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
                                    if (checkField()) {
                                      RegisterPost(context);
                                    }
                                  },
                                  child: Container(
                                      height: 50,
                                      child: isloading
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
                                                    style: teksStyle['Thin2']),
                                              ],
                                            )),
                                ),
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
      ),
    )));
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
