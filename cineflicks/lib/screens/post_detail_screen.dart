import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy user data
    Map<String, String> user = {
      'username': 'Lokesh',
      'profileImage': 'https://i.ibb.co/ss5ShfS/Whats-App-Image-2024-11-29-at-21-11-49-22ea0ec1.jpg',
      'bio': 'Aspiring filmmaker | Lover of cinema | Storyteller 🎥',
      'location': 'Otteri, Chennai, India',
      'posts': '12',
      'followers': '1500',
      'following': '300',
    };
    final List<String> dummyPosts = List.generate(
      12,
      (index) => 'https://via.placeholder.com/150?text=Post+${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user['username'] ?? 'profile',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user['profileImage'] ?? 'profile'),
                  ),
                  const SizedBox(width: 16),
                  // Stats
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn('Posts', int.parse(user['posts'] ?? '0')),
                        _buildStatColumn('Followers', int.parse(user['followers'] ?? '0')),
                        _buildStatColumn('Following', int.parse(user['following'] ?? '0')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio Section with Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user['bio'] ?? 'profile',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        user['location'] ?? 'profile',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-profile');
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Posts Grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: dummyPosts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/post-details',
                        arguments: {'postUrl': dummyPosts[index]},
                      );
                    },
                    child: Image.network(
                      dummyPosts[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, size: 50),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build stats (Posts, Followers, Following)
  Widget _buildStatColumn(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
