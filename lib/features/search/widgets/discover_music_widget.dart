import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

import '../../../themes/typography.dart';

class DiscoverMusicWidget extends StatelessWidget {
  const DiscoverMusicWidget({super.key});

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
          Container(
            padding: .all(16),
            decoration: BoxDecoration(
                shape: .circle,
                gradient: LinearGradient(
                    colors: [
                      CurrentTheme.theme.primary.withValues(alpha: .5),
                      CurrentTheme.theme.primaryAlt.withValues(alpha: .5),
                    ],

                    begin: .topLeft,
                    end: .bottomRight
                ),

                border: .all(
                    color: CurrentTheme.theme.primaryAlt,
                    width: 1.5
                )
            ),
            child: Icon(
              Icons.search,
              size: 85,
              color: CurrentTheme.theme.defaultTypography,
            ),
          ),

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
