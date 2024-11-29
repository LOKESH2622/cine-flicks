import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../data/dummy_data.dart';
import '../models/user.dart';
import 'dart:math';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User> filteredUsers = [];
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
    _getCurrentLocation();
  }

  // Function to get the current location of the user
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  // Function to calculate distance between two coordinates
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of Earth in kilometers
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = 
        (sin(dLat / 2) * sin(dLat / 2)) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            (sin(dLon / 2) * sin(dLon / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  // Updated filter function to include geolocation-based filtering
  void _filterUsers(String query) {
    setState(() {
  filteredUsers = users.where((user) {
    // Ensure `name`, `role`, and `location` are non-null before processing
    bool matchesQuery = (user.name.toLowerCase().contains(query.toLowerCase()) ?? false) ||
        (user.role.toLowerCase().contains(query.toLowerCase()) ?? false) ||
        (user.location.toLowerCase().contains(query.toLowerCase()) ?? false);

    // Check for proximity filtering
    if (currentPosition != null) {

      double distance = _calculateDistance(
        currentPosition!.latitude,
        currentPosition!.longitude,
        user.latitude,
        user.longitude,
      );
      user.distance = distance; // Update user's distance
      return matchesQuery || distance <= 50; // Example: filter within 50 km
    }

    return matchesQuery; // Return only query match if no location data is available
  }).toList();

  // Sort users by distance if geolocation is available
  if (currentPosition != null) {
    filteredUsers.sort((a, b) {
      return (a.distance ?? double.infinity).compareTo(b.distance ?? double.infinity);
    });
  }
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearchDelegate(
                  users: users,
                  currentPosition: currentPosition,
                  onSearchResult: (filteredResults) {
                    setState(() {
                      filteredUsers = filteredResults;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profileImage),
                  ),
                  title: Text(user.name),
                  subtitle: Text(
                    '${user.role} - ${user.location} '
                    '${user.distance != null ? "(${user.distance!.toStringAsFixed(2)} km)" : ""}',
                  ), // Display distance if available
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

class UserSearchDelegate extends SearchDelegate {
  final List<User> users;
  final Position? currentPosition;
  final Function(List<User>) onSearchResult;

  UserSearchDelegate({
    required this.users,
    required this.currentPosition,
    required this.onSearchResult,
  });

  // Function to calculate distance between two coordinates
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of Earth in kilometers
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = 
        (sin(dLat / 2) * sin(dLat / 2)) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            (sin(dLon / 2) * sin(dLon / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final queryResults = users.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase()) ||
          user.role.toLowerCase().contains(query.toLowerCase()) ||
          user.location.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (currentPosition != null) {
      for (var user in queryResults) {
        if (user.longitude != null) {
          user.distance = _calculateDistance(
            currentPosition!.latitude,
            currentPosition!.longitude,
            user.latitude,
            user.longitude,
          );
        }
      }

      queryResults.sort((a, b) => (a.distance ?? double.infinity)
          .compareTo(b.distance ?? double.infinity));
    }

    return ListView.builder(
      itemCount: queryResults.length,
      itemBuilder: (context, index) {
        final user = queryResults[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.profileImage),
          ),
          title: Text(user.name),
          subtitle: Text(
            '${user.role} - ${user.location} '
            '${user.distance != null ? "(${user.distance!.toStringAsFixed(2)} km)" : ""}',
          ), // Display distance if available
          onTap: () {
            close(context, null);
            Navigator.pushNamed(
              context,
              '/profile',
              arguments: user,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}
