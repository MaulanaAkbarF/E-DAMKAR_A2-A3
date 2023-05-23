import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:edamkar_1/APIRequest/APIClient.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/pages/login/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../otpVerifications/OTPResetPassword.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

final List<Map> teksResetPass = [
  {
    'Header': 'Lupa Kata Sandi',
    'SubHeader':
        'Masukan nomor WhatsApp anda yang sudah terdaftar di aplikasi E-Damkar!',
    'Email': 'Nomor WhatsApp',
    'EmailHint': '08••••••••••',
    'ButtonLogin': 'Konfirmasi'
  }
].cast<Map<String, String>>();

final List<Map> teksStyleResetPass = [
  {
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

class _ResetPassPageState extends State<ResetPassPage> {
  final TextEditingController notelp = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    random();
    super.initState();
  }

  int randomNumber = 100000;
  String noHP = '';

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void _kirimNotifikasi() async {
    var url = Uri.parse(
        'http://192.168.225.132:8080/flutter_api/otpwa.php'); // Ganti dengan URL endpoint API yang sesuai

    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": notelp.text,
    };
    await APIClient().postData('verifyOtp/whatsapp', data);
    FloatNotif().snackBar2(context, "kode Otp berhasil terkirim");
  }

  Future<bool> validasiNomer(String noHP) async {
    var apiUrl = Uri.parse('http://192.168.225.132:8000/api/getNoHp/$noHP');
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['data'].isEmpty) {
        print('Data is empty');
        return false; // menambahkan return false
      } else {
        noHP = jsonResponse['data'][0]['noHP'];
        return true; // menambahkan return true
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false; // menambahkan return false
    }
  }

  void konfirmasiData() async {
    bool isnumberValid = await validasiNomer(noHP);
    if (isnumberValid) {
      _kirimNotifikasi();
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => OTPResetPassword(
              kodeOtp: randomNumber.toString(),
              noHp: notelp.text,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          "Nomor telepon tidak terdaftar!",
          textAlign: TextAlign.center,
        )),
      );
    }
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
                for (final teks in teksResetPass)
                  for (final teksStyle in teksStyleResetPass)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Text('Title : $noHP'),
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
                                    onChanged: (value) async {
                                      bool isnumberValid =
                                          await validasiNomer(value);
                                      if (isnumberValid) {
                                        setState(() {
                                          noHP = value.toString();
                                        });
                                      } else {
                                        setState(() {
                                          noHP = "";
                                        });
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Nomor WhatsApp tidak boleh kosong';
                                      } else if (value.length > 13) {
                                        return 'no telepon terlalu panjang';
                                      } else if (value.length < 9) {
                                        return 'no telepon terlalu pendek';
                                      }
                                    },
                                    cursorColor: Colors.black,
                                    style: teksStyle['SemiBold1'],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter(
                                          RegExp(r'[0-9]'),
                                          allow: true)
                                    ],
                                    decoration: InputDecoration(
                                        hintText: teks['EmailHint'],
                                        prefixIcon: Icon(Icons.phone),
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
                                      if (_formKey.currentState!.validate()) {
                                        konfirmasiData();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
