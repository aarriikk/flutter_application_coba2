import 'package:flutter/material.dart';
import 'package:my_app/components/bottomNavbar.dart';
import 'package:my_app/components/sidebar.dart';
import 'package:my_app/screens/data.dart';
import 'package:my_app/screens/history.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/manual.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const HistoryPage(),
    const DataPage(),
    const ManualPage()
  ];

  void _onIndexChanged(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarComponent(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: _widgetOptions[currentIndex],
      bottomNavigationBar: BottomNavbarComponent(currentIndex: currentIndex, onIndexChanged: _onIndexChanged,)
    );
  }
}
