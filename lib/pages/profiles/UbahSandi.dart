import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edamkar_1/config/APIClient.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/models/UbahPassword.dart';
import 'package:edamkar_1/models/changePw.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edamkar_1/src/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UbahSandi extends StatefulWidget {
  //const UbahSandi({super.key});

  final String userId;
  UbahSandi(this.userId, {super.key});

  @override
  State<UbahSandi> createState() => _UbahSandiPageState();
}

class _UbahSandiPageState extends State<UbahSandi> {
  bool _passwordVisible = true;
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;

  var pwOld = "";

  late final _id;

  void getUserpw() async {
    var dataPw = DataUser().getPassword();
    dataPw.then((value) {
      setState(() {
        pwOld = value.toString();
        print(pwOld.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserpw();
    print("pwlama :" + pwOld);
    _passwordVisible = true;
    _passwordVisible1 = true;
    _passwordVisible2 = true;
    _id = widget.userId;
  }

  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _message = '';

  postUbahSandi(String id, String pwLama, String pwBaru) async {
    if (_formKey.currentState!.validate()) {
      var result = await APIClient().postData('user/password', {
        "id": id,
        "password_lama": pwLama,
        "password_baru": pwBaru
      }).catchError((err) {});

      if (result != null && result != false) {
        var data = changePwFromJson(result);
        if (data.kode == "200") {
          toss(context);
        } else {
          gagal(context);
          print("Password Gagal Dirubah !, Kode = " + data.kode.toString());
        }
      }
    }
  }

  // @override
  // void dispose() {
  //   _oldPasswordController.dispose();
  //   _newPasswordController.dispose();
  //   _confirmPasswordController.dispose();
  //   super.dispose();
  // }

  toss(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Kata Sandi Berhasil Di Ubah',
        message: 'Pastikan Anda Ingat Kata Sandi Baru Yaaaa :)',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Profile()),
    // );
  }

  gagal(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Kata Sandi Gagal Di Ubah',
        message: 'Diteliti Lagi Dong..!!!!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text(
            "Ubah Kata Sandi",
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.2)),
                      child: TextFormField(
                        controller: _oldPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password lama tidak boleh kosong';

                            // else if (value.length > 20) {
                            //   return 'password lama terlalu panjang';
                          } else if (value.length < 8) {
                            return 'password lama terlalu pendek';
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
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.2)),
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
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.2)),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Validasi password tidak boleh kosong';
                          } else if (value != _newPasswordController.text) {
                            return "Validasi password tidak sama !";
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
                          postUbahSandi(_id, _oldPasswordController.text,
                              _newPasswordController.text);
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
          ),
        ));
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

  showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
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
}
