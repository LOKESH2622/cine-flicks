class User {
  final String id; // Unique user identifier
  final String name; // User's full name
  final String role; // User's role (e.g., Actor, Director)
  final String profileImage; // Profile image URL
  final String bio; // User's bio or description
  final List<String> projects; // List of user's projects
  final int followers; // Number of followers
  final int following; // Number of following
  final String location; // User's current location
  double? distance; // Optional calculated distance from a reference point
  final double latitude; // User's geographical latitude
  final double longitude; // User's geographical longitude

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.profileImage,
    required this.bio,
    required this.projects,
    required this.followers,
    required this.following,
    required this.location,
    this.distance, // Nullable, so not required
    required this.latitude,
    required this.longitude,
  });

  // Factory method to create a User instance from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      profileImage: json['profileImage'] as String,
      bio: json['bio'] as String,
      projects: List<String>.from(json['projects']),
      followers: json['followers'] as int,
      following: json['following'] as int,
      location: json['location'] as String,
      distance: json['distance'] != null ? json['distance'] as double : null,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'profileImage': profileImage,
      'bio': bio,
      'projects': projects,
      'followers': followers,
      'following': following,
      'location': location,
      'distance': distance,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
