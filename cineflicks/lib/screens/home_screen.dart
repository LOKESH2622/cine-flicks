import 'dart:io'; // To support file-based media
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // Import the share package
import '../data/dummy_data.dart';
import '../models/post.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function onThemeChanged;

  const HomeScreen({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sortBy = 'A-Z'; // Default sort option
  final List<Post> _posts = List.from(posts); // Local list to manage posts dynamically

  // Sorting function
  List<Post> getSortedPosts() {
    List<Post> sortedPosts = List.from(_posts);

    if (sortBy == 'A-Z') {
      sortedPosts.sort((a, b) => a.userName.compareTo(b.userName)); // Sort alphabetically by user name
    } else if (sortBy == 'Experience') {
      sortedPosts.sort((a, b) => b.likes.compareTo(a.likes)); // Sort by most liked (Experience)
    }

    return sortedPosts;
  }

  // Add new post received from Add Post screen
  void _addNewPost(Post newPost) {
    setState(() {
      _posts.insert(0, newPost); // Add the new post at the top of the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.sort), // Sort Icon in the left corner
            onSelected: (value) {
              setState(() {
                sortBy = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'A-Z', child: Text('A-Z')),
              const PopupMenuItem(value: 'Experience', child: Text('Experience')),
            ],
          ),
        ),
        title: const Text(
          'Cineflicks',
          style: TextStyle(
            fontFamily: 'Stylish', // Use a custom font if available
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              widget.onThemeChanged(); // Toggle theme between light and dark
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications'); // Navigate to Notifications Page
            },
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/chat'); // Navigate to Chat Box Screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: getSortedPosts().length,
        itemBuilder: (context, index) {
          final post = getSortedPosts()[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.userImage),
                  ),
                  title: Text(post.userName),
                  subtitle: Text(post.timeAgo),
                  onTap: () {
                    var user = users.firstWhere((u) => u.name == post.userName);
                    Navigator.pushNamed(context, '/profile', arguments: user);
                  },
                ),
                // Check if the post media is a network image or a local file
                post.imageUrl.startsWith('http') // Check if the image URL is a network URL
                    ? (post.imageUrl.endsWith('.mp4') 
                        ? Center(
                            child: Text(
                              'Video Placeholder: ${post.imageUrl.split('/').last}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        : Image.network(
                            post.imageUrl,
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                              );
                            },
                          )
                    )
                    : Image.file(
                        File(post.imageUrl), // Assuming post.imageUrl is a local file path
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                          );
                        },
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Like button
                          IconButton(
                            icon: Icon(post.isLiked ? Icons.favorite : Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                post.isLiked = !post.isLiked; // Toggle like status
                                post.likes = post.isLiked ? post.likes + 1 : post.likes - 1; // Update likes count
                              });
                            },
                          ),
                          Text('${post.likes} likes'),

                          // Forward button (for sharing)
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              // Share the post caption and user profile link
                              String shareText = 'Check out this post by ${post.userName}: ${post.caption}';
                              String profileLink = 'https://www.cineflicks.com/profile/${post.userName}'; // Example URL
                              String profileShareText = 'Check out the profile of ${post.userName}: $profileLink';

                              // Share both the post and the profile link
                              Share.share('$shareText\n$profileShareText');
                            },
                          ),
                        ],
                      ),
                      // Caption Text
                      Text(post.caption),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
     bottomNavigationBar: CurvedNavigationBar(
  color: widget.isDarkMode ? Colors.black : Colors.white, // Dark navbar in dark mode, white in sunny mode
  buttonBackgroundColor: widget.isDarkMode ? Colors.white : Colors.black, // Inverted button background
  backgroundColor: widget.isDarkMode ? Colors.grey[850]! : Colors.grey[300]!, // Dark gray for dark mode, light gray for sunny mode
  onTap: (index) async {
    switch (index) {
      case 0: // Home
        Navigator.pushNamed(context, '/home');
        break;
      case 1: // Search
        Navigator.pushNamed(context, '/search');
        break;
      case 2: // Add Post
        final newPost = await Navigator.pushNamed(context, '/add-post') as Post?;
        if (newPost != null) {
          _addNewPost(newPost); // Add the new post to the home page
        }
        break;
      case 3: // Jobs
        Navigator.pushNamed(context, '/jobs');
        break;
      case 4: // Profile
        Navigator.pushNamed(context, '/profile');
        break;
    }
  },
  items: [
    Icon(
      Icons.home,
      color: widget.isDarkMode ? Colors.white : Colors.black, // Light icons in dark mode, dark in sunny mode
    ),
    Icon(
      Icons.search,
      color: widget.isDarkMode ? Colors.white : Colors.black, // Light icons in dark mode, dark in sunny mode
    ),
    Icon(
      Icons.add,
      color: widget.isDarkMode ? Colors.white : Colors.black, // Light icons in dark mode, dark in sunny mode
    ),
    Icon(
      Icons.movie_creation_outlined,
      color: widget.isDarkMode ? Colors.white : Colors.black, // Light icons in dark mode, dark in sunny mode
    ),
    CircleAvatar(
      backgroundImage: const AssetImage('lib/images/profile.png'),
      backgroundColor: widget.isDarkMode ? Colors.white : Colors.black, // Inverted circle avatar background
      radius: 12,
    ),
  ],
),

    );
  }
}
