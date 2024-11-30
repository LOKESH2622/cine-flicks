import 'package:flutter/material.dart';

class ChatBoxScreen extends StatelessWidget {
  const ChatBoxScreen({super.key});

  // Dummy data for users and recent messages
  final List<Map<String, dynamic>> users = const [
    {"name": "Sreeleela", "message": "Hi! How are you?"},
    {"name": "Ram", "message": "Can we meet tomorrow?"},
    {"name": "Priya", "message": "Check out this link!"},
    {"name": "Vijay", "message": "Good morning!"},
    {"name": "Arjun", "message": "See you soon."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(users[index]["name"][0]), // Show first letter of the user's name
            ),
            title: Text(users[index]["name"]),
            subtitle: Text(users[index]["message"]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to the personal chat screen for the selected user
              Navigator.pushNamed(
                context,
                '/personal_chat',
                arguments: users[index]["name"], // Pass username as an argument
              );
            },
          );
        },
      ),
    );
  }
}
