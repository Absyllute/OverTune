import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/themes/typography.dart';
import 'package:overtune/widgets/large_song_card.dart';
import 'package:silky_scroll/silky_scroll.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_explode_dart/youtube_music_explode_dart.dart';

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
            controller: searchBarController,
            onSubmitted: (value) {
              showResults = true;
              _handleSearch(value);
            },
          ),

          SizedBox(height: 20),

          if (!showResults)
            Expanded(
              flex: 5,
              child: Center(
                child: Container (
                  padding: .all(24),
                  decoration: BoxDecoration(
                    color: CurrentTheme.theme.surface,
                    borderRadius: .circular(24),
                    border: .all(
                      color: CurrentTheme.theme.outline,
                      width: 2
                    )
                  ),
                  child: Column (
                    mainAxisSize: .min,
                    children: [
                      Container(
                        padding: .all(16),
                        decoration: BoxDecoration(
                          shape: .circle,
                          gradient: LinearGradient(
                              colors: [
                                CurrentTheme.theme.primary.withValues(alpha: .5),
                                CurrentTheme.theme.primaryAlt.withValues(alpha: .5),
                              ],

                            begin: .topLeft,
                            end: .bottomRight
                          ),

                          border: .all(
                            color: CurrentTheme.theme.primaryAlt,
                            width: 1.5
                          )
                        ),
                        child: Icon(
                          Icons.search,
                          size: 85,
                          color: CurrentTheme.theme.defaultTypography,
                        ),
                      ),

                      Text (
                        "Discover new music!",
                        style: OTTypography.h1
                      ),
                      
                      Text(
                        "Type anything to search through a massive library of music",
                        style: .new(
                          color: CurrentTheme.theme.dimTypography,
                          fontWeight: .w600,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            SizedBox(),

          if (isLoading)
            Expanded(child: CircularProgressIndicator())
          else
            Expanded(
              child: SilkyGridView.builder(
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
