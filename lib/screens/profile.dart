import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Profile page', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}


