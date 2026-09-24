import 'package:flutter/material.dart';
import 'package:overtune/themes/ot_theme_data.dart';

class OtThemes {
  static const defaultLight = OtThemeData(
  background: Color(0xFFF8F9FA),
  surface: Color(0xFFFFFFFF),
  primary: Color(0xFF6750A4)
  );

  static const defaultDark = OtThemeData(
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      primary: Color(0xFF625B71)
  );
}