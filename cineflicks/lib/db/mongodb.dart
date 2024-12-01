import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;
  static const String mongoUrl =
      "mongodb+srv://lokesh26csb:lokesh558@cineflicks.opkml.mongodb.net/ad_aaappp?retryWrites=true&w=majority&appName=cineflicks";

  // Connect to the MongoDB database
  static Future<void> connect() async {
    db = await Db.create(mongoUrl);
    await db.open();
    print('Connected to the MongoDB database');
  }

  // Insert dummy data into the 'posts' collection
  static Future<void> insertData() async {
    final postsCollection = db.collection('posts');

    // Dummy Data
    List<Map<String, dynamic>> dummyData = [
  {
    "userId": "1",
    "userName": "Vijay",
    "userImage": "https://wallpapers.com/images/hd/cute-vijay-new-tbv7uxdcnx0d4qfv.jpg",
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEFVQd91aW6zLAAoiwZ383LFwi1eCwUebaFgVfiEjhpETkJ8p6VEaHvMZSuZGjSG9B0fU&usqp=CAU",
    "caption": "I am going to political very soon!",
    "likes": 100,
    "timeAgo": "2h"
  },
  {
    "userId": "2",
    "userName": "Sai Pallavi",
    "userImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHUdOeJxSHUJnnhjqpdur1noe9Pzsq4G_txjsXVmKEgLrGgRnYjei8PvPaUCXGAx1JKig&usqp=CAU",
    "imageUrl": "https://www.theweek.in/content/dam/week/news/entertainment/images/2019/1/8/sai-pallavi-photo-cute.jpg.transform/schema-16x9/image.jpg",
    "caption": "On set of my new project. Excited to share more soon!",
    "likes": 100,
    "timeAgo": "2h"
  },
  {
    "userId": "3",
    "userName": "Samantha",
    "userImage": "https://feeds.abplive.com/onecms/images/uploaded-images/2021/12/21/db0b5c756fca5d9bb3d8a854b29d3549b3a45.jpg?impolicy=abp_cdn&imwidth=800",
    "imageUrl": "https://i.pinimg.com/564x/cd/51/8a/cd518a5629d1e6fc8116dd60ea26e716.jpg",
    "caption": "I am going to marry very soon!",
    "likes": 1000,
    "timeAgo": "2h"
  },
  {
    "userId": "4",
    "userName": "Priyanka",
    "userImage": "https://preview.redd.it/is-priyanka-arul-mohan-a-star-material-v0-og59q9dx7joc1.jpeg?auto=webp&s=f75d8aba6782822821d7aae8ee4d2d0ebdf6679e",
    "imageUrl": "https://i.ytimg.com/vi/mWD4WcrZ488/sddefault.jpg",
    "caption": "Acting is my blood and skin",
    "likes": 1500,
    "timeAgo": "2h"
  },
  {
    "userId": "6",
    "userName": "Lokesh",
    "userImage": "https://i.ibb.co/d0zqH7s/police.jpg",
    "imageUrl": "https://i.ibb.co/d0zqH7s/police.jpg",
    "caption": "CINEMAVIN THAVARU",
    "likes": 15000,
    "timeAgo": "2h"
  },
  {
    "userId": "7",
    "userName": "Meeka Simson",
    "userImage": "https://i.ibb.co/bdPM9sb/Whats-App-Image-2024-11-24-at-20-28-29-34fc3f88.jpg",
    "imageUrl": "https://i.ibb.co/bdPM9sb/Whats-App-Image-2024-11-24-at-20-28-29-34fc3f88.jpg",
    "caption": "Music director",
    "likes": 1500000,
    "timeAgo": "2h"
  },
  {
    "userId": "8",
    "userName": "Richelle",
    "userImage": "https://i.ibb.co/XzXRP8J/Whats-App-Image-2024-11-25-at-11-45-36-473257ac.jpg",
    "imageUrl": "https://i.ibb.co/XzXRP8J/Whats-App-Image-2024-11-25-at-11-45-36-473257ac.jpg",
    "caption": "BEST SINGER IN THE WORLD!",
    "likes": 1000,
    "timeAgo": "2h"
  },
  {
    "userId": "9",
    "userName": "Jovin",
    "userImage": "https://i.ibb.co/x3MqZby/Whats-App-Image-2024-11-25-at-11-51-17-e9c5d114.jpg",
    "imageUrl": "https://i.ibb.co/x3MqZby/Whats-App-Image-2024-11-25-at-11-51-17-e9c5d114.jpg",
    "caption": "BEST LIAR IN THE WORLD!",
    "likes": 1000,
    "timeAgo": "2h"
  },
  {
    "userId": "10",
    "userName": "Idiya",
    "userImage": "https://i.ibb.co/f2VMzfJ/Whats-App-Image-2024-11-25-at-11-56-30-7c820220.jpg",
    "imageUrl": "https://i.ibb.co/f2VMzfJ/Whats-App-Image-2024-11-25-at-11-56-30-7c820220.jpg",
    "caption": "BEST ACTRESS IN THE WORLD",
    "likes": 1000,
    "timeAgo": "2h"
  },
  {
    "userId": "11",
    "userName": "Sairam",
    "userImage": "https://i.ibb.co/jW2TDCb/Whats-App-Image-2024-11-25-at-11-51-40-a295382d.jpg",
    "imageUrl": "https://i.ibb.co/jW2TDCb/Whats-App-Image-2024-11-25-at-11-51-40-a295382d.jpg",
    "caption": "Best actor and writer",
    "likes": 1558000,
    "timeAgo": "2h"
  },
  {
    "userId": "12",
    "userName": "Samantha",
    "userImage": "https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg",
    "imageUrl": "https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg",
    "caption": "Lady superstar",
    "likes": 100000000000,
    "timeAgo": "1h"
  },
  {
    "userId": "13",
    "userName": "Kabilan",
    "userImage": "https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg",
    "imageUrl": "https://i.ibb.co/3NZZS7R/Whats-App-Image-2024-11-25-at-11-41-44-76fc0821.jpg",
    "caption": "Camera man",
    "likes": 1000,
    "timeAgo": "1h"
  },
  {
    "userId": "14",
    "userName": "Romario Kavin",
    "userImage": "https://i.ibb.co/MBN4TvX/Whats-App-Image-2024-11-25-at-12-14-25-d06fcc63.jpg",
    "imageUrl": "https://i.ibb.co/MBN4TvX/Whats-App-Image-2024-11-25-at-12-14-25-d06fcc63.jpg",
    "caption": "Best director",
    "likes": 150088,
    "timeAgo": "2h"
  },
  {
    "userId": "15",
    "userName": "Valan Amal",
    "userImage": "https://i.ibb.co/WgqGN5b/Whats-App-Image-2024-11-25-at-12-12-46-de6ce725.jpg",
    "imageUrl": "https://i.ibb.co/WgqGN5b/Whats-App-Image-2024-11-25-at-12-12-46-de6ce725.jpg",
    "caption": "Best scriptwriter",
    "likes": 150088,
    "timeAgo": "2h"
  }
];


    // Insert the dummy data
    await postsCollection.insertAll(dummyData);
    print('Data inserted successfully!');
  }

  // Close the database connection
  static Future<void> close() async {
    await db.close();
    print('Database connection closed');
  }
}
