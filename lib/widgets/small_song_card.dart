import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../themes/typography.dart';

class SmallSongCard extends StatelessWidget {
  const SmallSongCard({super.key, required this.song});

  final Video song; // ITS A MUSIC APP!!! ~Absyllute

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(2.0),
      child: Container(
        height: 72,
        padding: .all(8),
        decoration: BoxDecoration(
          color: CurrentTheme.theme.onBackground,
          borderRadius: .circular(8),
        ),
        child: Row (
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 56,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                  borderRadius: .circular(8),
                  child: Transform.scale(
                    scale: 1.75,
                    child: Image.network(song.thumbnails.highResUrl),
                  ),
                ),
              ),
            ),

            SizedBox(width: 6),

            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text (
                              song.title,
                              overflow: .ellipsis,
                              style: OTTypography.medium
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              song.author,
                              overflow: .ellipsis,
                              style: OTTypography.smallDesktop
                          )
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
