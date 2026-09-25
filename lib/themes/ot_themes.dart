import 'package:flutter/material.dart';
import 'package:overtune/themes/ot_theme_data.dart';

class OtThemes {
  static const defaultLight = OtThemeData(
    background: Color(0xFFF8F9FA),
    onBackground: Color(0xFFD7D7DD),
    surface: Color(0xFFFFFFFF),
    primary: Color(0xFF0476B5),
    defaultTypography: Color(0xFF000000),
      dimTypography: Color(0xFF222222)
  );

  static const defaultDark = OtThemeData(
      background: Color(0xFF121212),
      onBackground: Color(0xFF1E1E1E),
      surface: Color(0xFF222222),
      primary: Color(0xFF0476B5),
      defaultTypography: Color(0xFFE3E3E3),
      dimTypography: Color(0xFF888888)
  );
}