import 'package:flutter/material.dart';

class HistoryPage4 extends StatefulWidget {
  const HistoryPage4({super.key});

  @override
  State<HistoryPage4> createState() => _HistoryPage4State();
}

class _HistoryPage4State extends State<HistoryPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("History Page Mesin D"),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('History Page Mesin 4')]),
        ));
  }
}
