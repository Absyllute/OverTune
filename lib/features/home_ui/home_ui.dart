import 'package:flutter/material.dart';
import 'package:overtune/features/home_ui/layouts/home_desktop_layout.dart';
import 'package:overtune/features/home_ui/layouts/home_mobile_layout.dart';
import 'package:overtune/helpers/responsive_layouts.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: HomeMobileLayout(),
        desktopLayout: HomeDesktopLayout()
    );
  }
}
