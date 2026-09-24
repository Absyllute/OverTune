import 'package:flutter/material.dart';
import 'package:overtune/features/discover/layouts/discover_mobile_layout.dart';

class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  final List<Widget> _pages = [
    DiscoverMobileLayout(),
    Center(child: Text("Search Page")),
    Center(child: Text("Playlists Page")),
    Center(child: Text("Settings Page"))
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar (

        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

          selectedIndex: _selectedIndex,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: "Discover"
            ),

            NavigationDestination(
                icon: Icon(Icons.search),
                label: "Search"
            ),

            NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: "Library"
            ),

            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: "Settings"
            )
          ]
      ),

      body: _pages[_selectedIndex],
    );
  }
}
