// // To parse this JSON data, do
// //
// //     final mongoDbModel = mongoDbModelFromJson(jsonString);

// import 'dart:convert';

// import 'package:mongo_dart/mongo_dart.dart';

// MongoDbModel mongoDbModelFromJson(String str) =>
//     MongoDbModel.fromJson(json.decode(str));

// String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

// class MongoDbModel {
//   MongoDbModel({
//     required this.id,
//     required this.username,
//     required this.totalProduksi,
//     required this.rawMaterialKg,
//   });

//   ObjectId id;
//   String username;
//   String totalProduksi;
//   String rawMaterialKg;

//   factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
//         id: json["_id"],
//         username: json["username"],
//         totalProduksi: json["Total Produksi"],
//         rawMaterialKg: json["Raw Material (KG)"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "username": username,
//         "Total Produksi": totalProduksi,
//         "Raw Material (KG)": rawMaterialKg,
//       };
// }
