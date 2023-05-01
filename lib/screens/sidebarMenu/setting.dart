import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const SidebarComponent(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: const Center(
        child: Text('Setting Page', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
