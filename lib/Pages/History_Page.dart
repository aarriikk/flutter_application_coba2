import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/DataBase/MongoDBModel.dart';
import 'package:flutter_application_coba2/DataBase/mongoDB.dart';
import 'package:flutter_application_coba2/Pages/About_Pages.dart';
import 'package:flutter_application_coba2/Pages/Help_Pages.dart';
import 'package:flutter_application_coba2/Pages/Profile_Page.dart';
import 'package:flutter_application_coba2/Pages/Settings_Page.dart';
import 'Login_Page.dart';
import 'Home_Page.dart';
import './Profile_Page.dart';
import './Settings_Page.dart';
import './About_Pages.dart';
import './Help_Pages.dart';
import './History_Page.dart';
import './Manual_Page.dart';
import './Data_Pages.dart';
import 'package:pdf/pdf.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'History_Pagess/History_Page_1.dart';
import 'History_Pagess/History_Page_2.dart';
import 'History_Pagess/History_Page_3.dart';
import 'History_Pagess/History_Page_4.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.green,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu Pilihan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              },
              leading: Icon(
                Icons.account_circle,
                size: 35,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Settings(),
                ));
              },
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => About(),
                ));
              },
              leading: Icon(
                Icons.help_outline,
                size: 35,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Help(),
                ));
              },
              leading: Icon(
                Icons.contacts,
                size: 35,
              ),
              title: Text(
                "Help",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              leading: Icon(
                Icons.logout,
                size: 35,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Center(
        child: Text("History Page"),
      )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryPage1()));
              },
              child: _buildButton('Mesin A', Colors.blue),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryPage2()));
              },
              child: _buildButton('Mesin B', Colors.green),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryPage3()));
              },
              child: _buildButton('Mesin C', Colors.red),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryPage4()));
              },
              child: _buildButton('Mesin D', Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


            // child: FutureBuilder(
            //     // future: MongoDatabase.getData(),
            //     builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else {
            //     if (snapshot.hasData) {
            //       var totalData = snapshot.data!.length;
            //       print("Total Data" + totalData.toString());

            //       return ListView.builder(
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             return displayCard(MongoDbModel.fromJson(
            //                 snapshot.data![index] as Map<String, dynamic>));
            //           });
            //     } else {
            //       return Center(
            //         child: Text("No Data Available"),
            //       );
            //     }
            //   }
            // }),
   

  // Widget displayCard(MongoDbModel data) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Column(
  //         children: [
  // Text("${data.id}"),
  // SizedBox(
  //   height: 5,
  // ),
  // Text("${data.username}"),
  // SizedBox(
  //   height: 5,
  // ),
  // Text("${data.rawMaterialKg}"),
  // SizedBox(
  //   height: 5,
  // ),
  // Text("${data.totalProduksi}"),
//           ],
//         ),
//       ),
//     );
//   }

