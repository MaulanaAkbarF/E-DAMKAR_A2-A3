import 'package:edamkar_1/src/profiles/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
                  onTap: () => controller.goPop(),
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
              const Text(
                "Profil",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: "font/inter_bold.ttf"),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
                color: Colors.transparent,
              ),
              child: Obx(() => ListTile(
                    leading: controller.image(),
                    title: Text(controller.userName.value),
                    subtitle: Text(controller.noHp.value),
                    trailing: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EditProfilePage(1)));
                      },
                      child: Text(
                        "Ubah",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Akun",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: "font/inter_bold.ttf"),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: ListTile(
          //     leading: Icon(Icons.person),
          //     title: TextButton(
          //         onPressed: () {},
          //         child: Align(
          //           alignment: Alignment.centerLeft,
          //           child: Text(
          //             "Profil Saya",
          //             style: TextStyle(
          //                 color: Colors.black87,
          //                 fontWeight: FontWeight.normal,
          //                 fontSize: 16),
          //             textAlign: TextAlign.left,
          //           ),
          //         )),
          //     horizontalTitleGap: 0,
          //     trailing: GestureDetector(
          //       onTap: () {},
          //       child: Icon(Icons.chevron_right),
          //     ),
          //   ),
          // ),
          // Divider(
          //   thickness: 1,
          // ),
          Container(
            width: double.infinity,
            child: ListTile(
              leading: Icon(Icons.lock),
              title: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             UbahSandi(_iduser.toString())));
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ubah Kata Sandi",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  )),
              horizontalTitleGap: 0,
              trailing: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             UbahSandi(_iduser.toString())));
                },
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Divider(
            thickness: 4,
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(
          //     "Pengaturan Aplikasi",
          //     style: TextStyle(
          //         fontSize: 25,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: "font/inter_bold.ttf"),
          //   ),
          // ),

          // Container(
          //   width: double.infinity,
          //   child: ListTile(
          //     leading: Icon(Icons.book),
          //     title: TextButton(
          //         onPressed: () {},
          //         child: Align(
          //           alignment: Alignment.centerLeft,
          //           child: Text(
          //             "Preferensi Baca",
          //             style: TextStyle(
          //                 color: Colors.black87,
          //                 fontWeight: FontWeight.normal,
          //                 fontSize: 16),
          //             textAlign: TextAlign.left,
          //           ),
          //         )),
          //     horizontalTitleGap: 0,
          //     trailing: GestureDetector(
          //       onTap: () {},
          //       child: Icon(Icons.chevron_right),
          //     ),
          //   ),
          // ),
          // Divider(
          //   thickness: 5,
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Bantuan",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: "font/inter_bold.ttf"),
            ),
          ),
          Container(
            width: double.infinity,
            child: ListTile(
              leading: Icon(Icons.help),
              title: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => TentangKami()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tentang Kami",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  )),
              horizontalTitleGap: 0,
              trailing: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => TentangKami()));
                },
                child: Icon(Icons.chevron_right),
              ),
              //trailing: Icon(Icons.chevron_right),
            ),
          ),
          Divider(
            thickness: 4,
          ),
          // SizedBox(
          //   height: 50,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical4, horizontal: paddingHorozontal2),
            child: ElevatedButton(
                onPressed: () => controller.showLogoutDialog(context),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 250, 250, 250),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red.shade500, width: 1),
                        borderRadius: BorderRadiusDirectional.circular(100))),
                child: Text(
                  "Keluar",
                  style: TextStyle(color: Colors.red.shade500),
                )),
          )
        ],
      ),
    );
  }
}
