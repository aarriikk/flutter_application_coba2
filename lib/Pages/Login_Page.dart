import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/Pages/Buat_Akun.dart';
import 'package:flutter_application_coba2/Pages/Home_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Page.dart';
import './Buat_Akun.dart';
import './Main_Page.dart';
import 'package:http/http.dart' as http;

import '../DataBase/config.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  var myToken;

  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPAge(token: myToken)));
      } else {
        print('Something went wrong');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Center(
            child: Text("Login Page"),
          )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.key),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(top: 50),
                onTap: (() {
                  loginUser();
                }),
                title: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return BuatAkun();
                    },
                  ));
                }),
                title: Center(
                  child: Text(
                    "buat akun",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
