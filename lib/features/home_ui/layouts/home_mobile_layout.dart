import 'package:flutter/material.dart';
import 'package:overtune/features/discover/layouts/discover_mobile_layout.dart';
/* The files named 'home' only store 'overlay widgets' like the NavigationRail
 * and Navigation Bar. The default screen is the Discover page. There is no "home_page.dart"
 * ~ Absyllute
 */

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
                selectedIcon: Icon(Icons.explore_rounded),
                label: "Discover"
            ),

            NavigationDestination(
                icon: Icon(Icons.search_rounded),
                selectedIcon: Icon(Icons.search_rounded),
                label: "Search"
            ),

            NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: "Library"
            ),

            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings_rounded),
                label: "Settings"
            )
          ]
      ),

      body: _pages[_selectedIndex],
    );
  }
}
