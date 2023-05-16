import 'dart:ffi';

import 'package:flutter/material.dart';

class styleNColor {
  TextStyle r(double size) {
    return TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: size);
  }

  TextStyle m(double? size) {
    return TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: size);
  }

  TextStyle sb(double? size) {
    return TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: size);
  }

  TextStyle b(double? size) {
    return TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: size);
  }
}
