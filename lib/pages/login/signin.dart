import 'dart:async';

import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:edamkar_1/Example/AweseomSnackBarExample.dart';
import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/models/LoginModel.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/resetpass/resetpass.dart';
import 'package:edamkar_1/pages/register/signup.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:edamkar_1/style/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../style/app_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

bool _passwordVisible = true;

@override
void initState() {
  _passwordVisible = true;
}

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

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final account = TextEditingController();
  final pass = TextEditingController();
  var isLoading = false;

  loginPost(String acnt, String password) async {
    debugPrint(apiUrl);
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      var result = await APIClient().postData('login',
          {"username": acnt, "password": password}).catchError((err) {});

      if (result != null && result != false) {
        print(result);
        var data = loginModelFromJson(result);
        if (data.status) {
          await DataUser().addUser(
              data.data!.id,
              data.data!.username.toString(),
              data.data!.namaLengkap.toString(),
              data.data!.noHp.toString(),
              data.token.toString(),
              data.data!.fotoUser.toString());
          FloatNotif().snackBar(context, "berhasil login",
              "selamat datang ${data.data!.namaLengkap.toString()},");
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const AppMenu()));
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
          FloatNotif().snackBarFail(context, "Login Gagal", data.message!);
        }
      } else {
        setState(() => isLoading = false);
        FloatNotif().snackBarFail(
            context, 'Login Gagal', "coba kembali setelah beberapa saat");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    account.dispose();
    pass.dispose();
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
    SizeConfig().init(context);
    var sty = styleNColor();
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
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
                                  controller: account,
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
                              child: Text(teks['Password'],
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
                                  controller: pass,
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
                                      hintText: teks['PasswordHint'],
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
                            alignment: FractionalOffset.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () {
                                  navToResetPassPage(context);
                                },
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
                              padding: EdgeInsets.only(top: 40),
                              child: Material(
                                color: Colors.red.shade400,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.red.shade700,
                                  highlightColor: Colors.red.shade900,
                                  onTap: () async {
                                    String passUser = pass.text;
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    await preferences.setString("passUser",passUser);
                                    loginPost(account.text, pass.text);
                                  },
                                  child: Container(
                                    height: 50,
                                    child: isLoading
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
                                              SizedBox(width: paddingVertical2),
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
              for (final teks in teksSignIn)
                for (final teksStyle in teksStyleSignIn)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(teks['Footer'], style: teksStyle['SemiBold3']),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/signup',
                            );
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
    ));
  }
}

// fungsi
void navToSignUpPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignUpPage(),
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

void navToResetPassPage(BuildContext context) {
  Timer(Duration(seconds: 0), () {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => ResetPassPage(),
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
