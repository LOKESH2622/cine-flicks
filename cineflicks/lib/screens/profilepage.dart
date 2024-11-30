import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for posts, followers, and following
    final List<Map<String, dynamic>> posts = [
      {
        'image': 'https://i.ibb.co/PMtd0Rd/Whats-App-Image-2024-11-30-at-17-11-43-cc12c275.jpg',
        'caption': 'Filming on set!',
      },
      {
        'image': 'https://i.ibb.co/qxgGpcS/post2.jpg',
        'caption': 'Director\'s chair ready!',
      },
      {
        'image': 'https://i.ibb.co/5YwHfys/post1.jpg',
        'caption': 'Lights, camera, action!',
      },
    ];

    final int followers = 120;
    final int following = 80;

    return Scaffold(
      appBar: AppBar(
        title: Text(user['name']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user['profileImage']),
            ),
            const SizedBox(height: 16),
            Text(
              user['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Profession: ${user['profession']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Location: ${user['location']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Experience: ${user['experience']} years',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Rating: ${user['rating']} ⭐',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Follow and Followers Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '$followers',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('Followers', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$following',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('Following', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Posts Section
            const Text(
              'Posts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Displaying Posts
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(post['image']),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post['caption'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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
}
