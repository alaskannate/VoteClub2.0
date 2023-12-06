import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String? userName;
  final String? profileImageUrl;
  final String? bio;
  final String? email;
  final int? followersCount;
  final double? avatarRadius;
  

  const UserProfilePage({
    super.key,
    this.userName,
    this.profileImageUrl,
    this.bio,
    this.email,
    this.followersCount = 0,
    this.avatarRadius = 50 ,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),
            Text('User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Short Bio',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            // Add more widgets here for additional user info
          ],
        ),
      ),
    );
  }
}
