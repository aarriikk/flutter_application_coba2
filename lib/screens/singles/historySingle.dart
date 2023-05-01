import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/services/machineData_service.dart';
import 'package:my_app/utils/utils.dart';

class HistorySinglePage extends StatefulWidget{
  final int machineId;
  const HistorySinglePage({super.key, required this.machineId});

  @override
  State<HistorySinglePage> createState() => _HistorySinglePageState();
}

class _HistorySinglePageState extends State<HistorySinglePage> {
  final machineDataService = MachineDataService();
  Map<String, dynamic> _machines = {};

  @override
  void initState(){
    super.initState();
    _fetchMachines();
  }

  Future<void> _fetchMachines() async {
    try{
      final res = await machineDataService.getDataPdf(context: context, machineId: widget.machineId);
      final Map<String, dynamic> resData = json.decode(res!.body);
      if(resData['status'] == 'success'){
        final Map<String, dynamic> data = resData['data'];
        setState(() {
        _machines = data;
        });
      } else {
        showSnackBar(context, resData['message'].toString());
      }

    }catch(err){
      showSnackBar(context, err.toString());
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
       child: Column(
         children: [
           Text(_machines['realTime'].toString())
         ],
       ),
      ),
    );
  }

}