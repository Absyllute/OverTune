import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_explode_dart/youtube_music_explode_dart.dart';

class SearchHelper {
  static Future<List<Video>> handleSearch(String query, YoutubeMusicExplode ytInst) async {
    if (query.trim().isEmpty) return []; // .trim() removes trailing whitespace

    try {
      final results = await ytInst.music.searchSongs(query, limit: 50);

      return results;

    } catch (e) {
       // error handling
      return [];
    }
  }
}