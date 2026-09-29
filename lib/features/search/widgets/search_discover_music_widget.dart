import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/widgets/large_icon.dart';

import '../../../themes/typography.dart';

class SearchDiscoverMusicWidget extends StatelessWidget {
  const SearchDiscoverMusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: .all(24),
      decoration: BoxDecoration(
          color: CurrentTheme.theme.surface,
          borderRadius: .circular(24),
          border: .all(
              color: CurrentTheme.theme.outline,
              width: 2
          )
      ),
      child: Column (
        mainAxisSize: .min,
        children: [
          LargeIcon(icon: Icons.search, mustAnimate: false),

          Text (
              "Discover new music!",
              style: OTTypography.h1
          ),

          Text(
            "Type anything to search through a massive library of music",
            style: .new(
                color: CurrentTheme.theme.dimTypography,
                fontWeight: .w600,
                fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}
