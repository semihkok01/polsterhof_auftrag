import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:polsterhof_auftrag/app/routes/app_pages.dart';
import 'package:printing/printing.dart';

class HomeController extends GetxController {
  final pdf = pw.Document();

  writeonPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            
            pw.Header(level: 0, child: pw.Text("Easy Approach Document")),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Header(level: 1, child: pw.Text("Second Approach Document")),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
            pw.Paragraph(
                text:
                    "Deneme Text 1 , Semih Berkayi cok seviyor, Seni seviyorum"),
          ];
        }));
    savePdf();
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(List.from(await pdf.save())); 
   
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
