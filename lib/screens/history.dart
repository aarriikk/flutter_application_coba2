import 'package:flutter/material.dart';
import 'package:my_app/screens/singles/historySingle.dart';
import 'package:my_app/services/machineData_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  MachineDataService machineDataService = MachineDataService();

  var listMachines = [
    {
      'title': 'Machine A',
      'machineId': 1
    },
    {
      'title': 'Machine B',
      'machineId': 2
    },
    {
      'title': 'Machine C',
      'machineId': 3
    },
    {
      'title': 'Machine D',
      'machineId': 4
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('History Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 30,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: listMachines.map((machine)=>
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => HistorySinglePage(machineId: (machine as Map<String, dynamic>)['machineId']))
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade300
                          ),
                          child: Center(
                            child: Text(
                              (machine as Map<String, dynamic>)['title'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      )
                  ).toList(),
                )
            )
          ],
        )
,
      ),
    );
  }
}
