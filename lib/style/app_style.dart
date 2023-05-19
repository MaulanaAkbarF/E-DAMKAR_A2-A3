import 'dart:math';

import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';

final paddingHorozontal1 = SizeConfig.blockSizeHorizontal! * 2;
final paddingHorozontal2 = SizeConfig.blockSizeHorizontal! * 4;
final paddingHorozontal4 = SizeConfig.blockSizeHorizontal! * 10;
final paddingVertical1 = SizeConfig.blockSizeVertical! * 2;
final paddingVertical2 = SizeConfig.blockSizeVertical! * 4;
final paddingVertical3 = SizeConfig.blockSizeVertical! * 6;
final paddingVertical4 = SizeConfig.blockSizeVertical! * 10;

const thin1 = TextStyle(
    fontFamily: 'font/inter-medium', fontWeight: FontWeight.w400, fontSize: 14);
const reguler =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 12);
const medium =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 15);
const semibold =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18);
const bold =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 20);
const extrabold =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 20);
const blackft =
    TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 20);

const red1 = Color(0xffe02424);
const green1 = Color(0xff25d366);
const green2 = Color(0xff128C7E);
const grey1 = Color(0xffD9D9D9);
final grey2 = Colors.grey.shade200;
const grey3 = Color(0xffD1D5DB);
const black = Colors.black;
const black2 = Color.fromARGB(255, 107, 114, 128);
const black3 = Color.fromARGB(255, 51, 51, 51);
const orange1 = Color(0xffF33C04);
const orange2 = Color(0xffFDE8E8);
const white = Colors.white;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
