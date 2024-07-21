import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  // Widgets for different screen sizes
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  // Constructor to initialize the screen-specific widgets
  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  // Check if the screen width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  // Check if the screen width is greater than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  // Check if the screen width is between 800 and 1200 pixels
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Return the appropriate widget based on the screen width
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ??
              largeScreen; // Fallback to largeScreen if mediumScreen is not provided
        } else {
          return smallScreen ??
              largeScreen; // Fallback to largeScreen if smallScreen is not provided
        }
      },
    );
  }
}
