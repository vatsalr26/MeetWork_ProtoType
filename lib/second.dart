// landing_page.dart

// ignore_for_file: avoid_print, prefer_const_constructors

// Import necessary packages and Dart files
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/map_screen.dart';
import 'package:test1/messaging_screen.dart';
import 'package:test1/profile_screen.dart';
import 'package:test1/search_page.dart';

// LandingPage widget
class LandingPage extends StatelessWidget {
  // Constructor for LandingPage widget
  const LandingPage({super.key});

  // Build method for rendering the LandingPage UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetWork'),  // App bar with the title 'MeetWork'
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,  // Set a white background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text in the top right
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                'Welcome, Sherlock Holmes',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 117),
                  fontSize: 18.0,
                  fontFamily: 'Exo',  
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Job positions section
            Text(
              'Job Positions',
              style: GoogleFonts.exo(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 20, 55),  // Set to dark blue
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // List of job positions using JobPositionTile widget
            const JobPositionTile(
              title: 'Software Engineer',
              company: 'Tech Innovations',
              description: 'We are looking for a creative and experienced Software Engineer...',
              icon: Icons.code,  // Icon for Software Engineer
            ),
            const JobPositionTile(
              title: 'Data Scientist',
              company: 'Data Insights Co.',
              description: 'Join our team as a Data Scientist and contribute to cutting-edge projects...',
              icon: Icons.analytics,  // Icon for Data Scientist
            ),

            // Applications section
            const SizedBox(height: 20),
            Text(
              'Your Applications',
              style: GoogleFonts.exo(
                textStyle: const TextStyle(
                  color: Colors.blueAccent,  // Set to dark blue
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // List of applications using ApplicationTile widget
            const ApplicationTile(
              position: 'Software Engineer',
              company: 'Tech Innovations',
              status: 'Pending',
              icon: Icons.pending,  // Icon for Pending status
            ),
            const ApplicationTile(
              position: 'Data Scientist',
              company: 'Data Insights Co.',
              status: 'Accepted',
              icon: Icons.check_circle,  // Icon for Accepted status
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar for navigation between screens
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 0, 46, 125),
        unselectedItemColor: const Color.fromARGB(255, 0, 46, 125).withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          // Navigate to different screens based on the selected index
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapScreen()),
            ).then((value) {
              if (value != null) {
                print('Error navigating to MapScreen: $value');
              }
            });
          } else if (index == 2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagingScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        // Bottom Navigation Bar items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

// JobPositionTile widget for displaying job positions
class JobPositionTile extends StatelessWidget {
  final String title;
  final String company;
  final String description;
  final IconData icon;

  const JobPositionTile({
    Key? key,
    required this.title,
    required this.company,
    required this.description,
    required this.icon,
  }) : super(key: key);

  // Build method for rendering the JobPositionTile UI
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon on the left
              Icon(
                icon,
                color: Colors.white,
                size: 30,  // Set the size of the icon
              ),
              const SizedBox(width: 10),  // Add spacing between icon and text
              // Text in the middle
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Exo',  
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Company: $company',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14.0,
              fontFamily: 'Exo',  
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontFamily: 'Exo', 
            ),
          ),
        ],
      ),
    );
  }
}

// ApplicationTile widget for displaying job applications
class ApplicationTile extends StatelessWidget {
  final String position;
  final String company;
  final String status;
  final IconData icon;

  const ApplicationTile({
    Key? key,
    required this.position,
    required this.company,
    required this.status,
    required this.icon,
  }) : super(key: key);

  // Build method for rendering the ApplicationTile UI
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon on the left
              Icon(
                icon,
                color: status == 'Accepted'
                    ? const Color.fromARGB(255, 0, 78, 40)
                    : (status == 'Rejected' ? Colors.redAccent : Colors.black),
                size: 30,  // Set the size of the icon
              ),
              const SizedBox(width: 10),  // Add spacing between icon and text
              // Text in the middle
              Text(
                'Position: $position',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Exo',  
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Company: $company',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontFamily: 'Exo',  
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Status: $status',
            style: TextStyle(
              color: status == 'Accepted'
                  ? const Color.fromARGB(255, 0, 78, 40)
                  : (status == 'Rejected' ? Colors.redAccent : Colors.black),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Exo',  
            ),
          ),
        ],
      ),
    );
  }
}
