import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../themes/typography.dart';

class OTSearchResult extends StatelessWidget {
  const OTSearchResult({super.key, required this.song});

  final Video song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(32),
          color: CurrentTheme.theme.onBackground,
        ),

        child: Row(
          children: [
            SizedBox(
              width: 63.5,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ClipOval(
                  child: Transform.scale(
                    scale: 1.35,
                    child: Image.network(
                      song.thumbnails.highResUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
