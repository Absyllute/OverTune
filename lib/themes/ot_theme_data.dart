// OT is short for OverTune

import 'package:flutter/material.dart';

class OtThemeData {
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color outline;
  final Color primary;
  final Color primaryAlt;
  final Color defaultTypography;
  final Color dimTypography;

  const OtThemeData({
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.outline,
    required this.primary,
    required this.primaryAlt,
    required this.defaultTypography,
    required this.dimTypography
  });
}