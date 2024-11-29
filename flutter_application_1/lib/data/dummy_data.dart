
import 'package:my_flutter_app/models/post.dart';

import '../models/user.dart';

final List<User> users = [
  User(
    id: '1',
    name: 'Vetri Maran',
    role: 'Writer & Director',
    profileImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ24A7gqu4ov1TE78E2yzdazy2N33FMUwAg3w&s',
    bio: ' National Award-winning director known for Visaranai,Asuran,Polladhavan,Adukalam,Vadachennai',
    projects: ['Viduthalai 2', 'Vadachennai 2', 'Vadivasal'],
    followers: 5000000,
    following: 100,
  ),
  User(
    id: '2',
    name: 'Lokesh ',
    role: ' Writer & Director',
    profileImage: 'lokesh.jpeg',
    bio: 'Creater of  Kollywood cinematic universe(LCU) ',
    projects: ['Leo 2', 'Leo 3', 'Agent tina''Leo vs All',],
    followers: 1000000,
    following: 50,
  ),
   User(
    id: '3',
    name: 'Kamal Hassan',
    role: 'cinemavin varisu',
    profileImage: '',
    bio: ' National Award-winning Hero known for Moondram Pirai ,Nayakan Indian ,Thevar magan',
    projects: ['Thug life', 'Indian 3', 'vikram 3'],
    followers: 1000000,
    following: 50,
  ),
  User(
    id: '4',
    name: 'Rajni kanth',
    role: 'Actor',
    profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGb8f-3jN8U7X2SPM-qX-9m76Pl4xDCQRO9A&s",
    bio: 'Academy Award-winning cinematographer',
    projects: ['1917', 'Blade Runner 2049', 'Skyfall'],
    followers: 1000000,
    following: 50,
  ),
  User(
    id: '5',
    name: 'Vijay',
    role: 'Actor',
    profileImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3itqcYZ6XyELlJRCxyLNQ8XmMCOoE17dRQA&s',
    bio: ' avanga ivaga la ilaa ellarum onu thaa!!',
    projects: [' 2', 'Leo 3', 'politics'],
    followers: 5000000,
    following: 100,
  ),
  // Add more users as needed
];

final List<Post> posts = [
  Post(
    userId: '1',
    userName: 'Vijay',
    userImage: '',
    imageUrl: '',
    caption: 'I am going to political very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
   Post(
    userId: '2',
    userName: 'Sai pallavi',
    userImage: '',
    imageUrl: '',
    caption: 'On set of my new project. Excited to share more soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
  Post(
    userId: '3',
    userName: 'Samantha',
    userImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ24A7gqu4ov1TE78E2yzdazy2N33FMUwAg3w&s',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ24A7gqu4ov1TE78E2yzdazy2N33FMUwAg3w&s',
    caption: 'I am going to marry  very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),

  Post(
    userId: '1',
    userName: 'Priyanka',
    userImage: '',
    imageUrl: '',
    caption: 'Acting is my blood and skin',
    likes: 150000,
    timeAgo: '2h',
  ),
  Post(
    userId: '1',
    userName: 'Vijay',
    userImage: 'images.jpeg',
    imageUrl: 'images.jpeg',
    caption: 'I am going to political very soon!',
    likes: 150000,
    timeAgo: '2h',
  ),
  // Add more posts as needed
];
