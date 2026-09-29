import 'package:flutter/material.dart';
import 'package:overtune/features/discover/discover_page.dart';
import 'package:overtune/features/discover/widgets/ot_search_result.dart';
import 'package:overtune/features/search/search_page.dart';
import 'package:overtune/global/current_theme.dart';
import 'package:overtune/helpers/search_helper.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_music_explode_dart/youtube_music_explode_dart.dart';

class HomeDesktopLayout extends StatefulWidget {
  const HomeDesktopLayout({super.key});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  int _selectedIndex = 0;
  String searchQuery = "";
  Future<List<Video>>? _searchFuture;
  late final YoutubeMusicExplode ytInst;

  final List<Widget> _pages = [
    DiscoverPage(),
    SearchPage(),
    Center(child: Text("Library & Playlists")),
  ];

  @override
  void initState() {
    super.initState();
    ytInst = YoutubeMusicExplode();
  }

  @override
  void dispose() {
    ytInst.close();
    super.dispose();
  }

  void _triggerSearch(String query) {
    if (query.trim().isEmpty) return;
    setState(() {
      searchQuery = query;
      _searchFuture = SearchHelper.handleSearch(query, 5, ytInst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: Text("Discover"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: Text("Search"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.library_music_outlined),
                selectedIcon: Icon(Icons.library_music),
                label: Text("Library"),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
          ),

          Expanded(
            child: Column(
              children: [
                Container(
                  color: CurrentTheme.theme.onBackground,
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                    child: Padding(
                      padding: .only(top: 4.0, bottom: 4.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SearchBar(
                              constraints: const BoxConstraints(
                                maxWidth: 512,
                                minHeight: 64,
                              ),
                              backgroundColor: WidgetStateProperty.all(CurrentTheme.theme.background),
                              leading: Icon(Icons.search, color: CurrentTheme.theme.dimTypography, size: 32),
                              hintText: "What do you want to play?",
                              onSubmitted: _triggerSearch,
                            ),

                            if (_searchFuture != null)
                              FutureBuilder<List<Video>>(
                                future: _searchFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == .waiting) {
                                    return const Padding(
                                      padding: .all(8.0),
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    final List<Video> songs = snapshot.data!;

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: songs.length,
                                      itemBuilder: (context, index) {
                                        final song = songs[index];
                                        return OTSearchResult(song: song);
                                      },
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: .all(18.0),
                    child: _pages[_selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}