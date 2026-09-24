import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

final cNavigationRailTheme = NavigationRailThemeData(
  backgroundColor: CurrentTheme.theme.onBackground,
  indicatorColor: CurrentTheme.theme.primary,
  selectedIconTheme: IconThemeData(
    color: CurrentTheme.theme.onBackground
  ),

  selectedLabelTextStyle: TextStyle(
    color: CurrentTheme.theme.defaultTypography
  )
);

