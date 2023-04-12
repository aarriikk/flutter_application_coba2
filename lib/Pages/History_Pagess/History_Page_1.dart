import 'package:flutter/material.dart';

class HistoryPage1 extends StatefulWidget {
  const HistoryPage1({super.key});

  @override
  State<HistoryPage1> createState() => _HistoryPage1State();
}

class _HistoryPage1State extends State<HistoryPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("History Page Mesin A"),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('History Page Mesin 1')]),
        ));
  }
}
