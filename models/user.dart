class User {
  final String id;
  final String name;
  final String role;
  final String profileImage;
  final String bio;
  final List<String> projects;
  final int followers;
  final int following;
  final String location; // User's location
  double? distance; // Nullable field for calculated distance
  final double latitude; // New field for latitude
  final double longitude; // New field for longitude

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.profileImage,
    required this.bio,
    required this.projects,
    required this.followers,
    required this.following,
    required this.location, // Marked as required
    this.distance, // Optional field
    required this.latitude, // Marked as required
    required this.longitude, // Marked as required
  });
}
