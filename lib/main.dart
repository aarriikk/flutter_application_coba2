import 'package:flutter/material.dart';
import 'DataBase/mongoDB.dart';
import 'Pages/Login_Page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
