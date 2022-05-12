import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:polsterhof_auftrag/app/modules/home/views/home_view.dart';
import 'package:polsterhof_auftrag/app/routes/app_pages.dart';
import 'package:printing/printing.dart';

import '../../../../main.dart';

var depo = GetStorage();

class HomeController extends GetxController {
  // sftp://root@82.165.160.241/var/www/vhosts/kkspro.de/httpdocs/license/license-erol1.json
  var now = DateTime.now();
  var formatterDate = DateFormat('dd/MM/yy');
  var formatterTime = DateFormat('kk:mm');

  late var dosyaAdresi1 = "".obs;
  late var dosyaAdresi2 = "".obs;
  late var dosyaAdresi3 = "".obs;

  late var dosyaAdresi4 = "".obs;

  late var dosyaAdresi5 = "".obs;
  late var dosyaAdresi6 = "".obs;

  var directoryss = "".obs;

  TextEditingController namet = TextEditingController();
  TextEditingController adresset = TextEditingController();
  TextEditingController telefont = TextEditingController();
  TextEditingController abholdatumt = TextEditingController();
  TextEditingController lieferdatumt = TextEditingController();
  TextEditingController firmamaterialt = TextEditingController();

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
  late final image3 = pw.MemoryImage(
    File(dosyaAdresi2.value).readAsBytesSync(),
  );
  late final image4 = pw.MemoryImage(
    File(dosyaAdresi2.value).readAsBytesSync(),
  );
  late final image5 = pw.MemoryImage(
    File(dosyaAdresi2.value).readAsBytesSync(),
  );
  late final image6 = pw.MemoryImage(
    File(dosyaAdresi2.value).readAsBytesSync(),
  );

  getDirectory() async {
    if (depo.read('fileAdress') == null) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        // User canceled the picker
      }

      String filepath = "";
      filepath = selectedDirectory.toString().replaceAll(r"\", "/");
      depo.write("fileAdress", filepath);
      print(filepath);
      //print(dosyaAdresi1.value);
    }

    String dir = Directory.current.path;
    print(dir);
    String bildadress = dir.replaceAll(r"\", "/");
    dosyaAdresi1.value = bildadress + "/bild/bild2.png";
    dosyaAdresi2.value = bildadress + "/bild/bild2.png";
    dosyaAdresi3.value = bildadress + "/bild/bild2.png";
    dosyaAdresi4.value = bildadress + "/bild/bild2.png";
    dosyaAdresi5.value = bildadress + "/bild/bild2.png";
    dosyaAdresi6.value = bildadress + "/bild/bild2.png";

    print(dir);
    //print(dosyaAdresi1.value);
    //print(dosyaAdresi2.value);
  }

  editFileDirectory() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      // User canceled the picker
    }
    String filepath = "";
    filepath = selectedDirectory.toString().replaceAll(r"\", "/");
    depo.write("fileAdress", filepath);
    print(filepath);
  }

  writeonPdf(String name, adresse, telefon, abholdatum, lieferdatum,
      firmamaterial, bestellt, preis, wasmachen, notiz) async {
    final pdf = pw.Document();
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            /*   pw.Watermark(
              child: pw.Image(image2, width: 250, height: 250),
            ), */
            pw.Text(
                'Polsterhof-Auftragannahme ' + actualDate + "-" + actualTime,
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(
                  fontSize: 25,
                )),
            pw.Row(children: [
              pw.Container(
                width: 170,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Paragraph(text: "Name:"),
                      pw.Text(name.toString()),
                    ]),
              ),
              pw.Container(
                width: 170,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Paragraph(text: "Adresse:"),
                      pw.Text(adresse.toString()),
                    ]),
              ),
              pw.Container(
                width: 170,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Paragraph(text: "Telefon:"),
                      pw.Text(telefon.toString()),
                    ]),
              ),
            ]),

