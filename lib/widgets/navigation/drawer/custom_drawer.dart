import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/navigation/drawer/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final Color titleColor;
  final List<DrawerItem> drawerItems;

  const CustomDrawer(
      {super.key, required this.titleColor, required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: titleColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ...drawerItems
              .map((item) => ListTile(
                    title: Text(item.title),
                    onTap: item.onTap,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
