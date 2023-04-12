import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/Pages/About_Pages.dart';
import 'package:flutter_application_coba2/Pages/Data_Pages.dart';
import 'package:flutter_application_coba2/Pages/Help_Pages.dart';
import 'package:flutter_application_coba2/Pages/History_Page.dart';
import 'package:flutter_application_coba2/Pages/Manual_Page.dart';
import 'package:flutter_application_coba2/Pages/Profile_Page.dart';
import 'package:flutter_application_coba2/Pages/Settings_Page.dart';
import 'Login_Page.dart';
import 'Home_Page.dart';
import './Profile_Page.dart';
import './Settings_Page.dart';
import './About_Pages.dart';
import './Help_Pages.dart';
import './History_Page.dart';
import './Manual_Page.dart';
import './Data_Pages.dart';
import './Info_Pages/Analisis_Page.dart';
import './Info_Pages/BEP_Page.dart';
import './Info_Pages/DSS_Page.dart';
import './Info_Pages/History_Page.dart';
import './Info_Pages/IoT_Page.dart';
import './Info_Pages/KPI_Page.dart';
import './Info_Pages/Manual_Page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Text("Home Page"),
        )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Everything You Need To Know',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('assets/AI.jpg')),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'Decision Support System',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DSS_Page(),
                        ));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/BEP.jpg')),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'Break Even Point',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BEP_Page(),
                        ));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('assets/KPI.jpg'),
                              fit: BoxFit.fill),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'Key Performance Indicator',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => KPI_Page(),
                        ));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('assets/IOT.jpg')),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'Internet of Things',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IoT_Page(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Feature You Need to Know',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/MANUAL.png')),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'operate manual feature',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Manual_Page(),
                        ));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('assets/DATA.png'),
                              fit: BoxFit.fitHeight),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'analisis data',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Analisis_Page(),
                        ));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/HISTORY.png'),
                              fit: BoxFit.fitHeight),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            'Data History',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => History_Page(),
                        ));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
