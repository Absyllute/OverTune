import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_explode_dart/youtube_music_explode_dart.dart';

class SearchMobileLayout extends StatefulWidget {
  const SearchMobileLayout({super.key});

  @override
  State<SearchMobileLayout> createState() => _SearchMobileLayoutState();
}

class _SearchMobileLayoutState extends State<SearchMobileLayout> {
  bool isLoading = false;
  var ytInst = YoutubeMusicExplode();
  final searchBarController = TextEditingController();

  List<Video> searchResults = [];

  Future<void> _handleSearch(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    searchResults = await ytInst.music.searchSongs(query, limit: 50);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    ytInst.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column (
        spacing: 10,
        children: [
          SearchBar(
            hintText: "Search for a song...",
            controller: searchBarController,
            onSubmitted: (query) {
              _handleSearch(query);
            },
          ),

          if (isLoading)
            Center(child: CircularProgressIndicator())
          else
            Text("Search Results!"),

          SizedBox(height: 20)
        ],
      ),
    );
  }
}
