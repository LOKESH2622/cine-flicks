class User {
  final String id; // Unique user identifier
  final String name; // User's full name
  final String profession; // User's profession (e.g., Actor, Director)
  final String profileImage; // Profile image URL
  final String bio; // User's bio or description
  final List<String> projects; // List of user's projects
  final int followers; // Number of followers
  final int following; // Number of following
  final String location; // User's current location
  final double latitude; // User's geographical latitude
  final double longitude; // User's geographical longitude
  double? distance; // Optional calculated distance from a reference point
  final int experience; // Years of experience
  final double rating; // User's rating

  User({
    required this.id,
    required this.name,
    required this.profession,
    required this.profileImage,
    required this.bio,
    required this.projects,
    required this.followers,
    required this.following,
    required this.location,
    required this.latitude,
    required this.longitude,
    this.distance, // Nullable, so not required
    required this.experience,
    required this.rating,
  });

  // Factory method to create a User instance from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      profession: json['profession'] as String,
      profileImage: json['profileImage'] as String,
      bio: json['bio'] as String,
      projects: List<String>.from(json['projects']),
      followers: json['followers'] as int,
      following: json['following'] as int,
      location: json['location'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      distance: json['distance'] != null ? json['distance'] as double : null,
      experience: json['experience'] as int,
      rating: json['rating'] as double,
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profession': profession,
      'profileImage': profileImage,
      'bio': bio,
      'projects': projects,
      'followers': followers,
      'following': following,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'experience': experience,
      'rating': rating,
    };
  }
}
