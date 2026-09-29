import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../themes/typography.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.song});

  final Video song;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(12),
        color: CurrentTheme.theme.onBackground,
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Transform.scale(
              scale: 1.35,
              child: Image.network(
                song.thumbnails.highResUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 16),

          Column(
            mainAxisSize: .min,
            children: [
              Text(
                  song.title,
                  style: OTTypography.medium,
                  overflow: .ellipsis,
                  maxLines: 2
              ),

              Text(
                "By: ${song.author}",
                style: OTTypography.placeholder,
                overflow: .ellipsis,
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
