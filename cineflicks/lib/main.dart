import 'package:flutter/material.dart';
import 'package:my_flutter_app/db/mongodb.dart';
import 'screens/home_screen.dart'; // Import the HomeScreen
import 'screens/login_screen.dart';
import 'screens/search_screen.dart';
import 'screens/add_post_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_box_screen.dart';
import 'screens/jobs_screen.dart';
import 'screens/post_detail_screen.dart';
import "screens/personal_chat_screen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
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
        '/search': (context) => const SearchPage(),
        '/add-post': (context) => const AddPostScreen(),
        '/notifications': (context) => const NotificationScreen(),
        '/chat': (context) => const ChatBoxScreen(),
        '/jobs': (context) => const JobsScreen(),
        '/post-details': (context) => ProfileScreen(),
        '/personal_chat': (context) {
          final username = ModalRoute.of(context)!.settings.arguments as String;
          return PersonalChatScreen(username: username);
        },
      },
    );
  }
}