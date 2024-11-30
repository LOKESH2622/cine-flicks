import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';

const _db_url ="mongodb+srv://lokesh26csb:lokesh558@cineflicks.opkml.mongodb.net/ad_aaappp?retryWrites=true&w=majority&appName=cineflicks";
const user_collection ="cine";

class MongoDatabase {
  static connect() async {
    try {
      var db = await Db.create(_db_url);
      await db.open();
      inspect(db);
      print("MongoDB connection established successfully!");
      
      var collection = db.collection(user_collection);
      return "Connected";
    } catch (e) {
      print("MongoDB connection failed: $e");
      return "Failed to connect";
    }
  }
}
