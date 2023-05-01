import 'package:flutter/material.dart';

class BottomNavbarComponent extends StatefulWidget {
  final Function(int) onIndexChanged;
  final int currentIndex;

 const BottomNavbarComponent({Key? key, required this.currentIndex, required this.onIndexChanged}) : super(key: key);

 @override
  State<BottomNavbarComponent> createState() => _BottomNavbarComponent();
}

class _BottomNavbarComponent extends State<BottomNavbarComponent> {

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (index) => widget.onIndexChanged(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'history',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_array),
                label: 'data',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.input),
                label: 'manual',
                backgroundColor: Colors.blue),
          ]);
  }
}