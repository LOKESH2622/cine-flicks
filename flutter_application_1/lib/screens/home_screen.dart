import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineSocial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  // ignore: prefer_const_constructors
                  leading: CircleAvatar(
                   // backgroundImage: NetworkImage(post.userImage),
                  ),
                  title: Text(post.userName),
                  subtitle: Text(post.timeAgo),
                  onTap: () {
                    final user = users.firstWhere((u) => u.name == post.userName);
                    Navigator.pushNamed(context, '/profile', arguments: user);
                  },
                ),
                // //Image.network(
                //   post.imageUrl,
                //   fit: BoxFit.cover,
                //   height: 300,
                //   width: double.infinity,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          Text('${post.likes} likes'),
                        ],
                      ),
                      Text(post.caption),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}