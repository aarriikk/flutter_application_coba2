import 'package:flutter/material.dart';

class DSS_Page extends StatelessWidget {
  const DSS_Page({super.key});

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
              children: [Text('ini tempat info untuk DSS')]),
        ));
  }
}
