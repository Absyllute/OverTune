import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/themes/typography.dart';

final SearchBarThemeData cSearchBarTheme = SearchBarThemeData(
  backgroundColor: .all(CurrentTheme.theme.onBackground),
  elevation: .all(0),
  hintStyle: .all(OTTypography.placeholder),
  textStyle: .all(OTTypography.regular),
);

final TextSelectionThemeData cTextSelectionThemeData = TextSelectionThemeData(
  cursorColor: CurrentTheme.theme.primary,
  selectionHandleColor: CurrentTheme.theme.primary,
  selectionColor: CurrentTheme.theme.primary
);