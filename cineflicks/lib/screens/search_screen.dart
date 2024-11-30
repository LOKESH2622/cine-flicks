import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/profilepage.dart';
import '../screens/profilepage.dart'; // Import the ProfilePage

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String selectedProfession = 'All';
  final List<String> professions = [
    'All',
    'Actor',
    'Cinematographer',
    'Editor',
    'Lyricist',
    'Musician',
    'Director',
    'Writer'
  ];

  final List<Map<String, dynamic>> users = [
    {
      'name': 'valan amal',
      'profession': 'Actor',
      'location': 'Thiruvanamalai',
      'experience': 5,
      'rating': 4.8,
      'profileImage': 'https://i.ibb.co/WgqGN5b/Whats-App-Image-2024-11-25-at-12-12-46-de6ce725.jpg',
    },
    {
      'name': 'sairam',
      'profession': 'Musician',
      'location': 'Chennai',
      'experience': 7,
      'rating': 4.5,
      'profileImage': 'https://i.ibb.co/PMtd0Rd/Whats-App-Image-2024-11-30-at-17-11-43-cc12c275.jpg',
    },
    {
      'name': 'Lokesh',
      'profession': 'Director',
      'location': 'Chennai',
      'experience': 4,
      'rating': 4.2,
      'profileImage': 'https://i.ibb.co/d0zqH7s/police.jpg',
    },
  ];

  List<Map<String, dynamic>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users; // Initially show all users
  }

  void _filterUsers() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredUsers = users.where((user) {
        bool matchesProfession =
            selectedProfession == 'All' || user['profession'] == selectedProfession;
        bool matchesQuery = user['name'].toLowerCase().contains(query);
        return matchesProfession && matchesQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Personalities'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => _filterUsers(),
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search by name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedProfession,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedProfession = value;
                        _filterUsers();
                      });
                    }
                  },
                  items: professions
                      .map((profession) => DropdownMenuItem<String>(
                            value: profession,
                            child: Text(profession),
                          ))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Nearby Personalities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user['profileImage']),
                      ),
                      title: Text(user['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profession: ${user['profession']}'),
                          Text('Location: ${user['location']}'),
                          Text('Experience: ${user['experience']} years'),
                          Text('Rating: ${user['rating']} ⭐'),
                        ],
                      ),
                      onTap: () {
                        // Navigate to the ProfilePage when a user is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(user: user),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Explore Professions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: professions
                  .where((profession) => profession != 'All')
                  .map((profession) => Chip(
                        label: Text(profession),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
