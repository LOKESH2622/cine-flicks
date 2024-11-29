import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {'type': 'like', 'user': 'Samantha', 'action': 'liked your post.', 'seen': 'false'},
    {'type': 'profile_view', 'user': 'Vetrimaran', 'action': 'viewed your profile.', 'seen': 'false'},
    {'type': 'comment', 'user': 'AR Rahman', 'action': 'commented: "Beautiful work!"', 'seen': 'false'},
    {'type': 'follow', 'user': 'Trisha', 'action': 'started following you.', 'seen': 'false'},
    {'type': 'share', 'user': 'Rajamouli', 'action': 'shared your post.', 'seen': 'false'},
    {'type': 'mention', 'user': 'Dhanush', 'action': 'mentioned you in a comment: "Great team effort with @YourName!"', 'seen': 'false'},
    {'type': 'endorsement', 'user': 'Kamal Haasan', 'action': 'endorsed your skills in Directing.', 'seen': 'false'},
    {'type': 'job_application', 'user': 'Vijay Sethupathi', 'action': 'applied for your job post.', 'seen': 'false'},
    {'type': 'recommendation', 'user': 'Mani Ratnam', 'action': 'recommended your profile to a producer.', 'seen': 'false'},
    {'type': 'message', 'user': 'Anirudh', 'action': 'sent you a message: "Looking forward to working with you!"', 'seen': 'false'},
    // New notifications
    {'type': 'like', 'user': 'Nayanthara', 'action': 'liked your photo.', 'seen': 'false'},
    {'type': 'profile_view', 'user': 'Lokesh Kanagaraj', 'action': 'viewed your profile.', 'seen': 'false'},
    {'type': 'comment', 'user': 'GV Prakash', 'action': 'commented: "Amazing effort!"', 'seen': 'false'},
    {'type': 'follow', 'user': 'Jayam Ravi', 'action': 'started following you.', 'seen': 'false'},
    {'type': 'share', 'user': 'Prabhu Deva', 'action': 'shared your project.', 'seen': 'false'},
    {'type': 'mention', 'user': 'Karthi', 'action': 'mentioned you in a story.', 'seen': 'false'},
    {'type': 'endorsement', 'user': 'Ajith Kumar', 'action': 'endorsed your cinematography skills.', 'seen': 'false'},
    {'type': 'job_application', 'user': 'Sivakarthikeyan', 'action': 'applied for your project.', 'seen': 'false'},
    {'type': 'recommendation', 'user': 'Vikram', 'action': 'recommended you for a role.', 'seen': 'false'},
    {'type': 'message', 'user': 'Ilaiyaraaja', 'action': 'sent you a message: "Excited to collaborate soon!"', 'seen': 'false'},
  ];

  void _markAsSeen(int index) {
    setState(() {
      notifications[index]['seen'] = 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text('No new notifications.'),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isSeen = notification['seen'] == 'true';
                return ListTile(
                  leading: Icon(
                    _getIconForType(notification['type']!),
                    color: isSeen ? Colors.grey : Colors.blue,
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: notification['user']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSeen ? Colors.grey : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' ${notification['action']}',
                          style: TextStyle(
                            color: isSeen ? Colors.grey : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: isSeen ? null : const Icon(Icons.fiber_new, color: Colors.red),
                  onTap: () => _markAsSeen(index),
                );
              },
            ),
    );
  }

  // Helper function to map notification type to an icon
  IconData _getIconForType(String type) {
    switch (type) {
      case 'like':
        return Icons.thumb_up;
      case 'profile_view':
        return Icons.visibility;
      case 'comment':
        return Icons.comment;
      case 'follow':
        return Icons.person_add;
      case 'share':
        return Icons.share;
      case 'mention':
        return Icons.alternate_email;
      case 'endorsement':
        return Icons.star;
      case 'job_application':
        return Icons.work;
      case 'recommendation':
        return Icons.recommend;
      case 'message':
        return Icons.message;
      default:
        return Icons.notifications;
    }
  }
}
