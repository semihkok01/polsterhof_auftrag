import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:polsterhof_auftrag/app/routes/app_pages.dart';

import 'package:printing/printing.dart';

class HomeController extends GetxController {
  late var dosyaAdresi1 = "".obs;
  late var dosyaAdresi2 = "".obs;
  var directoryss = "".obs;

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

  late final image = pw.MemoryImage(
    File(dosyaAdresi1.value).readAsBytesSync(),
  );
  late final image2 = pw.MemoryImage(
    File(dosyaAdresi2.value).readAsBytesSync(),
  );

  getDirectory() async {
    String dir = Directory.current.path;
    dir.replaceAll(r"\", "/");

    //directoryss.value = dir;
    dosyaAdresi1.value = dir.toString() + "/bild/bild2.png";
    dosyaAdresi2.value = dir.toString() + "/bild/bild2.png";
    print(dir);
    print(dosyaAdresi1.value);
    print(dosyaAdresi2.value);
  }

  writeonPdf(String name, adresse, telefon, abholdatum, lieferdatum,
      firmamaterial, stoffmeter, leder, bestellt, preis, wasmachen, notiz) {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text('Polsterhof-Auftragannahme',
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(
                  fontSize: 25,
                )),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Name:"),
            pw.Text(name.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Adresse:"),
            pw.Text(adresse.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Telefon:"),
            pw.Text(telefon.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Abholdatum - Lieferdatum:"),
            pw.Text(abholdatum.toString() + lieferdatum.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Firma/Material:"),
            pw.Text(firmamaterial.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Stoff-Meter:"),
            pw.Text(stoffmeter.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Leder:"),
            pw.Text(leder.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Bestellt am:"),
            pw.Text(bestellt.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Preis:"),
            pw.Text(preis.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Was machen:"),
            pw.Text(wasmachen.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Notiz:"),
            pw.Text(notiz.toString()),
            pw.Divider(thickness: 1),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
              pw.Image(image, width: 250, height: 250),
              pw.SizedBox(width: 10),
              pw.Image(image2, width: 250, height: 250),
            ]),
          ];
        }));
    savePdf();
  }

  getFileAdress() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Lütfen Dosya Seciniz",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi1.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  getFileAdress2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Lütfen Dosya Seciniz",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi2.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  adressDegis(String gelen) {
    String giden = gelen.replaceAll(r"\", "/");
    // ignore: avoid_print
    print(giden);
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd-hh-mm');
    String date = formatter.format(now);

    File file =
        File("C:/Users/burqm/Desktop/Polsterhof/PA-" + namet.text + ".pdf");
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
  Future<void> onInit() async {
    await getDirectory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
