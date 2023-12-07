import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  final TileSize tileSize;

  const CategorySlider({
    super.key,
    required this.tileSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjust the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          categoryTile("Category 1", tileSize),
          categoryTile("Category 2", tileSize),
          categoryTile("Category 3", tileSize),
          categoryTile("Category 4", tileSize),
        ],
      ),
    );
  }
}

enum TileSize { small, medium, large }

Widget categoryTile(String categoryTitle, TileSize size) {
  double fontSize;
  double avatarRadius;

  switch (size) {
    case TileSize.small:
      fontSize = 10.0;
      avatarRadius = 12.0;
      break;
    case TileSize.medium:
      fontSize = 12.0;
      avatarRadius = 16.0;
      break;
    case TileSize.large:
      fontSize = 14.0;
      avatarRadius = 20.0;
      break;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        radius: avatarRadius,
        child: Text('A', style: TextStyle(fontSize: fontSize)),
      ),
      label: Text(categoryTitle, style: TextStyle(fontSize: fontSize)),
      // Add other styling and event handling
    ),
  );
}
