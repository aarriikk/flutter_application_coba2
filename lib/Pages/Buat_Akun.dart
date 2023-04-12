import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../DataBase/config.dart';

class BuatAkun extends StatefulWidget {
  const BuatAkun({super.key});

  @override
  State<BuatAkun> createState() => _BuatAkunState();
}

class _BuatAkunState extends State<BuatAkun> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  @override
  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      print(response);
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("Buat Akun"),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      icon: Icon(Icons.perm_identity),
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      icon: Icon(Icons.key),
                      labelText: "password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       icon: Icon(Icons.key),
                //       labelText: "Password",
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       icon: Icon(Icons.group),
                //       labelText: "Jenis Kelamin",
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                //   child: TextField(
                //     keyboardType: TextInputType.name,
                //     decoration: InputDecoration(
                //       icon: Icon(Icons.factory),
                //       labelText: "Nama Perusahaan",
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                //   child: TextField(
                //     keyboardType: TextInputType.streetAddress,
                //     decoration: InputDecoration(
                //       icon: Icon(Icons.add_road),
                //       labelText: "Alamat Perusahaan",
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        registerUser();
                        emailController.clear();
                        passwordController.clear();
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
