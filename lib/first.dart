// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'second.dart';  // Importing another Dart file 

// ignore: use_key_in_widget_constructors
class MeetworkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeetworkHomePage(),  // Set MeetworkHomePage as the home screen of the app
    );
  }
}

class MeetworkHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Stack(
          children: [
            // MeetWork text at the top right
            const Positioned(
              top: 30.0,
              right: 15.0,
              child: Text(
                'MeetWork',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 67, 123),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Welcome to Meetwork and Subtext
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 2 / 3),

                // Displaying 'Welcome to MeetWork' text
                const Text(
                  'Welcome to MeetWork',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 15),
                
                // Displaying subtext
                const Text(
                  'Where your exploration and dreams meet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'FuturisticFont',
                  ),
                ),
              ],
            ),

            // Image positioned independently
            Positioned(
              top: MediaQuery.of(context).size.height * 2 / 7 - 50,
              left: MediaQuery.of(context).size.width / 2 - 215,
              child: Image.asset(
                'assets/an.jpg',
                width: 400,
                height: 400,
              ),
            ),

            // Proceed button at the bottom right 
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LandingPage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                  onPrimary: Colors.white,
                  side: BorderSide(color: Colors.blue.shade900, width: 2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
