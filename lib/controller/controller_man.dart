import 'dart:io';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class HomeController extends GetxController {
  var products = List.generate(
    5,
    (index) => {
      "id": "${index + 1}",
      "name": "produk ke - ${index + 1}",
      "desc": DateTime.now().toString(),
    },
  );

  void getPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        },
      ),
    ); // Page
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mydoument.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }
}
