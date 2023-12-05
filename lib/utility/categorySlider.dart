import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjust the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          categoryTile("Category 1"),
          categoryTile("Category 2"),
          categoryTile("Category 3"),
          categoryTile("Category 4"),
        ],
      ),
    );
  }
}

Widget categoryTile(String categoryName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: const Text('A'),
      ),
      label: Text(categoryName),
      // Add other styling and event handling
    ),
  );
}
