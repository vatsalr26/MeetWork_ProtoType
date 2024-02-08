// profile_screen.dart

// ignore_for_file: unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test1/second.dart'; // Import the landing page file

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the landing page
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 18, 36, 66), // Dark blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Placeholder profile picture
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Sherlock Holmes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'California, USA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFollowersFollowing('Followers', '1K'),
                    _buildFollowersFollowing('Following', '500'),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle the action to edit the profile
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileSection(
                    title: 'About Me',
                    content: 'I am a consulting detective, specializing in solving complex cases that baffle Scotland Yard.',
                  ),
                  const SizedBox(height: 20.0),
                  _buildProfileSection(
                    title: 'Work Experience',
                    content: 'Software Engineer at Baker Street Tech (2015 - Present)',
                  ),
                  const SizedBox(height: 20.0),
                  _buildProfileSection(
                    title: 'Education',
                    content: 'Bachelor\'s in Detective Science, University of London (2011 - 2015)',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowersFollowing(String title, String count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 20, 55),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
