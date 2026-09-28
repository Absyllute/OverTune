import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

class LargeIcon extends StatelessWidget {
  const LargeIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        icon,
        size: 85,
        color: CurrentTheme.theme.defaultTypography,
      ),
    );
  }
}
