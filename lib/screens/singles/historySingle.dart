import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/screens/pdf/generatePdf.dart';
import 'package:my_app/services/machineData_service.dart';
import 'package:my_app/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class HistorySinglePage extends StatefulWidget{
  final int machineId;
  const HistorySinglePage({super.key, required this.machineId});

  @override
  State<HistorySinglePage> createState() => _HistorySinglePageState();
}

class _HistorySinglePageState extends State<HistorySinglePage> {
  final machineDataService = MachineDataService();
  Map<String, dynamic> _machines = {};
  final pdf = pw.Document();


  Future<void> _saveAsFile(
      BuildContext context,
      LayoutCallback build,
      PdfPageFormat pageFormat,
      ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

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

    final actions = <PdfPreviewAction>[
      PdfPreviewAction(
        icon: const Icon(Icons.save),
        onPressed: _saveAsFile,
      )
    ];

    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(
        build: (format) => generatePdf(_machines),
        maxPageWidth: 700,
        actions: actions,
      ),

      // body: Container(
      //  child: Column(
      //    children: [
      //      Center(
      //        child: Text(_machines['realTime'].toString(),),
      //      ),
      //    ],
      //  ),
      // ),
    );
  }

}