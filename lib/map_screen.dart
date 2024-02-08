// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

// Import necessary packages and Dart files
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// MapScreen widget
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

// _MapScreenState private class
class _MapScreenState extends State<MapScreen> {
  late VideoPlayerController _controller;

  // Function to navigate back
  void _navigateBack() {
    Navigator.pop(context);
  }

  // Initialize video controller in the initState method
  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  Future<void> _initializeVideoController() async {
    _controller = VideoPlayerController.asset('assets/map.mp4');
    await _controller.initialize();
    _controller.setLooping(true); // Loop the video
    // Ensure the first frame is shown after the video is initialized
    if (mounted) {
      setState(() {});
    }
  }

  // Dispose of the video controller when the widget is disposed
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Build method for rendering the MapScreen UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 0, 20, 55), // Dark blue
                  Color.fromARGB(255, 0, 46, 125), // Lighter blue
                ],
              ),
            ),
          ),
          // Back Button
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: InkWell(
              onTap: _navigateBack,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          ),
          // Video Player
          FutureBuilder(
            future: _controller.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _controller.play(); // Autoplay after initialization
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Video Player
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    // Connection Details
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Distance Icon and Text
                          Column(
                            children: [
                              Icon(Icons.place, color: Colors.white, size: 40),
                              SizedBox(height: 8),
                              Text(
                                '12 km',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          // Connection Icon and Text
                          Column(
                            children: [
                              Icon(Icons.people, color: Colors.white, size: 40),
                              SizedBox(height: 8),
                              Text(
                                '5 Connections',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          // Email Icon and Text
                          Column(
                            children: [
                              Icon(Icons.email, color: Colors.white, size: 40),
                              SizedBox(height: 8),
                              Text(
                                'Send Email',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          // Placeholder Icon and Text
                          Column(
                            children: [
                              Icon(Icons.more_horiz, color: Colors.white, size: 40),
                              SizedBox(height: 8),
                              Text(
                                'More Info',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Connection Names
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Connections',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ConnectionNameTile(name: 'Yves Saint Laurent'),
                            ConnectionNameTile(name: 'Hugo Boss'),
                            ConnectionNameTile(name: 'Romeo Palindrome'),
                            ConnectionNameTile(name: 'Albert Einstein'),
                            ConnectionNameTile(name: 'Charles Babbage'),
                          ],
                        ),
                      ),
                    ),
                    // Text at the bottom
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                      child: Text(
                        'Expand your circle and make yourself known',
                        style: TextStyle(
                          color: Color.fromARGB(255, 105, 146, 130),
                          fontSize: 28.0,
                          fontFamily: 'Roboto', 
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

// ConnectionNameTile widget for displaying individual connection names
class ConnectionNameTile extends StatelessWidget {
  final String name;

  ConnectionNameTile({required this.name});

  // Build method for rendering the ConnectionNameTile UI
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
