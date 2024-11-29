// add_post_screen.dart

// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images and videos
import '../models/post.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _captionController = TextEditingController();

  File? _selectedMedia; // To store the selected media (image or video)
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedMedia = File(pickedFile.path);
      });
    }
  }

  // Function to pick a video
  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedMedia = File(pickedFile.path);
      });
    }
  }

  // Function to save the new post
  void _addPost() {
    final caption = _captionController.text;

    if (caption.isEmpty || _selectedMedia == null) {
      // Show an error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add a caption and upload media')),
      );
      return;
    }

    // Create a new post
    final newPost = Post(
      userName: 'User123', // Replace with logged-in user's name dynamically
      userImage: 'https://example.com/images/profile.jpg', // Replace with user's profile image or default
      imageUrl: _selectedMedia!.path,
      caption: caption,
      timeAgo: 'Just now',
      userId: '',
      likes: 0, // Default likes to 0
    );

    // Pass the new post back to the previous screen
    Navigator.pop(context, newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(labelText: 'Caption'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            if (_selectedMedia != null)
              // Show preview of selected media
              Column(
                children: [
                  Text(
                    'Selected Media:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _selectedMedia!.path.endsWith('.mp4')
                      ? const Text('Video selected') // Placeholder text for video
                      : Image.file(
                          _selectedMedia!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image'),
                ),
                ElevatedButton.icon(
                  onPressed: _pickVideo,
                  icon: const Icon(Icons.videocam),
                  label: const Text('Upload Video'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPost,
              child: const Text('Add Post'),
            ),
          ],
        ),
      ),
    );
  }
}
