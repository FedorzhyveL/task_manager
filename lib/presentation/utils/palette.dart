import 'package:flutter/material.dart';

abstract class Palette {
  static const shadowColor1 = Color.fromRGBO(0, 0, 0, 0.12);
  static const shadowColor2 = Color.fromRGBO(0, 0, 0, 0.06);
  static const shadowColor3 = Color.fromRGBO(0, 0, 0, 0.2);
  static const shadowColor4 = Color.fromRGBO(0, 0, 0, 0.14);
}

abstract class LightPalette {
  static const supportSeparator = Color(0x33000000);
  static const supportOverlay = Color(0x0F000000);

  static const labelPrimary = Color(0xFF000000);
  static const labelSecondary = Color(0x99000000);
  static const labelTertiary = Color(0x4D000000);
  static const labelDisable = Color(0x26000000);

  static const red = Color(0xFFFF3B30);
  static const redOpacity = Color(0x55FF3B30);
  static const green = Color(0xFF34C759);
  static const blue = Color(0xFF007AFF);
  static const darkBlue = Color(0x55007AFF);
  static const gray = Color(0xFF8E8E93);
  static const grayLight = Color(0xFFD1D1D6);
  static const white = Color(0xFFFFFFFF);

  static const backPrimary = Color(0xFFF7F6F2);
  static const backSecondary = Color(0xFFFFFFFF);
  static const backElevated = Color(0xFFFFFFFF);
}

abstract class DarkPalette {
  static const supportSeparator = Color(0x33FFFFFF);
  static const supportOverlay = Color(0x52000000);

  static const labelPrimary = Color(0xFFFFFFFF);
  static const labelSecondary = Color(0x99FFFFFF);
  static const labelTertiary = Color(0x66FFFFFF);
  static const labelDisable = Color(0x26FFFFFF);

  static const red = Color(0xFFFF453A);
  static const redOpacity = Color(0x55FF453A);
  static const green = Color(0xFF32D74B);
  static const blue = Color(0xFF0A84FF);
  static const darkBlue = Color(0x550A84FF);
  static const gray = Color(0xFF8E8E93);
  static const grayLight = Color(0xFF48484A);
  static const white = Color(0xFFFFFFFF);

  static const backPrimary = Color(0xFF161618);
  static const backSecondary = Color(0xFF252528);
  static const backElevated = Color(0xFF3C3C3F);
}
