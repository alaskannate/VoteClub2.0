import 'package:flutter/material.dart';
import '../widgets/customUserIcon.dart';

class StyleWrapper extends StatelessWidget {
  final Widget child;
  final String appBarTitle;

  const StyleWrapper({super.key, required this.child, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // Gets the primary and secondary colors from the theme (located on file main.dart)
    final primaryColor = themeData.colorScheme.primary;
    final secondaryColor = themeData.colorScheme.secondary;

    return 
    Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(appBarTitle,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        actions: const <Widget>[
          CustomUserIcon(),
        ],
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
          child: child,
          ),
    );
    }
  }
