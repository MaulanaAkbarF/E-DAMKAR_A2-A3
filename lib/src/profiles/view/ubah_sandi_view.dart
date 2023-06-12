import 'package:edamkar_1/src/profiles/controller/ubah_sandi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahSandiView extends GetView<UbahSandiController> {
  const UbahSandiView({super.key});

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
      body: Column(
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1.2)),
                  child: TextFormField(
                    controller: controller.oldPasswordController,
                    obscureText: controller.passwordVisible.value,
                    cursorColor: Colors.black,
                    style: TextStyle(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: controller.showHidePass,
                          icon: Obx(() => Icon(controller.passwordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
                          color: const Color.fromARGB(255, 143, 143, 143),
                        ),
                        suffixIconColor: Colors.black,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 13, 10, 7),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                    controller: controller.newPasswordController,
                    obscureText: controller.passwordVisible2.value,
                    cursorColor: Colors.black,
                    style: TextStyle(),
                    decoration: InputDecoration(
                        hintText: 'Minimal 8 Karakter',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => controller.showHidePass3(),
                          icon: Obx(() => Icon(controller.passwordVisible2.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
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
                    controller: controller.confirmPasswordController,
                    obscureText: controller.passwordVisible1.value,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: 'Minimal 8 Karakter',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => controller.showHidePass2(),
                          icon: Obx(() => Icon(controller.passwordVisible1.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined)),
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
                    onTap: () => controller.postUbahSandi(),
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
          ),
        ],
      ),
    );
  }
}
