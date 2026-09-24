import 'package:flutter/material.dart';

// This is a helper widget for easily controlling what layouts the app should use depending on the user's screen size ~Absyllute
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    required this.desktopLayout
  });

  /*  Usually the tablet layout would just use the desktop layout.
   *  But if that's not possible, a dedicated tablet layout is still an option
   *  ~ Absyllute
   */

  final Widget  mobileLayout;
  final Widget? tabletLayout;
  final Widget  desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return mobileLayout;
          } if (constraints.maxWidth < 700 && tabletLayout != null) {
            return tabletLayout!; // Maneesh on the beat, shabang! (get it, cause of the bang '!' :D ) ~Absyllute
          } else {
            return desktopLayout;
          }
        },
    );
  }
}

class LayoutChecker {
  // Useful checker bools
  static bool isMobile  (BuildContext context) => MediaQuery.of(context).size.width < 500;
  static bool isTablet  (BuildContext context) => MediaQuery.of(context).size.width > 500 && MediaQuery.of(context).size.width < 1000;
  static bool isDesktop (BuildContext context) => MediaQuery.of(context).size.width >= 1000;
}
