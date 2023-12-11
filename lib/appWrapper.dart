import 'package:flutter/material.dart';
import 'package:flutter_portfolio/dapp/home.dart';
import 'package:flutter_portfolio/widgets/navigation/drawer/custom_drawer.dart';
import 'package:flutter_portfolio/widgets/navigation/drawer/drawer_item.dart';
import 'package:flutter_portfolio/widgets/style/gradient_container.dart';
import 'package:flutter_portfolio/routes/testPage.dart';
import 'widgets/navigation/custom_bottom_navbar.dart';

import 'routes/landingPage.dart';
import 'routes/profilePage.dart';

class AppWrapper extends StatefulWidget {
  final String appBarTitle;

  const AppWrapper({super.key, required this.appBarTitle});

  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _selectedIndex = 0; // State for the selected index

  final List<Widget> _pages = [
    const LandingPage(),
    const UserProfilePage(),
    const Dapp(),
    const MyTest(),
    // Add the other pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final primaryColor = themeData.colorScheme.primary;
    final secondaryColor = themeData.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(widget.appBarTitle,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        actions: const <Widget>[],
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      // drawer: CustomDrawer( titleColor: secondaryColor, drawerItems: [
      //   DrawerItem(
      //       title: 'Nasa API',
      //       onTap: () => Navigator.of(context).pushNamed('/NASAApi')),
      //        DrawerItem(
      //       title: 'Dapp connect ',
      //       onTap: () => Navigator.of(context).pushNamed('Dapp Connect '))
      // ]),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: GradiantContainer(
          color1: secondaryColor,
          color2: Color.fromARGB(255, 230, 230, 247),
          child: _pages[_selectedIndex]),
    );
  }
}
