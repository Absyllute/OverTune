import 'package:flutter/material.dart';
import 'package:overtune/features/discover/widgets/unlock_discover.dart';

class DiscoverDesktopLayout extends StatelessWidget {
  const DiscoverDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UnlockDiscover(),
    );
  }
}
