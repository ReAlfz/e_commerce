import 'package:flutter/material.dart';

class SfTextStyles {
  static TextStyle fontBold({
    Color color = Colors.black,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'sf bold',
    );
  }

  static TextStyle fontSemiBold({
    Color color = Colors.black,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: 'sf semi-bold',
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle fontRegular({
    Color color = Colors.black,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: 'sf regular',
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle fontMedium({
    Color color = Colors.black,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: 'sf medium',
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
