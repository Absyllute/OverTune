import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../global/current_theme.dart';
import '../themes/typography.dart';

class LargeSongCard extends StatefulWidget {
  final Video song; // IT'S A MUSIC APP!!! ~Absyllute
  
  const LargeSongCard({
    super.key,
    required this.song
  });

  @override
  State<LargeSongCard> createState() => _LargeSongCardState();
}

class _LargeSongCardState extends State<LargeSongCard> {
  bool _isHovered   = false;
  bool _playHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion (
      onEnter: (_) => setState(() { _isHovered = true; }),
      onExit:  (_) => setState(() { _isHovered = false; }),

      child: AnimatedScale (
        scale: _isHovered ? .97 : 1,
        duration: .new(milliseconds: 120),
        curve: Curves.bounceOut,

        child: Container(
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
                child: Stack (
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Transform.scale(
                          scale: 1.35,
                          child: Image.network(
                            widget.song.thumbnails.highResUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    AnimatedPositioned (
                      duration: .new(milliseconds: 250),
                      curve: Curves.decelerate,
                      bottom: _isHovered ? 8 : -20,
                      right: 8,
                      child: MouseRegion(
                        onEnter: (_) => setState(() { _playHovered = true; }),
                        onExit:  (_) => setState(() { _playHovered = false; }),
                        child: AnimatedContainer(
                          duration: .new(milliseconds: 250),
                          curve: Curves.decelerate,
                          padding: .all(8),
                          decoration: BoxDecoration(
                            color: _isHovered ? _playHovered ? CurrentTheme.theme.primaryAlt : CurrentTheme.theme.primary : Colors.transparent,
                            shape: .circle
                          ),

                          child: Icon(
                              Icons.play_arrow_rounded,
                              color: _isHovered ? _playHovered ? CurrentTheme.theme.dimTypography : CurrentTheme.theme.defaultTypography : Colors.transparent
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),

              SizedBox(height: 6),

              Row (
                children: [
                  Expanded(
                    child: Text(
                      "By: ${widget.song.author}",
                      style: OTTypography.placeholder,
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
                      widget.song.title,
                      style: OTTypography.medium,
                      overflow: .ellipsis,
                      maxLines: 2
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
