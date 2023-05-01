import 'package:flutter/material.dart';

class DataAnalyticPage extends StatelessWidget{
  const DataAnalyticPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Data Analytic Page')
          ],
        ),
      ),
    );
  }
}
