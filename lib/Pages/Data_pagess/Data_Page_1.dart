import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/DataBase/MongoDBModel.dart';
import 'package:flutter_application_coba2/Pages/About_Pages.dart';
import 'package:flutter_application_coba2/Pages/Data_Pages.dart';
import 'package:flutter_application_coba2/Pages/Help_Pages.dart';
import 'package:flutter_application_coba2/Pages/History_Page.dart';
import 'package:flutter_application_coba2/Pages/Manual_Page.dart';
import 'package:flutter_application_coba2/Pages/Profile_Page.dart';
import 'package:flutter_application_coba2/Pages/Settings_Page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../DataBase/config.dart';

class DataPage1 extends StatefulWidget {
  const DataPage1({super.key});

  @override
  State<DataPage1> createState() => _DataPage1State();
}

class _DataPage1State extends State<DataPage1> {
  TextEditingController cycleControllerA = TextEditingController();
  TextEditingController UptimeControllerA = TextEditingController();
  TextEditingController bendaControllerA = TextEditingController();
  TextEditingController KuantitasControllerA = TextEditingController();
  TextEditingController RWGControllerA = TextEditingController();
  TextEditingController RWPControllerA = TextEditingController();
  bool _isNotValidate = false;

  @override
  void addParameter1() async {
    if (cycleControllerA.text.isNotEmpty &&
        UptimeControllerA.text.isNotEmpty &&
        bendaControllerA.text.isNotEmpty &&
        KuantitasControllerA.text.isNotEmpty &&
        RWGControllerA.text.isNotEmpty &&
        RWPControllerA.text.isNotEmpty) {
      var regBody = {
        "CycleTime_A": cycleControllerA.text,
        "UpTime_A": UptimeControllerA.text,
        "TipeBenda_A": bendaControllerA.text,
        "TargetQTY_A": KuantitasControllerA.text,
        "RawMattGram_A": RWGControllerA.text,
        "RawMattPrice_A": RWPControllerA.text,
      };

      var response = await http.post(Uri.parse(Parameter1),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      print(response);
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Data Page Mesin A"),
      )),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Masukan data sebagai parameter pada mesin A",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: bendaControllerA,
                decoration: InputDecoration(
                  icon: Icon(Icons.interests),
                  labelText: "Tipe Benda",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: KuantitasControllerA,
                decoration: InputDecoration(
                  icon: Icon(Icons.flag),
                  labelText: "Target Kuantitas Benda",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: UptimeControllerA,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter running time",
                  icon: Icon(Icons.schedule),
                  labelText: "Running Time Machine",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: cycleControllerA,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  icon: Icon(Icons.av_timer),
                  labelText: "Cycle Time Machine",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: RWGControllerA,
                decoration: InputDecoration(
                  icon: Icon(Icons.question_mark),
                  labelText: "Penggunaan raw material/Pcs (g)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: RWPControllerA,
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: "Harga Raw Material (KG)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // await collection.insert({'data': value});
                    addParameter1();
                    cycleControllerA.clear();
                    UptimeControllerA.clear();
                    bendaControllerA.clear();
                    KuantitasControllerA.clear();
                    RWGControllerA.clear();
                    RWPControllerA.clear();
                  },
                  child: Text('Submit'),
                ),
              ),
            ),
          ]),
    );
  }
}
