import 'package:flutter/material.dart';
import 'package:overtune/features/discover/discover_page.dart';

class HomeDesktopLayout extends StatefulWidget {
  const HomeDesktopLayout({super.key});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DiscoverPage(),
    Center(child: Text("Search Page")),
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
              child: _pages[_selectedIndex]
          )
        ],
      ),
    );
  }
}
