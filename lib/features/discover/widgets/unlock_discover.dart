import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/themes/typography.dart';
import 'package:overtune/widgets/large_icon.dart';

class UnlockDiscover extends StatelessWidget {
  const UnlockDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(24),
      decoration: BoxDecoration(
        color: CurrentTheme.theme.onBackground,
        borderRadius: .circular(24)
      ),

      child: Column(
        spacing: 12,
        mainAxisSize: .min,
        children: [
          LargeIcon(icon: Icons.explore),
          Text("Build your discover feed!", style: OTTypography.h1),
          Text(
              "Play a few songs so that we can build your discover feed based on your interests",
              style: .new(
                color: CurrentTheme.theme.dimTypography,
                fontWeight: .w600,
                fontSize: 18
              )
          )
        ],
      ),
    );
  }
}
