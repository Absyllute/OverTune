import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../global/current_theme.dart';
import '../themes/typography.dart';

class LargeSongCard extends StatelessWidget {
  final Video song; // IT'S A MUSIC APP!!! ~Absyllute
  
  const LargeSongCard({
    super.key,
    required this.song
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: CurrentTheme.theme.onBackground,
        borderRadius: .circular(12)
      ),

      child: Column(
        crossAxisAlignment: .start,
        children: [
          AspectRatio (
            aspectRatio: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Transform.scale(
                scale: 1.35,
                child: Image.network(
                  song.thumbnails.highResUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(height: 6),

          Row (
            children: [
              Expanded(
                child: Text(
                  "By: ${song.author}",
                  style: OTTypography.smallDesktop,
                  overflow: .ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  song.title,
                  style: OTTypography.regular,
                  overflow: .ellipsis,
                  maxLines: 2
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
