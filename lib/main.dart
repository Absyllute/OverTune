import 'package:flutter/material.dart';
import 'package:overtune/features/home_ui/home_ui.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/themes/widgets/navbar_theme.dart';
import 'package:overtune/themes/widgets/navigation_rail_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OverTune',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        navigationRailTheme: cNavigationRailTheme,
        navigationBarTheme: cNavbarTheme,
        scaffoldBackgroundColor: CurrentTheme.theme.background
      ),
      home: HomeUi(),
    );
  }
}