import 'package:flutter/material.dart';
import 'package:overtune/widgets/large_song_card.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_explode_dart/youtube_music_explode_dart.dart';

import '../../../themes/typography.dart';

class SearchDesktopLayout extends StatefulWidget {
  const SearchDesktopLayout({super.key});

  @override
  State<SearchDesktopLayout> createState() => _SearchDesktopLayoutState();
}

class _SearchDesktopLayoutState extends State<SearchDesktopLayout> {
  final searchBarController = TextEditingController();
  bool showResults = false;
  bool isLoading = false; // These two have very different purposes ~ Absyllute (remember to document)

  List<Video> searchResults = [];

  var ytInst = YoutubeMusicExplode();

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  Future<void> _handleSearch(String query) async {
    if (query.trim().isEmpty) return; // .trim() removes trailing whitespace

    setState(() {
      isLoading = true;
      showResults = true;
    });

    try {
      final results = await ytInst.music.searchSongs(query, limit: 50);

      setState(() {
        searchResults = results;
        isLoading = false;
      });
    } catch (e) {
      isLoading = false; // error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(18.0),
      child: Column(
        children: [
          SearchBar (
            hintText: "Search for a song...",
            hintStyle: .all(OTTypography.placeholder),
            controller: searchBarController,
            onSubmitted: (value) {
              showResults = true;
              _handleSearch(value);
            },
          ),

          if (isLoading)
            Expanded(child: CircularProgressIndicator())
          else
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent (
                  maxCrossAxisExtent: 220,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .70
                ),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return LargeSongCard(song: searchResults[index]);
                },
              )
            )
        ],
      ),
    );
  }
}
