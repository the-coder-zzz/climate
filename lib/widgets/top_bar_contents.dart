import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  // Callbacks for button presses
  final VoidCallback onHomePressed;
  final VoidCallback onFeaturedPressed;
  final VoidCallback onKnowledgePressed;
  final VoidCallback onContactPressed;

  // Constructor to initialize the callbacks
  TopBarContents({
    required this.onHomePressed,
    required this.onFeaturedPressed,
    required this.onKnowledgePressed,
    required this.onContactPressed,
  });

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  // List to keep track of hover states for each menu item
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title of the website
              Text(
                'Climate Solutionize',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 7),
                    SizedBox(width: screenSize.width / 60),
                    // Build menu items with respective callbacks
                    _buildMenuItem(0, 'Home', widget.onHomePressed),
                    SizedBox(width: screenSize.width / 20),
                    _buildMenuItem(1, 'Featured', widget.onFeaturedPressed),
                    SizedBox(width: screenSize.width / 20),
                    _buildMenuItem(2, 'Knowledge', widget.onKnowledgePressed),
                    SizedBox(width: screenSize.width / 20),
                    _buildMenuItem(3, 'Contact', widget.onContactPressed),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a menu item with hover effect and callback
  Widget _buildMenuItem(int index, String title, VoidCallback onPressed) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering[index] = value;
        });
      },
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Menu item text
          Text(
            title,
            style: TextStyle(
              color: _isHovering[index] ? Color(0xFF077bd7) : Color(0xFF077bd7),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          // Underline indicator for hover effect
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering[index],
            child: Container(
              height: 2,
              width: 20,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
