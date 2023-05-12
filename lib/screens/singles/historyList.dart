

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/screens/singles/historySingle.dart';
import 'package:my_app/services/machineData_service.dart';
import 'package:my_app/utils/utils.dart';

class HistoryListPage extends StatefulWidget {
  final int machineId;
  const HistoryListPage({super.key, required this.machineId});

  @override
  State<HistoryListPage> createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
 final machineDataService = MachineDataService();
 var _machines = [];

 @override
 void initState(){
   super.initState();
   _fetchMachines();
 }
  
  Future<void> _fetchMachines() async {
    try{
      final res = await machineDataService.getAllMachine(context: context, machineId: widget.machineId);
      final Map<String, dynamic> resData = json.decode(res.body);
      if(resData['status'] == 'success'){
        setState(() {
          _machines = resData['data'];
        });
      }
    }catch(err){
      showSnackBar(context, err.toString());
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _machines.length,
        itemBuilder: (context, index){
          final machine = _machines[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HistorySinglePage(machineId: (machine as Map<String, dynamic>)['machineId'], id: machine['_id'],))
              );
            },
            child: ListTile(
            title: Text('${(index + 1).toString()}. Data ke-${index + 1}' ),
            subtitle: Text(machine['createdAt'].toString()),
          ),
          );
        },
      ),
    );
  }
}