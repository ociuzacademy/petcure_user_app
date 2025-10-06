// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/modules/edit_profile_module/view/edit_profile_page.dart';
import 'package:petcure_user_app/modules/home_module/widgets/profile_item.dart';

class UserProfileWidget extends StatelessWidget {
  final VoidCallback logout;
  const UserProfileWidget({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    // Dispatch the event once when the widget is built

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(
                      'https://i.pravatar.cc/300',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Details
            ProfileItem(icon: Icons.person, title: 'Name', value: 'John Doe'),
            ProfileItem(
              icon: Icons.email,
              title: 'Email',
              value: 'user@email.com',
            ),
            ProfileItem(
              icon: Icons.phone,
              title: 'Phone',
              value: '+91 9876543210',
            ),
            ProfileItem(icon: Icons.pets, title: 'Number of Pets', value: '10'),
            ProfileItem(
              icon: Icons.location_on,
              title: 'Address',
              value:
                  '3058 Peck Court, Costa Mesa, California, 92627, United States.',
            ),

            const SizedBox(height: 20),

            // Edit & Logout Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    pushWithoutNavBar(context, EditProfilePage.route());
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                ),
                ElevatedButton.icon(
                  onPressed: logout,
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
