import 'package:flutter/material.dart';
import 'screens/home_screen.dart';  // Import the HomeScreen
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/add_post_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_box_screen.dart';
import 'screens/jobs_screen.dart';  // Import the AddPostScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Track theme state

  // Function to toggle theme
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cine Flicks!!!',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(
              isDarkMode: _isDarkMode,
              onThemeChanged: _toggleTheme,
            ),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/add-post': (context) => const AddPostScreen(), 
        '/notifications': (context) => const NotificationScreen(),
        '/chat': (context) => const ChatBoxScreen(),
        '/jobs': (context) => const JobsScreen(),
        // Add this route
      },
    );
  }
}
