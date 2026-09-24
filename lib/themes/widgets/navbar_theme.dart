import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

//The prefix 'c' means 'custom'

final NavigationBarThemeData cNavbarTheme = NavigationBarThemeData(
  indicatorColor: CurrentTheme.theme.primary.withValues(alpha: .3),
  backgroundColor: CurrentTheme.theme.onBackground,

  shadowColor: CurrentTheme.theme.onBackground,

  iconTheme: .all(IconThemeData(
    color: CurrentTheme.theme.defaultTypography
  )),

  labelTextStyle: .all(TextStyle(
    color: CurrentTheme.theme.defaultTypography
  ))
);