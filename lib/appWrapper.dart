import 'package:flutter/material.dart';
import 'package:flutter_portfolio/routes/testPage.dart';
import 'widgets/customUserIcon.dart';
import 'widgets/customBottomNavbar.dart';

import 'routes/landingPage.dart';
import 'routes/profilePage.dart';


class AppWrapper extends StatefulWidget {
  final String appBarTitle;


  const AppWrapper( {
  super.key, 
  required this.appBarTitle});

  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _selectedIndex = 0; // State for the selected index

  final List<Widget> _pages = [
    const LandingPage(),
    const UserProfilePage(),
    const MyTest(),
    // Add the other pages as needed
  ];


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final primaryColor = themeData.colorScheme.primary;
    final secondaryColor = themeData.colorScheme.secondary;


    return 
    Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(widget.appBarTitle,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        actions: const <Widget>[
          
        ],
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      bottomNavigationBar:  CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                secondaryColor,
                Colors.white,
              ],
            ),
          ),
        child: _pages[_selectedIndex]),
          );
    }
  }
