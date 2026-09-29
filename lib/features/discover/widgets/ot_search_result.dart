import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../themes/typography.dart';

class OTSearchResult extends StatefulWidget {
  const OTSearchResult({super.key, required this.song});

  final Video song;

  @override
  State<OTSearchResult> createState() => _OTSearchResultState();
}

class _OTSearchResultState extends State<OTSearchResult> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(5.0),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },

        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },

        child: AnimatedContainer(
          duration: .new(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: .circular(32),
            color: _isHovered ? CurrentTheme.theme.surface : CurrentTheme.theme.onBackground,
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
                        widget.song.thumbnails.highResUrl,
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
                        widget.song.title,
                        style: OTTypography.medium,
                        overflow: .ellipsis,
                        maxLines: 2
                    ),

                    Text(
                      "By: ${widget.song.author}",
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
      ),
    );
  }
}
