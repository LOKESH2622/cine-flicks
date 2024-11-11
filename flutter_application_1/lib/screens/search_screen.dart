import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import '../data/dummy_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void _filterUsers(String query) {
    setState(() {
      searchQuery = query;
      filteredUsers = users
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.role.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _filterUsers,
          decoration: const InputDecoration(
            hintText: 'Search personalities...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          final user = filteredUsers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage),
            ),
            title: Text(user.name),
            subtitle: Text(user.role),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: user,
              );
            },
          );
        },
      ),
    );
  }
}