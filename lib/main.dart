import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/postTile.dart';
import 'widgets/postTile.dart';
import 'utility/categorySlider.dart';
import 'model/post.dart';
import 'routes/landing_routes/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utility/introManger.dart';

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
            return const LandingPage(
              title: appName,
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

class LandingPage extends StatelessWidget {
  final String title;

  const LandingPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // Get the primary and secondary colors from the theme
    final primaryColor = themeData.colorScheme.primary;
    final secondaryColor = themeData.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        actions: <Widget>[
          IconButton(
            icon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: const Icon(Icons.account_circle, color: Colors.black)),
            onPressed: () {
              // Navigate to the profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              );
            },
          ),
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
        child: Column(
          children: <Widget>[
            const CategorySlider(),
            Expanded(
                child: ListView.builder(
              itemCount: samplePosts.length,
              itemBuilder: (context, index) {
                final post = samplePosts[index];
                return PostTile(
                  postName: post.postTitle,
                  details: post.details,
                  isSwitchOn: post.isSwitchOn,
                  onSwitchChanged: (bool newValue) {
                    post.isSwitchOn = newValue;
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
