import '../models/post.dart';
import '../models/user.dart';
List<User> users = [
];

final List<Post> posts = [
  Post(
    userId: '1',
    userName: 'Vijay',
    userImage: 'https://wallpapers.com/images/hd/cute-vijay-new-tbv7uxdcnx0d4qfv.jpg',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEFVQd91aW6zLAAoiwZ383LFwi1eCwUebaFgVfiEjhpETkJ8p6VEaHvMZSuZGjSG9B0fU&usqp=CAU',
    caption: 'I am going to political very soon!',
    likes: 100,
    timeAgo: '2h',
  // Set current date and time for the post
  ),
  Post(
    userId: '2',
    userName: 'Sai Pallavi',
    userImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHUdOeJxSHUJnnhjqpdur1noe9Pzsq4G_txjsXVmKEgLrGgRnYjei8PvPaUCXGAx1JKig&usqp=CAU',
    imageUrl: 'https://www.theweek.in/content/dam/week/news/entertainment/images/2019/1/8/sai-pallavi-photo-cute.jpg.transform/schema-16x9/image.jpg',
    caption: 'On set of my new project. Excited to share more soon!',
    likes: 100,
    timeAgo: '2h',
    // Example: 1 day ago
  ),
  
  Post(
    userId: '3',
    userName: 'Samantha',
    userImage: 'https://feeds.abplive.com/onecms/images/uploaded-images/2021/12/21/db0b5c756fca5d9bb3d8a854b29d3549b3a45.jpg?impolicy=abp_cdn&imwidth=800',
    imageUrl: 'https://i.pinimg.com/564x/cd/51/8a/cd518a5629d1e6fc8116dd60ea26e716.jpg',
    caption: 'I am going to marry very soon!',
    likes: 1000,
    timeAgo: '2h',
 // Example: 5 hours ago
  ),
  Post(
    userId: '4',
    userName: 'Priyanka',
    userImage: 'https://preview.redd.it/is-priyanka-arul-mohan-a-star-material-v0-og59q9dx7joc1.jpeg?auto=webp&s=f75d8aba6782822821d7aae8ee4d2d0ebdf6679e',
    imageUrl: 'https://i.ytimg.com/vi/mWD4WcrZ488/sddefault.jpg',
    caption: 'Acting is my blood and skin',
    likes: 1500,
    timeAgo: '2h',
    // Example: 2 days ago
  ),

    Post(
    userId: '6',
    userName: 'Lokesh',
    userImage: 'https://i.ibb.co/d0zqH7s/police.jpg',
    imageUrl: 'https://i.ibb.co/d0zqH7s/police.jpg',
    caption: 'CINEMAVIN THAVARU',
    likes: 15000,
    timeAgo: '2h',
  // Example: 3 days ago
  ),
    Post(
    userId: '7',
    userName: 'meeka simson' ,
    userImage: 'https://i.ibb.co/bdPM9sb/Whats-App-Image-2024-11-24-at-20-28-29-34fc3f88.jpg',
    imageUrl: 'https://i.ibb.co/bdPM9sb/Whats-App-Image-2024-11-24-at-20-28-29-34fc3f88.jpg',
    caption: 'Music director',
    likes: 1500000,
    timeAgo: '2h',
  // Example: 3 days ago
  ),
  Post(
    userId: '8',
    userName: 'Richelle',
    userImage: 'https://i.ibb.co/XzXRP8J/Whats-App-Image-2024-11-25-at-11-45-36-473257ac.jpg',
    imageUrl: 'https://i.ibb.co/XzXRP8J/Whats-App-Image-2024-11-25-at-11-45-36-473257ac.jpg',
    caption: 'bEST SINGER IN THE WORLD!',
    likes: 1000,
    timeAgo: '2h',
 // Example: 5 hours ago
  ),
    Post(
    userId: '8',
    userName: 'JOVIN',
    userImage: 'https://i.ibb.co/x3MqZby/Whats-App-Image-2024-11-25-at-11-51-17-e9c5d114.jpg',
    imageUrl: 'https://i.ibb.co/x3MqZby/Whats-App-Image-2024-11-25-at-11-51-17-e9c5d114.jpg',
    caption: 'bEST  LIAR IN THE WORLD!',
    likes: 1000,
    timeAgo: '2h',
 // Example: 5 hours ago
  ),
    Post(
    userId: '8',
    userName: 'IDIYA',
    userImage: 'https://i.ibb.co/f2VMzfJ/Whats-App-Image-2024-11-25-at-11-56-30-7c820220.jpg',
    imageUrl: 'https://i.ibb.co/f2VMzfJ/Whats-App-Image-2024-11-25-at-11-56-30-7c820220.jpg',
    caption: 'BEST ACTRESSS IN THE WORLD',
    likes: 1000,
    timeAgo: '2h',
 // Example: 5 hours ago
  ),
   Post(
    userId: '8',
    userName: 'Sairam',
    userImage: 'https://i.ibb.co/jW2TDCb/Whats-App-Image-2024-11-25-at-11-51-40-a295382d.jpg',
    imageUrl: 'https://i.ibb.co/jW2TDCb/Whats-App-Image-2024-11-25-at-11-51-40-a295382d.jpg',
    caption: 'best actor and writer',
    likes: 1558000,
    timeAgo: '2h',
 // Example: 5 hours ago
  ),
  
   Post(
    userId: '3',
    userName: 'Samantha',
    userImage: 'https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg',
    imageUrl: 'https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg',
    caption: 'lady superstar',
    likes: 100000000000,
    timeAgo: '1h',
 // Example: 5 hours ago
  ),
   Post(
    userId: '3',
    userName: 'kabilan',
    userImage: 'https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg',
    imageUrl: 'https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg',
    caption: 'camera man',
    likes: 1000,
    timeAgo: '1h',
 // Example: 5 hours ago
  ),
    Post(
    userId: '5',
    userName: 'Romario kavin',
    userImage: 'https://i.ibb.co/MBN4TvX/Whats-App-Image-2024-11-25-at-12-14-25-d06fcc63.jpg',
    imageUrl: 'https://i.ibb.co/MBN4TvX/Whats-App-Image-2024-11-25-at-12-14-25-d06fcc63.jpg',
    caption: 'Best director',
    likes: 150088,
    timeAgo: '2h',
  // Example: 3 days ago
  ),
   Post(
    userId: '9',
    userName: 'Valan amal',
    userImage: 'https://i.ibb.co/WgqGN5b/Whats-App-Image-2024-11-25-at-12-12-46-de6ce725.jpg',
    imageUrl: 'https://i.ibb.co/WgqGN5b/Whats-App-Image-2024-11-25-at-12-12-46-de6ce725.jpg',
    caption: 'Best scriptwriter',
    likes: 150088,
    timeAgo: '2h',
  // Example: 3 days ago
  ),
  
  // Add more posts as needed
];