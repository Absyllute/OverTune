import 'package:flutter/material.dart';
import 'package:overtune/features/discover/discover_page.dart';
import 'package:overtune/features/search/search_page.dart';
import 'package:overtune/global/current_theme.dart';
/* The files named 'home' only store 'overlay widgets' like the NavigationRail
 * and Navigation Bar. The default screen is the Discover page. There is no "home_page.dart"
 * ~ Absyllute
 */

class HomeDesktopLayout extends StatefulWidget {
  const HomeDesktopLayout({super.key});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DiscoverPage(),
    SearchPage(),
    Center(child: Text("Library & Playlists"),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text("Discover")
              ),

              NavigationRailDestination(
                  icon: Icon(Icons.search),
                  selectedIcon: Icon(Icons.search),
                  label: Text("Search")
              ),

              NavigationRailDestination(
                  icon: Icon(Icons.library_music_outlined),
                  selectedIcon: Icon(Icons.library_music),
                  label: Text("Library")
              )
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
                PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: Container(
                    color: CurrentTheme.theme.onBackground,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: SafeArea(
                      child: Padding(
                        padding: .only(top: 4.0, bottom: 4.0),
                        child: Center(
                          child: SearchBar(
                            constraints: BoxConstraints(
                              maxWidth: 512,
                              minHeight: 64
                            ),
                            backgroundColor: WidgetStateProperty.all(CurrentTheme.theme.background),
                            leading: Icon(Icons.search, color: CurrentTheme.theme.dimTypography, size: 32),
                            hintText: "What do you want to play?",
                          ),
                        ),
                      ),
                    ),
                  )
                ),

                Expanded(
                    child: _pages[_selectedIndex]
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
