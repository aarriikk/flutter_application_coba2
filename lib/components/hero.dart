import 'package:flutter/material.dart';
import 'package:my_app/screens/profile.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/user_provider.dart';

class HeroComponent extends StatelessWidget {
  const HeroComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
        color: Colors.grey.shade100
          ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, ${user.email.split('@')[0]}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage())
              );
            }, icon: const Icon(Icons.person, size: 30,))
          ],
        ),
      ]),
    );
  }
}
