import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';
import '../Pages/Manual_Page.dart';

// class MongoDatabase {
//   static connect() async {
//     var db = await Db.create(MONGO_URL);
//     await db.open();
//     inspect(db);
//     var status = db.serverStatus();
//     print(status);
//     var collection = db.collection(COLLECTION_NAME);
//     // await collection.insertMany([
//     //   {"username": "jam1", "Total Produksi": "80", "Raw Material (KG)": "3"},
//     //   {"username": "jam2", "Total Produksi": "78", "Raw Material (KG)": "2"},
//     //   {"username": "jam3", "Total Produksi": "92", "Raw Material (KG)": "4"},
//     // ]);
//     // print(await collection.find().toList());
//     // await collection.update(
//     //     where.eq('username', 'test123'), modify.set('name', 'ridwan123'));
//     print(await collection.find().toList());
//     // await collection.deleteMany({"username": "test123"});
//   }

//   static Future<List<Map<String, dynamic>>> getData() async {
//     var db = await Db.create(MONGO_URL);
//     await db.open();
//     var collection = db.collection(COLLECTION_NAME);
//     final arrData = await collection.find().toList();
//     return arrData;
//   }
// }
