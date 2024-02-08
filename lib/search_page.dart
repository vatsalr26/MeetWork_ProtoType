// search_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetWork'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            Text(
              'Categories',
              style: GoogleFonts.exo(
                textStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Category buttons with icons
            const CategoryButton(
              title: 'Design',
              icon: Icons.brush, // Icon for Design category
            ),
            const CategoryButton(
              title: 'Finance',
              icon: Icons.attach_money, // Icon for Finance category
            ),
            const CategoryButton(
              title: 'Education',
              icon: Icons.school, // Icon for Education category
            ),
            const CategoryButton(
              title: 'Programmer',
              icon: Icons.code, // Icon for Programmer category
            ),
            const CategoryButton(
              title: 'Health',
              icon: Icons.health_and_safety,
            ),
            const CategoryButton(
              title: 'Restaurant',
              icon: Icons.food_bank
            ),
        
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Set a custom height for the category buttons
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue[800], // Dark blue color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon on the left
          Icon(
            icon,
            color: Colors.white,
            size: 40, // Set the size of the icon
          ),
          // Text in the middle
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0, // Increase font size
              fontWeight: FontWeight.bold,
              fontFamily: 'FuturisticFont', // Use a futuristic font
            ),
          ),
          // Placeholder for potential additional content on the right
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
