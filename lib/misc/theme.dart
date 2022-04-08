import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFF8e97fd);
const kColorLightYellow = Color(0xFFffeccc);
const kColorLightGrey = Color(0xFFebeaec);

class primaryFont {
  static String fontFamily = 'HelveticaNeue';

  static TextStyle thin(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w100);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w300);
  }

  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w500);
  }
}
