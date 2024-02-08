// messaging_screen.dart

// ignore_for_file: prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

// MessagingScreen widget
class MessagingScreen extends StatelessWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  // Build method for rendering the MessagingScreen UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),  // App bar with the title 'Inbox'
      ),
      body: Container(
        // Container with gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 47, 29, 92), // Dark blue
              Color.fromARGB(255, 18, 36, 66), // Lighter blue
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 16.0),

              // Message List
              Expanded(
                child: ListView(
                  children: [
                    // Message Item using MessageItem widget
                    const MessageItem(
                      sender: 'John Doe',
                      message: 'Hey, are you available for a quick chat?',
                      time: '10:30 AM',
                      isNew: true,
                    ),
                    // Message Item using MessageItem widget
                    const MessageItem(
                      sender: 'Jane Smith',
                      message: 'Regarding the upcoming project...',
                      time: 'Yesterday',
                      isNew: false,
                    ),
                    // Additional Messages using MessageItem widget
                    const MessageItem(
                      sender: 'Alice Johnson',
                      message: 'How is the progress going?',
                      time: '2 days ago',
                      isNew: false,
                    ),
                    const MessageItem(
                      sender: 'Bob Williams',
                      message: 'Lets schedule a meeting for next week.',
                      time: '3 days ago',
                      isNew: true,
                    ),
                    const MessageItem(
                      sender: 'Eva Davis',
                      message: 'Did you receive the latest files?',
                      time: '4 days ago',
                      isNew: false,
                    ),
                    // Add more message items as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Floating Action Button for adding a new message
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action to add a new message
          // You can navigate to a new screen or show a dialog for adding a message
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// MessageItem widget for displaying individual messages
class MessageItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isNew;

  const MessageItem({
    Key? key,
    required this.sender,
    required this.message,
    required this.time,
    required this.isNew,
  }) : super(key: key);

  // Build method for rendering the MessageItem UI
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      // Message item decoration with border and background color based on 'isNew'
      decoration: BoxDecoration(
        color: isNew ? Colors.white.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white, width: isNew ? 2.0 : 0.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sender and time information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sender,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Message content
          Text(
            message,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
