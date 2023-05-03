import 'package:edamkar_1/pages/Profil.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:edamkar_1/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../APIRequest/APIClient.dart';
import '../models/RegisterModel.dart';

class UbahSandi extends StatefulWidget {
  //const UbahSandi({super.key});

  final int userId;
  UbahSandi(this.userId);

  @override
  State<UbahSandi> createState() => _UbahSandiPageState();
}

class _UbahSandiPageState extends State<UbahSandi> {
  bool _passwordVisible = true;
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;

  @override
  void initState() {
    _passwordVisible = true;
    _passwordVisible1 = true;
    _passwordVisible2 = true;
  }

  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _message = '';

  Future<void> _changePassword() async {
    final response = await http.post(
      Uri.parse('https://http://192.168.1.16:8000/api/changePassword'),
      body: {
        'user_id': widget.userId.toString(),
        'old_password': _oldPasswordController.text,
        'new_password': _newPasswordController.text,
        'confirm_password': _confirmPasswordController.text,
      },
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _message = responseData['message'];
      });
    } else {
      setState(() {
        _message = responseData['error'];
      });
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // final TextEditingController password = TextEditingController();
  // final TextEditingController password1 = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  // SimpanPost() async {
  //   var result = await APIClient().postData('register', {
  //     "password": password.text,
  //     "password1": password1.text,
  //   }).catchError((err) {});
  //   if (result != null) {
  //     var data = registerFromJson(result);
  //     if (data.kondisi) {
  //       show('Ubah Kata Sandi Berhasil');
  //       //Navigator.pushNamed(context, '/signin');
  //     } else {
  //       show("Cek Kembali Email dan Password anda");
  //     }
  //   } else {
  //     print('something error on code');
  //   }
  // }

  // void show(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.white,
  //       textColor: Colors.black);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                splashColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade600,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
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
            Text(
              "Ubah Kata Sandi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: "font/inter_bold.ttf"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Masukan Kata Sandi Lama"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: TextFormField(
                  controller: _oldPasswordController,
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
                  style: TextStyle(),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: Color.fromARGB(255, 143, 143, 143),
                      ),
                      suffixIconColor: Colors.black,
                      contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Masukan Kata Sandi Baru"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: TextFormField(
                  controller: _newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password tidak boleh kosong';
                    } else if (value.length > 20) {
                      return 'password terlalu panjang';
                    } else if (value.length < 8) {
                      return 'password terlalu pendek';
                    }
                  },
                  obscureText: _passwordVisible2,
                  cursorColor: Colors.black,
                  style: TextStyle(),
                  decoration: InputDecoration(
                      hintText: 'Minimal 8 Karakter',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible2 = !_passwordVisible2;
                          });
                        },
                        icon: Icon(_passwordVisible2
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: Color.fromARGB(255, 143, 143, 143),
                      ),
                      suffixIconColor: Colors.black,
                      contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Ulangi Kata Sandi Baru"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Validasi password tidak boleh kosong';
                    } else if (value != _confirmPasswordController.text) {
                      return 'validasi password tidak sesuai dengan password';
                    }
                  },
                  obscureText: _passwordVisible1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Minimal 8 Karakter',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                          });
                        },
                        icon: Icon(_passwordVisible1
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: Color.fromARGB(255, 143, 143, 143),
                      ),
                      suffixIconColor: Colors.black,
                      contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
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
                      //SimpanPost();
                      _changePassword();
                    }
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
