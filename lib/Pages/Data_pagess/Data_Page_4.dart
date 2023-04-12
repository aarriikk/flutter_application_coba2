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
import 'dart:convert';

class DataPage1 extends StatefulWidget {
  const DataPage1({super.key});

  @override
  State<DataPage1> createState() => _DataPage1State();
}

class _DataPage1State extends State<DataPage1> {
  TextEditingController cycleControllerD = TextEditingController();
  TextEditingController UptimeControllerD = TextEditingController();
  TextEditingController bendaControllerD = TextEditingController();
  TextEditingController KuantitasControllerD = TextEditingController();
  TextEditingController RWGControllerD = TextEditingController();
  TextEditingController RWPControllerD = TextEditingController();
  bool _isNotValidate = false;

  @override
  void addParameter4() async {
    if (cycleControllerD.text.isNotEmpty &&
        UptimeControllerD.text.isNotEmpty &&
        bendaControllerD.text.isNotEmpty &&
        KuantitasControllerD.text.isNotEmpty &&
        RWGControllerD.text.isNotEmpty &&
        RWPControllerD.text.isNotEmpty) {
      var regBody = {
        "CycleTime_D": cycleControllerD.text,
        "UpTime_D": UptimeControllerD.text,
        "TipeBenda_D": bendaControllerD.text,
        "TargetQTY_D": KuantitasControllerD.text,
        "RawMattGram_D": RWGControllerD.text,
        "RawMattPrice_D": RWPControllerD.text,
      };

      var response = await http.post(Uri.parse(Parameter4),
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
        child: Text("Data Page Mesin D"),
      )),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Masukan data sebagai parameter pada mesin D",
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
                controller: bendaControllerD,
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
                controller: KuantitasControllerD,
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
                controller: UptimeControllerD,
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
                controller: cycleControllerD,
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
                controller: RWGControllerD,
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
                controller: RWPControllerD,
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
                    addParameter4();
                    cycleControllerD.clear();
                    UptimeControllerD.clear();
                    bendaControllerD.clear();
                    KuantitasControllerD.clear();
                    RWGControllerD.clear();
                    RWPControllerD.clear();
                  },
                  child: Text('Submit'),
                ),
              ),
            ),
          ]),
    );
  }
}
