import 'package:edamkar_1/src/emergency/controller/laporan_anonym_controller.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanAnonymDataView extends GetView<LaporanAnonymController> {
  const LaporanAnonymDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: black),
        title: Text(
          "Lengkapi Data Diri anda",
          style: StyleTxt.sb(size: 18, color: black),
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text("Name Lengkap",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: StyleTxt.sb()),
                ),
              ),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey.shade300, width: 1.2)),
                    child: TextFormField(
                      controller: controller.namaAnymCon,
                      cursorColor: Colors.black,
                      style: StyleTxt.m(size: 16),
                      decoration: const InputDecoration(
                          hintText: 'Contoh: ipul',
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text("NIK",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: StyleTxt.sb()),
                ),
              ),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey.shade300, width: 1.2)),
                    child: TextFormField(
                      controller: controller.nikAnymCon,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: StyleTxt.m(size: 16),
                      decoration: const InputDecoration(
                          hintText: '',
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text("Umur",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: StyleTxt.sb()),
                ),
              ),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey.shade300, width: 1.2)),
                    child: TextFormField(
                      controller: controller.umurAnymCon,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: StyleTxt.m(size: 16),
                      decoration: const InputDecoration(
                          hintText: '29',
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 7),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Material(
                    color: Colors.red.shade400,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      splashColor: Colors.red.shade700,
                      highlightColor: Colors.red.shade900,
                      onTap: controller.goToLaporanAnonymView,
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Lanjutkan", style: StyleTxt.b(18, white)),
                          ],
                        ),
                      ),
                    ),
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