/* 
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Name:"),
            pw.Text(name.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Adresse:"),
            pw.Text(adresse.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Telefon:"),
            pw.Text(telefon.toString()), */
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Abholdatum - Lieferdatum:"),
            pw.Text(abholdatum.toString() + " - " + lieferdatum.toString()),
            pw.Divider(thickness: 1),
            pw.Paragraph(text: "Material:"),
            pw.Text(firmamaterial.toString()),
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
            pw.SizedBox(height: 30),
            pw.Column(children: [
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Column(children: [
                  pw.Text("Material"),
                  pw.Image(image, width: 250, height: 250),
                ]),
                pw.SizedBox(width: 30, height: 20),
                pw.Column(children: [
                  pw.Text("Objekt"),
                  pw.Image(image2, width: 250, height: 250),
                ]),
              ]),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Column(children: [
                  pw.Text("Material"),
                  pw.Image(image, width: 250, height: 250),
                ]),
                pw.SizedBox(width: 30, height: 20),
                pw.Column(children: [
                  pw.Text("Objekt"),
                  pw.Image(image2, width: 250, height: 250),
                ]),
                pw.Column(children: [
                  pw.Text("Bild 1"),
                  pw.Image(image3, width: 250, height: 250),
                ]),
                pw.SizedBox(width: 30, height: 20),
                pw.Column(children: [
                  pw.Text("Bild-2"),
                  pw.Image(image4, width: 250, height: 250),
                ]),
                pw.Column(children: [
                  pw.Text("Bild 3"),
                  pw.Image(image5, width: 250, height: 250),
                ]),
                pw.SizedBox(width: 30, height: 20),
                pw.Column(children: [
                  pw.Text("Bild 4"),
                  pw.Image(image6, width: 250, height: 250),
                ]),
              ]),
            ])
          ];
        }));

    return savePdf(pdf);
  }

/*   writeonPdfNull(String name, adresse, telefon, abholdatum, lieferdatum,
      firmamaterial, stoffmeter, leder, bestellt, wasmachen, notiz) async {
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text('Polsterhof-Auftragannahme' + actualDate + "-" + actualTime,
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(
                  fontSize: 20,
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
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
              pw.Image(image3, width: 250, height: 250),
              pw.SizedBox(width: 10),
              pw.Image(image4, width: 250, height: 250),
            ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
              pw.Image(image5, width: 250, height: 250),
              pw.SizedBox(width: 10),
              pw.Image(image6, width: 250, height: 250),
            ]),
          ];
        }));
    String id = "OhnePreis";
    await savePdf(id);
  }
 */
  getFileAdress() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Bitte Image Auswählen",
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
      dialogTitle: "Bitte Image Auswählen",
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

  getFileAdress3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Bitte Image Auswählen",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi3.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  getFileAdress4() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Bitte Image Auswählen",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi4.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  getFileAdress5() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Bitte Image Auswählen",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi5.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  getFileAdress6() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      dialogTitle: "Bitte Image Auswählen",
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) return;
    PlatformFile file = result.files.single;
    /*  String deneme = file.path!.replaceAll(r"\$", r"/"); */
    dosyaAdresi6.value = file.path!;
    //print(file.path);
    adressDegis(file.path.toString());
    //print(dosyaAdresi1.value);
  }

  adressDegis(String gelen) {
    String giden = gelen.replaceAll(r"\", "/");
    print(giden);
    // ignore: avoid_print
  }

  savePdf(dynamic pdf) async {
    var now = DateTime.now();
    var formatterDate = DateFormat('dd_MM_yy');
    var formatterTime = DateFormat('kk_mm');

    String actualDate = "_" + formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    String fileadress = depo.read("fileAdress") + "/";

    fileadress.replaceAll(r"\", "/");
    print(fileadress);
    File file = File(fileadress + "${namet.text + actualDate}.pdf");

    file.writeAsBytesSync(List.from(await pdf.save()));
    print("PDF saved");
    await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: "${namet.text + actualDate}-P_Auftrag.pdf");
    print("PDF shared");
    pdf.document.documentID.toString();
  }

  @override
  Future<void> onInit() async {
    await getDirectory();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getDirectory();
  }

  @override
  void onClose() {}
}
