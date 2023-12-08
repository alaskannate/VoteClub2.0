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
      height: 120, // Adjust the height as needed
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
  double padding;
  double fontSize;
  double avatarRadius;

  switch (size) {
    case TileSize.small:
      padding = 10.0;
      fontSize = 12.0;
      avatarRadius = 12.0;
      break;
    case TileSize.medium:
      padding = 12.0;
      fontSize = 16.0;
      avatarRadius = 16.0;
      break;
    case TileSize.large:
      padding = 12.0;
      fontSize = 20.0;
      avatarRadius = 15.0;
      break;
  }

  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: padding),
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
