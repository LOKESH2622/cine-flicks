class Post {
  final String userId;
  final String userName;
  final String userImage;
  final String imageUrl;
  final String caption;
  late final int likes;
  final String timeAgo;
  bool isLiked; 
  // Track like status

  Post({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.timeAgo,
    this.isLiked = false, // Default to not liked
  });
}
