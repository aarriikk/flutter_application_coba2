import 'package:flutter/material.dart';

class Manual_Page extends StatelessWidget {
  const Manual_Page({super.key});

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
              children: [Text('ini tempat info untuk pengoprasian manual')]),
        ));
  }
}
