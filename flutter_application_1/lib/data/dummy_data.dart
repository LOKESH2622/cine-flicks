import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/models/user.dart';

final List<User> users = [
  User(
    id: '1',
    name: 'Vetri Maran',
    role: 'Writer & Director',
    profileImage: 'C:cine flicksmaatramdownload.jpeg',
    bio: ' National Award-winning director known for Visaranai,Asuran,Polladhavan,Adukalam,Vadachennai',
    projects: ['Viduthalai 2', 'Vadachennai 2', 'Vadivasal'],
    followers: 5000000,
    following: 100,
  ),
  User(
    id: '2',
    name: 'Lokesh ',
    role: ' Writer & Director',
    profileImage: 'C:cine flicksmaatramlokesh.jpeg',
    bio: 'Creater of  Kollywood cinematic universe(LCU) ',
    projects: ['Leo 2', 'Leo 3', 'Agent tina''Leo vs All',],
    followers: 1000000,
    following: 50,
  ),
   User(
    id: '3',
    name: 'Kamal Hassan',
    role: 'cinemavin varisu',
    profileImage: 'download (2).jpeg',
    bio: ' National Award-winning Hero known for Moondram Pirai ,Nayakan Indian ,Thevar magan',
    projects: ['Thug life', 'Indian 3', 'vikram 3'],
    followers: 1000000,
    following: 50,
  ),
  User(
    id: '4',
    name: 'Roger Deakins',
    role: 'Cinematographer',
    profileImage: 'https://example.com/deakins.jpg',
    bio: 'Academy Award-winning cinematographer',
    projects: ['1917', 'Blade Runner 2049', 'Skyfall'],
    followers: 1000000,
    following: 50,
  ),
  // Add more users as needed
];

final List<Post> posts = [
  Post(
    userId: '1',
    userName: 'Vijay',
    userImage: 'images.jpeg',
    imageUrl: 'images.jpeg',
    caption: 'I am going to political very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
   Post(
    userId: '2',
    userName: 'Sai pallavi',
    userImage: 'download (3).jpeg',
    imageUrl: 'download (3).jpeg',
    caption: 'On set of my new project. Excited to share more soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
  Post(
    userId: '3',
    userName: 'Samantha',
    userImage: 'download (5).jpeg',
    imageUrl: 'download (5).jpeg',
    caption: 'I am going to marry  very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),

  Post(
    userId: '1',
    userName: 'Priyanka Mohan',
    userImage: 'download (4).jpeg',
    imageUrl: 'download (4).jpeg',
    caption: 'Acting is my blood and skin',
    likes: 150000,
    timeAgo: '2h',
  ),
  Post(
    userId: '1',
    userName: 'Vijay',
    userImage: 'download (6).jpeg',
    imageUrl: 'download (6).jpeg',
    caption: 'I am going to political very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
  // Add more posts as needed
];
