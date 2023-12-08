import 'package:flutter/material.dart';
import 'views/landingPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utility/introManger.dart';
import 'appWrapper.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;

void main() {
  runApp(const DappVoteClub());
}

class DappVoteClub extends StatelessWidget {
  
  const DappVoteClub({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Vote';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 0, 122),
          // ···
          brightness: Brightness.light,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: FutureBuilder<bool>(
        future: IntroManager.isFirstLaunch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.data == true) {
            // User is opening the app for the first time
            return const IntroScreenOnFirstOpen();
          } else {
            return const AppWrapper( appBarTitle: appName,
            ); // Replace with your main home screen widget
          }
        },
      ),
    );
  }
}

class IntroScreenOnFirstOpen extends StatelessWidget {
  const IntroScreenOnFirstOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to the app! This is an intro screen.'),
      ),
    );
  }
}

