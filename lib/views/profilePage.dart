import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utility/categorySlider.dart';

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
    
    return SingleChildScrollView(
          child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                       margin: const EdgeInsets.all(8),
                      width: 500,
                      height: 300,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255), // Optional: set a background color
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(05),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          // Bottom right is not rounded due to the cutout
                        ),
                      ),
                      child:const Column( children: [
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
            
                      ],)
                    ),
                    const Row(children: [ Text('Active Campangin'), ],),
                    const CategorySlider(tileSize: TileSize.large),
                    Container(width: 500, height: 2000, decoration: const BoxDecoration(color: Color.fromARGB(0, 255, 193, 7)))
            
                  ],
                ),
              ),
        );
  }
}
