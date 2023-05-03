import 'dart:async';

import 'package:edamkar_1/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../APIRequest/APIClient.dart';
import '../models/RegisterModel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool _passwordVisible = true;
bool _passwordVisible1 = true;

@override
void initState() {
  _passwordVisible = true;
  _passwordVisible1 = true;
}

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur teks yang akan ditampilkan

final List<Map> teksSignUp = [
  {
    'Header': 'Buat Akun',
    'SubHeader':
        'Masukkan data diri dan buat sebuah akun untuk mengakses seluruh layanan E-Damkar!',
    'Nama': 'Nama Lengkap',
    'NamaHint': 'Nama Kamu',
    'Email': 'E-Mail',
    'EmailHint': 'E-Mail Kamu',
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
        color: Colors.black45,
        fontSize: (16)),
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
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController namalengkap = TextEditingController();
  final TextEditingController notelp = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RegisterPost() async {
    var result = await APIClient().postData('register', {
      "email": email.text,
      "password": password.text,
      "namaLengkap": namalengkap.text,
      "noHp": notelp.text
    }).catchError((err) {});
    if (result != null) {
      var data = registerModelFromJson(result);
      if (data.kondisi != null && data.kondisi!) {
        show('Registrasi Berhasil');
        Navigator.pushNamed(context, '/signin');
      } else if (data.message!.isNotEmpty) {
        show(data.message!);
      }
    } else {
      print('something error on code');
    }
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
                              padding: EdgeInsets.only(top: 30),
                              child: Text(teks['Nama'],
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
                                child: TextFormField(
                                  controller: namalengkap,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nama tidak boleh kosong';
                                    }
                                  },
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
                                child: TextFormField(
                                  controller: email,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email tidak boleh kosong';
                                    }
                                  },
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
                              child: Text("No Telepon",
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
                                child: TextFormField(
                                  controller: notelp,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nomer Telepon tidak boleh kosong';
                                    } else if (value.length > 13) {
                                      return 'no telepon terlalu panjang';
                                    } else if (value.length < 9) {
                                      return 'no telepon terlalu pendek';
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      hintText: "No Telp kamu",
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
                                child: TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'password tidak boleh kosong';
                                    } else if (value.length > 20) {
                                      return 'password terlalu panjang';
                                    } else if (value.length < 8) {
                                      return 'password terlalu pendek';
                                    }
                                  },
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Validasi password tidak boleh kosong';
                                    } else if (value != password.text) {
                                      return 'validasi password tidak sesuai dengan password';
                                    }
                                  },
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
                                    if (_formKey.currentState!.validate()) {
                                      RegisterPost();
                                    }
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
