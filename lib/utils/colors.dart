import 'package:flutter/material.dart';

class MainColor {
  static const int _primaryPrimaryValue = 0xFF50B498;
  static const int _primaryTextValue = 0xFF6C7072;
  static const secondary = Color(0xFF9CDBA6);
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE3EAEC),
    100: Color(0xFFB8CAD1),
    200: Color(0xFF89A7B2),
    300: Color(0xFFF3E5DC),
    400: Color(0xFFFF5D5A),
    500: Color(0xFFDFAF45),
    600: Color(_primaryPrimaryValue),
    700: Color(0xFF0E3D52),
    800: Color(0xFF0B3548),
    900: Color(0xFF062536),
  });
  static const MaterialColor text =
      MaterialColor(_primaryTextValue, <int, Color>{
    600: Color(_primaryTextValue),
  });
  static const MaterialColor skyBase =
      MaterialColor(0xFFCDCFD0, <int, Color>{});
  static const MaterialColor skyDark =
      MaterialColor(0xFF979C9E, <int, Color>{});
  static const MaterialColor skyLight =
      MaterialColor(0xFFE3E5E5, <int, Color>{});
  static const MaterialColor skyLighter =
      MaterialColor(0xFFF2F4F5, <int, Color>{});
  static const MaterialColor inkLighter =
      MaterialColor(0xFF72777A, <int, Color>{});
  static const MaterialColor inkDarker =
      MaterialColor(0xFF202325, <int, Color>{});
  static const MaterialColor inkDarkest =
      MaterialColor(0xFF090A0A, <int, Color>{});

  static const MaterialColor blueLightest =
      MaterialColor(0xFFC9F0FF, <int, Color>{});
  static const MaterialColor blueDarkest =
      MaterialColor(0xFF0065D0, <int, Color>{});
  static const MaterialColor greenDarkest =
      MaterialColor(0xFF198155, <int, Color>{});
  static const MaterialColor greenLightest =
      MaterialColor(0xFFECFCE5, <int, Color>{});
}
