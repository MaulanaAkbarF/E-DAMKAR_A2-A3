import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/pages/profil.dart';
import 'package:edamkar_1/SharedPreferences/dataUser.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = '';

  void getUserData() async {
    var data = DataUser().getNama();
    data.then((value) {
      setState(() {
        userName = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorozontal1, vertical: paddingVertical1),
        // child: ,
      )),
      bottomNavigationBar: AppMenu(),
    );
  }
}
