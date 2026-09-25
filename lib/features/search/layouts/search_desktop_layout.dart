import 'package:flutter/material.dart';

import '../../../themes/typography.dart';

class SearchDesktopLayout extends StatelessWidget {
  const SearchDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(18.0),
      child: Column(
        children: [
          SearchBar(
            hintText: "Search for a song...",
            hintStyle: .all(OTTypography.placeholder),

          )
        ],
      ),
    );
  }
}
