import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';

class HomeController extends GetxController {
  final pdf = pw.Document();
  TextEditingController namet = TextEditingController();
  TextEditingController adresset = TextEditingController();
  TextEditingController telefont = TextEditingController();
  TextEditingController abholdatumt = TextEditingController();
  TextEditingController lieferdatumt = TextEditingController();
  TextEditingController firmamaterialt = TextEditingController();
  TextEditingController stoffmetert = TextEditingController();
  TextEditingController ledert = TextEditingController();
  TextEditingController bestelltt = TextEditingController();
  TextEditingController preist = TextEditingController();
  TextEditingController wasmachent = TextEditingController();
  TextEditingController notizt = TextEditingController();

  writeonPdf(String name, adresse, telefon, abholdatum, lieferdatum,
      firmamaterial, stoffmeter, leder, bestellt, preis, wasmachen, notiz) {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text('Auftragannahme',
                style: const pw.TextStyle(
                  fontSize: 40,
                )),
            pw.Paragraph(text: "Name"),
            pw.Text(name.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Adresse"),
            pw.Text(adresse.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Telefon"),
            pw.Text(telefon.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Abholdatum"),
            pw.Text(abholdatum.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Lieferdatum"),
            pw.Text(lieferdatum.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Firmamaterial"),
            pw.Text(firmamaterial.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Stoffmeter"),
            pw.Text(stoffmeter.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Leder"),
            pw.Text(leder.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Bestellt"),
            pw.Text(bestellt.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Preis"),
            pw.Text(preis.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Was machen"),
            pw.Text(wasmachen.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Notiz"),
            pw.Text(notiz.toString()),
          ];
        }));
    savePdf();
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd-hh-mm');
    String date = formatter.format(now);

    File file =
        File("C:/Users/Semih/Desktop/Polsterhof/PA-" + namet.text + ".pdf");
    file.writeAsBytesSync(List.from(await pdf.save()));
/*     await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save()); */
    await Printing.sharePdf(
        bytes: await pdf.save(), filename: date + "Polsterhof Auftrag.pdf");
    /*  PdfPreview(
      build: (format) => pdf.save(),
    ); */
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
