import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf(Map<String, dynamic> data) async {
  final pdf = pw.Document();

  final robotoLight = await PdfGoogleFonts.robotoLight();
  
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.SizedBox(height: 20),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.RichText(
                text: pw.TextSpan(
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 25,
                    ),
                    children: [
                      pw.TextSpan(text: 'Data Machine', style: pw.TextStyle(
                          font: robotoLight,
                          fontSize: 24
                      )),
                    ]
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Machine Id: ${data['machineId']}', style: const pw.TextStyle(
                fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Real Time: ${data['realTime']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Cycle Time: ${data['cycleTime']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Optimal Quantity: ${data['optimalQty']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Production Rate: ${data['productionRate']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('OEE: ${data['OEE']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Percentage Quantity: ${data['percentageQty']}%', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Energy Consumption: ${data['energyConsumption']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Percentage Time: ${data['percentageTime']}%', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Raw Material Cost: ${data['rawMaterialCost']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Actual BEP: ${data['actualBEP']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Optimal BEP: ${data['optimalBEP']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
              pw.Text('Down Time Cost: ${data['downTimeCost']}', style: const pw.TextStyle(
                  fontSize: 22
              )),
              pw.SizedBox(height: 10),
            ]
          )
        ]
      ),
      pageTheme: pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(
          base: robotoLight
        ),
        buildBackground: (context) => pw.FullPage(
          ignoreMargins: true,
        )
      ),
    )
  );

  return pdf.save();
}