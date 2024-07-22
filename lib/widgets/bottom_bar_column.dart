import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  // Properties for heading and items in the column
  final String heading;

  // Constructor to initialize the properties
  BottomBarColumn({required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 20.0), // Padding at the bottom of the column
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start (left)
        children: [
          // Heading text
          Text(
            heading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10, // Space between heading and items
          ),
          // Items in the column
        ],
      ),
    );
  }
}
