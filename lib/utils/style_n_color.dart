import 'package:edamkar_1/utils/app_style.dart';
import 'package:flutter/material.dart';

class styleNColor {
  TextStyle r({double? size, Color? color}) {
    var sz = size ?? 12;
    var clr = color ?? black;
    return TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: sz,
        color: clr);
  }

  TextStyle m({double? size, Color? color}) {
    var sz = size ?? 12;
    var clr = color ?? black;
    return TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: sz,
        color: clr);
  }

  TextStyle sb({double? size, Color? color}) {
    var sz = size ?? 12;
    var clr = color ?? black;
    return TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: sz,
        color: clr);
  }

  TextStyle b([double? size, Color? color]) {
    var sz = size ?? 12;
    var clr = color ?? black;
    return TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: sz,
        color: clr);
  }
}
