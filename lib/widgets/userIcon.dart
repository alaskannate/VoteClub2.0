import 'package:flutter/material.dart';
import 'package:flutter_portfolio/routes/profilePage.dart';

class CustomUserIcon extends StatelessWidget {
  const CustomUserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: const Icon(Icons.account_circle, color: Colors.black)),
      onPressed: () {
        // Navigate to the profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfilePage()),
        );
      },
    );
  }
}
