import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'Home_Page.dart';
import './Profile_Page.dart';
import './Settings_Page.dart';
import './About_Pages.dart';
import './Help_Pages.dart';
import './Main_Page.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MainPAge(),
                ));
              },
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
        child: Text("Settings"),
      )),
      body: Center(
        child: Text(
          "Page Untuk Mengubah Pengaturan",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
