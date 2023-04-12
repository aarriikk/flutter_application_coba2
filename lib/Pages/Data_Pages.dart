import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/DataBase/MongoDBModel.dart';
import 'package:flutter_application_coba2/Pages/About_Pages.dart';
import 'package:flutter_application_coba2/Pages/Help_Pages.dart';
import 'package:flutter_application_coba2/Pages/History_Page.dart';
import 'package:flutter_application_coba2/Pages/Manual_Page.dart';
import 'package:flutter_application_coba2/Pages/Profile_Page.dart';
import 'package:flutter_application_coba2/Pages/Settings_Page.dart';
import 'package:get/get.dart';
import '../DataBase/constant.dart';
import 'Login_Page.dart';
import 'Home_Page.dart';
import './Profile_Page.dart';
import './Settings_Page.dart';
import './About_Pages.dart';
import './Help_Pages.dart';
import './History_Page.dart';
import './Manual_Page.dart';
import './Data_Pages.dart';
import '../DataBase/mongoDB.dart';
import './Data_pagess/Data_Page_1.dart';
import './Data_pagess/Data_Page_2.dart';
import './Data_pagess/Data_Page_3.dart';
import './Data_pagess/Data_Page_4.dart';
import 'package:flutter_application_coba2/Pages/Data_pagess/Data_Page_1.dart'
    as dataPage1;
import 'package:flutter_application_coba2/Pages/Data_pagess/Data_Page_2.dart'
    as dataPage2;
import 'package:flutter_application_coba2/Pages/Data_pagess/Data_Page_3.dart'
    as dataPage3;
import 'package:flutter_application_coba2/Pages/Data_pagess/Data_Page_4.dart'
    as dataPage4;

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextEditingController cycleController = TextEditingController();
  TextEditingController loadingController = TextEditingController();
  TextEditingController bendaController = TextEditingController();
  TextEditingController targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.green,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu Pilihan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              },
              leading: Icon(
                Icons.account_circle,
                size: 35,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Settings(),
                ));
              },
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => About(),
                ));
              },
              leading: Icon(
                Icons.help_outline,
                size: 35,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Help(),
                ));
              },
              leading: Icon(
                Icons.contacts,
                size: 35,
              ),
              title: Text(
                "Help",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              leading: Icon(
                Icons.logout,
                size: 35,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Center(
        child: Text("Data Page"),
      )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => dataPage1.DataPage1(),
                ));
              },
              child: _buildButton('Mesin A', Colors.blue),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => dataPage2.DataPage1(),
                ));
              },
              child: _buildButton('Mesin B', Colors.green),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => dataPage3.DataPage1(),
                ));
              },
              child: _buildButton('Mesin C', Colors.red),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => dataPage4.DataPage1(),
                ));
              },
              child: _buildButton('Mesin D', Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
