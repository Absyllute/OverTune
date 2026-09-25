import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../global/current_theme.dart';

class LargeSongCard extends StatelessWidget {
  final Video song; // IT'S A MUSIC APP!!! ~Absyllute
  
  const LargeSongCard({
    super.key,
    required this.song
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CurrentTheme.theme.onBackground,
      padding: .all(12),

      child: Column(
        children: [
          Image.network(song.thumbnails.highResUrl),
          Text(song.title),
          Text(song.author)
        ],
      ),
    );
  }
}
