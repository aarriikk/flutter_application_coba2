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
import 'package:jwt_decoder/jwt_decoder.dart';

class MainPAge extends StatefulWidget {
  var token;
  MainPAge({@required this.token, Key? key}) : super(key: key);

  @override
  State<MainPAge> createState() => _MainPAgeState();
}

class _MainPAgeState extends State<MainPAge> {
  int currentIndex = 0;
  final screens = [HomePage(), HistoryPage(), DataPage(), ManualPage()];

  @override
  late String email;

  void initState() {
    super.initState();
    if (widget.token != null) {
      Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
      email = jwtDecodedToken['email'];
    } else {
      // handle the null case
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'history',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_array),
              label: 'data',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.input),
              label: 'Manual',
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
