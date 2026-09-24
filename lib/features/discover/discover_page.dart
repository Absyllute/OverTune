import 'package:flutter/material.dart';
import 'package:overtune/features/discover/layouts/discover_desktop_layout.dart';
import 'package:overtune/features/discover/layouts/discover_mobile_layout.dart';
import 'package:overtune/helpers/responsive_layouts.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: DiscoverMobileLayout(),
        desktopLayout: DiscoverDesktopLayout()
    );
  }
}
