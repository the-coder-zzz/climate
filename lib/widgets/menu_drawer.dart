import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onFeaturedPressed;
  final VoidCallback onKnowledgePressed;
  final VoidCallback onContactPressed;

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
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  onHomePressed();
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  onFeaturedPressed();
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Featured',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  onKnowledgePressed();
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Knowledge',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  onContactPressed();
                  Navigator.of(context).pop(); // Close the drawer
                },
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2024 | Baldoza',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
