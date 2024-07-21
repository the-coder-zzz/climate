import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  // Properties for heading and items in the column
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  // Constructor to initialize the properties
  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

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
          Text(
            s1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 5, // Space between items
          ),
          Text(
            s2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 5, // Space between items
          ),
          Text(
            s3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
