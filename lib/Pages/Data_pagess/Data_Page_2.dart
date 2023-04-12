import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/DataBase/MongoDBModel.dart';
import 'package:flutter_application_coba2/Pages/About_Pages.dart';
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
  TextEditingController cycleControllerB = TextEditingController();
  TextEditingController UptimeControllerB = TextEditingController();
  TextEditingController bendaControllerB = TextEditingController();
  TextEditingController KuantitasControllerB = TextEditingController();
  TextEditingController RWGControllerB = TextEditingController();
  TextEditingController RWPControllerB = TextEditingController();
  bool _isNotValidate = false;

  @override
  void addParameter2() async {
    if (cycleControllerB.text.isNotEmpty &&
        UptimeControllerB.text.isNotEmpty &&
        bendaControllerB.text.isNotEmpty &&
        KuantitasControllerB.text.isNotEmpty &&
        RWGControllerB.text.isNotEmpty &&
        RWPControllerB.text.isNotEmpty) {
      var regBody = {
        "CycleTime_B": cycleControllerB.text,
        "UpTime_B": UptimeControllerB.text,
        "TipeBenda_B": bendaControllerB.text,
        "TargetQTY_B": KuantitasControllerB.text,
        "RawMattGram_B": RWGControllerB.text,
        "RawMattPrice_B": RWPControllerB.text,
      };

      var response = await http.post(Uri.parse(Parameter2),
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
        child: Text("Data Page Mesin B"),
      )),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Masukan data sebagai parameter pada mesin B",
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
                controller: bendaControllerB,
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
                controller: KuantitasControllerB,
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
                controller: UptimeControllerB,
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
                controller: cycleControllerB,
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
                controller: RWGControllerB,
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
                controller: RWPControllerB,
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
                    addParameter2();
                    cycleControllerB.clear();
                    UptimeControllerB.clear();
                    bendaControllerB.clear();
                    KuantitasControllerB.clear();
                    RWGControllerB.clear();
                    RWPControllerB.clear();
                  },
                  child: Text('Submit'),
                ),
              ),
            ),
          ]),
    );
  }
}
