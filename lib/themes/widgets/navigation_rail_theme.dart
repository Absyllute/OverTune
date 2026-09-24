import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

final cNavigationRailTheme = NavigationRailThemeData(
  backgroundColor: CurrentTheme.theme.onBackground,
  indicatorColor: CurrentTheme.theme.primary,

  selectedIconTheme: IconThemeData(
    color: CurrentTheme.theme.defaultTypography
  ),

  selectedLabelTextStyle: TextStyle(
    color: CurrentTheme.theme.defaultTypography,
    fontWeight: .bold
  ),

  unselectedIconTheme: IconThemeData (
    color: CurrentTheme.theme.defaultTypography,
  ),

  unselectedLabelTextStyle: TextStyle(
    color: CurrentTheme.theme.defaultTypography
  )
);

