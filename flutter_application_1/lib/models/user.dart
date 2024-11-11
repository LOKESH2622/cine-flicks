class User {
  final String id;
  final String name;
  final String role;
  final String profileImage;
  final String bio;
  final List<String> projects;
  final int followers;
  final int following;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.profileImage,
    required this.bio,
    required this.projects,
    required this.followers,
    required this.following,
  });
}