import 'package:flutter/material.dart';

class HistoryPage3 extends StatefulWidget {
  const HistoryPage3({super.key});

  @override
  State<HistoryPage3> createState() => _HistoryPage3State();
}

class _HistoryPage3State extends State<HistoryPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("History Page Mesin C"),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('History Page Mesin 3')]),
        ));
  }
}
