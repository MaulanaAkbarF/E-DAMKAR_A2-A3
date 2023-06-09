import 'dart:async';

import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/src/login/view/login_view.dart';
import 'package:edamkar_1/src/resetpass/UpdatePasswordSuccess.dart';
import 'package:flutter/material.dart';

import '../register/view/verification_succses_view.dart';

class RemakePassPage extends StatefulWidget {
  String noHp;
  RemakePassPage({Key? key, required this.noHp}) : super(key: key);

  @override
  State<RemakePassPage> createState() => _RemakePassPageState();
}

bool _passwordVisible = true;
bool _passwordVisible1 = true;

@override
void initState() {
  _passwordVisible = true;
  _passwordVisible1 = true;
}

final _formKey = GlobalKey<FormState>();
final _newPasswordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
String _message = '';

@override
void dispose() {
  _newPasswordController.dispose();
  _confirmPasswordController.dispose();
}

final List<Map> teksRemakePass = [
  {
    'Header': 'Lupa Kata Sandi',
    'SubHeader': 'Silahkan buat kata sandi baru untuk akun E-Damkar Anda',
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
  late String noHp;
  void initState() {
    super.initState();
    noHp = widget.noHp;
  }

  void gantiPassword(context) async {
    var data = await APIClient().postData('changepass/$noHp', {
      "password": _confirmPasswordController.text,
      "noHp": widget.noHp,
    }).catchError((err) {
      return null;
    });

    if (data != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => UpdatePasswordSuccess()));
    } else {
      print("Something error on code");
      print(data);
    }
  }

  void checkPassword() {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      gantiPassword(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_bold.ttf",
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                                    controller: _newPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password baru tidak boleh kosong';
                                      } else if (value.length > 20) {
                                        return 'password baru terlalu panjang';
                                      } else if (value.length < 8) {
                                        return 'password baru terlalu pendek';
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
                                          color: Color.fromARGB(
                                              255, 143, 143, 143),
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
                                padding: EdgeInsets.only(top: 16),
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
                                    controller: _confirmPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Validasi password tidak boleh kosong';
                                      } else if (value !=
                                          _newPasswordController.text) {
                                        return 'validasi password tidak sesuai dengan password baru';
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
                                          color: Color.fromARGB(
                                              255, 143, 143, 143),
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
                                padding: EdgeInsets.only(top: 32),
                                child: Material(
                                  color: Colors.red.shade400,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    splashColor: Colors.red.shade700,
                                    highlightColor: Colors.red.shade900,
                                    onTap: () {
                                      //navToOtpVerificationPage(context);
                                      if (_formKey.currentState!.validate()) {
                                        checkPassword();
                                      } else {}
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
      ),
    );
  }
}
