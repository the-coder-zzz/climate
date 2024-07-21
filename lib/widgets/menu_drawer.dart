import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  // Callbacks for handling navigation actions
  final VoidCallback onHomePressed;
  final VoidCallback onFeaturedPressed;
  final VoidCallback onKnowledgePressed;
  final VoidCallback onContactPressed;

  // Constructor to initialize the callbacks
  const MenuDrawer({
    Key? key,
    required this.onHomePressed,
    required this.onFeaturedPressed,
    required this.onKnowledgePressed,
    required this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Container for the drawer content
      child: Container(
        color: Colors.blue, // Background color of the drawer
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the content
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items to the start (left)
            mainAxisAlignment:
                MainAxisAlignment.start, // Align items to the top
            children: [
              // Home menu item
              InkWell(
                onTap: () {
                  onHomePressed(); // Trigger the callback for the Home action
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Home', // Text to display for the Home menu item
                  style: TextStyle(
                      color: Colors.white, fontSize: 22), // Style for the text
                ),
              ),
              // Divider between menu items
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400, // Color of the divider
                  thickness: 2, // Thickness of the divider
                ),
              ),
              // Featured menu item
              InkWell(
                onTap: () {
                  onFeaturedPressed(); // Trigger the callback for the Featured action
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Featured', // Text to display for the Featured menu item
                  style: TextStyle(
                      color: Colors.white, fontSize: 22), // Style for the text
                ),
              ),
              // Divider between menu items
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400, // Color of the divider
                  thickness: 2, // Thickness of the divider
                ),
              ),
              // Knowledge menu item
              InkWell(
                onTap: () {
                  onKnowledgePressed(); // Trigger the callback for the Knowledge action
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Knowledge', // Text to display for the Knowledge menu item
                  style: TextStyle(
                      color: Colors.white, fontSize: 22), // Style for the text
                ),
              ),
              // Divider between menu items
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400, // Color of the divider
                  thickness: 2, // Thickness of the divider
                ),
              ),
              // Contact menu item
              InkWell(
                onTap: () {
                  onContactPressed(); // Trigger the callback for the Contact action
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Contact', // Text to display for the Contact menu item
                  style: TextStyle(
                      color: Colors.white, fontSize: 22), // Style for the text
                ),
              ),
              // Copyright text aligned at the bottom
              Expanded(
                child: Align(
                  alignment: Alignment
                      .bottomCenter, // Align the text to the bottom center
                  child: Text(
                    'Copyright © 2024 | Baldoza', // Copyright text
                    style: TextStyle(
                      color: Colors.white60, // Color of the text
                      fontSize: 14, // Font size of the text
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
