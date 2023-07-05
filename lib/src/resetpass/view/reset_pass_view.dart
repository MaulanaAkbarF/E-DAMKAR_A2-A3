import 'package:edamkar_1/src/resetpass/controller/reset_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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

class ResetPassView extends GetView<ResetPassController> {
  const ResetPassView({Key? key}) : super(key: key);

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
                                  controller: controller.notelp.value,
                                  // onChanged: (value) async {
                                  //   bool isnumberValid =
                                  //       await validasiNomer(value);
                                  //   if (isnumberValid) {
                                  //     setState(() {
                                  //       noHP = value.toString();
                                  //     });
                                  //   } else {
                                  //     setState(() {
                                  //       noHP = "";
                                  //     });
                                  //   }
                                  // },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Nomor WhatsApp tidak boleh kosong';
                                  //   } else if (value.length > 13) {
                                  //     return 'no telepon terlalu panjang';
                                  //   } else if (value.length < 9) {
                                  //     return 'no telepon terlalu pendek';
                                  //   }
                                  // },
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
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
                                    // if (_formKey.currentState!.validate()) {
                                    //   konfirmasiData();
                                    // }
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
