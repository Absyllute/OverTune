import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

class OTTypography {
  static final TextStyle placeholder = TextStyle(
    color: CurrentTheme.theme.defaultTypography.withValues(alpha: .4)
  );

  static final TextStyle h1 = TextStyle (
      fontSize: 32,
      color: CurrentTheme.theme.defaultTypography,
      fontWeight: .bold
  );

  static final TextStyle regular = TextStyle(
    color: CurrentTheme.theme.defaultTypography
  );

  static final TextStyle smallDesktop = TextStyle(
    color: CurrentTheme.theme.dimTypography,
    fontSize: 16
  );

  static final TextStyle medium = TextStyle(
    fontSize: 17,
    color: CurrentTheme.theme.defaultTypography,
    fontWeight: .bold
  );
}