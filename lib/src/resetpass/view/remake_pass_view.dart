import 'package:edamkar_1/src/resetpass/controller/remake_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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

class RemakePassView extends GetView<RemakePassController> {
  const RemakePassView({Key? key}) : super(key: key);
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
                                  controller:
                                      controller.newPasswordController.value,
                                  obscureText:
                                      controller.passwordVisible1.value,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: () =>
                                            controller.passVisible(),
                                        icon: Icon(controller
                                                .passwordVisible1.value
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
                                  controller: controller
                                      .confirmPasswordController.value,
                                  obscureText: controller.passwordVisible.value,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: () =>
                                            controller.passVisible2(),
                                        icon: Icon(controller
                                                .passwordVisible.value
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
                              padding: EdgeInsets.only(top: 32),
                              child: Material(
                                color: Colors.red.shade400,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.red.shade700,
                                  highlightColor: Colors.red.shade900,
                                  onTap: () => controller.onSaveData(),
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
