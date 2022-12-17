import 'dart:ui';

import 'package:flutter/material.dart';

extension XPadding on Widget {
  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding paddingLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Padding paddingRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Padding paddingBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Padding paddingTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Padding paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Padding paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }
}

class AppTheme {
  static const double elementSpacing = 16;

  static const Color appblue = const Color(0xFF2669A4);
  static const Color appWhite = const Color(0xFFFFFFFF);
  static const Color appBlack = const Color(0xFF3E3D3D);
  static const Color appLightGrey = const Color(0xFFE6E7E8);
  static const Color appGrey = Color(0xFF707070);
  static const Color appOrange = Color(0xFFE39219);

  static ThemeData theme = ThemeData(
    primaryColor: appblue,
    backgroundColor: appWhite,
  );
}
