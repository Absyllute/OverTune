import 'package:flutter/material.dart';
import 'package:overtune/features/search/layouts/search_desktop_layout.dart';
import 'package:overtune/features/search/layouts/search_mobile_layout.dart';
import 'package:overtune/helpers/responsive_layouts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: SearchMobileLayout(),
        desktopLayout: SearchDesktopLayout()
    );
  }
}
