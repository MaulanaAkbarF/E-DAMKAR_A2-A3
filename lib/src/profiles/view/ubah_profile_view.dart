import 'package:edamkar_1/src/profiles/controller/ubah_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfilePage extends GetView<EditProfileController> {
  // late final int userId;
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        progressIndicator: const CircularProgressIndicator(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Navigator.pop(context);
                Get.back(); 
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: const Text(
              "Ubah Profil",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical4),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 50,
                          backgroundImage: controller.ChangeProfile(),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -7,
                                right: -7,
                                child: Transform.scale(
                                  scale: 0.65,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          // print("tesss");
                                          controller
                                              .pickImage(ImageSource.gallery);
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                          "Catatan : untuk mengganti data profile hubungi petugas"),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingHorozontal4),
                        child: Align(
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
                                onTap: controller.pushUpdate,
                                child: const SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Simpan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
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
                ),
              ),
            ]),
          ),
        )));
  }
}
