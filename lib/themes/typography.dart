import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

class OTTypography {
  static final TextStyle placeholder = TextStyle(
    color: CurrentTheme.theme.defaultTypography.withValues(alpha: .4)
  );

  static final TextStyle regular = TextStyle(
    color: CurrentTheme.theme.defaultTypography
  );

  static final TextStyle smallDesktop = TextStyle(
    color: CurrentTheme.theme.dimTypography,
    fontSize: 16
  );
}