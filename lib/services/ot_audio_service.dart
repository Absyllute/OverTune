import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// A simple service that finds the audio link and plays it for you from a single VideoId
///
/// Prevents the need to manually instantiate and manage separate stream clients
/// and audio player instances across the app.
///
/// Usage:
/// ```dart
/// final audioService = OtAudioService();
/// await audioService.startUrlPlayback('TRACK_ID_OR_URL');
/// audioService.dispose();
/// ```
///
/// ~ Absyllute

class OtAudioService {
  final YoutubeExplode ytInst;
  final AudioPlayer player;

  OtAudioService({
    AudioPlayer? player,
    YoutubeExplode? ytInst,
  })  : player = player ?? AudioPlayer(),
        ytInst = ytInst ?? YoutubeExplode();

  // Internal function for startUrlPlayback();
  // Avoid calling this function in code as it was NOT meant to be used
  // outside of this class.
  //
  // ~ Absyllute
  Future<String> getAudioStreamUrl(String songId) async {
    try {
      var manifest = await ytInst.videos.streams.getManifest(songId);

      var audioOnlyStream = manifest.audioOnly.withHighestBitrate();

      return audioOnlyStream.url.toString();
    } catch (e) {
      debugPrint("getAudioStreamUrl threw an error: $e}");
      return "";
    }
  }

  Future<void> startUrlPlayback(String songUrl) async {
    final streamUrl = await getAudioStreamUrl(songUrl);

    if (streamUrl.isNotEmpty) {
      await player.setUrl(streamUrl);
      player.play();
    }
  }

  void dispose() {
    player.dispose();
    ytInst.close();
  }
}