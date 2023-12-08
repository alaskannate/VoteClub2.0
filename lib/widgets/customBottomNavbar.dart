import 'package:flutter/material.dart';


class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected; 

   const CustomBottomNavBar({super.key, required this.selectedIndex, required this.onDestinationSelected});


@override
_CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
int currentPageIndex = 0; 

@override
Widget build(BuildContext context) {
  return  NavigationBar(
      onDestinationSelected: (int index) {
        // Use the callback from the parent to update the state there
        widget.onDestinationSelected(index);
      },

    indicatorColor: Colors.amber,
    selectedIndex: widget.selectedIndex,
    destinations: const <Widget>[
                  NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            
          ),
                    NavigationDestination(
            icon: Badge(child: Icon(Icons.supervised_user_circle_outlined)),
            label: 'Profile',
          ),
                              NavigationDestination(
            icon: Badge(child: Icon(Icons.fact_check_outlined)),
            label: 'Tests',
          ),

      ],);
    
    
  }
}