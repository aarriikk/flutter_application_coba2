import 'package:flutter/material.dart';

class HistoryPage2 extends StatefulWidget {
  const HistoryPage2({super.key});

  @override
  State<HistoryPage2> createState() => _HistoryPage2State();
}

class _HistoryPage2State extends State<HistoryPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("History Page Mesin B"),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('History Page Mesin 2')]),
        ));
  }
}
