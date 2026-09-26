import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../themes/typography.dart';

class SmallSongCard extends StatelessWidget {
  const SmallSongCard({super.key, required this.song});

  final Video song; // ITS A MUSIC APP!!! ~Absyllute

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: CurrentTheme.theme.onBackground,
        borderRadius: .circular(8),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: ClipRRect(
              borderRadius: .circular(8),
              child: Transform.scale(
                scale: 1.25,
                child: Image.network(song.thumbnails.highResUrl),
              ),
            ),
          ),

          Column(
            mainAxisSize: .min,
            children: [
              Text(song.title, style: OTTypography.regular),
              Text(song.author, style: OTTypography.smallDesktop)
            ],
          )
        ],
      ),
    );
  }
}
