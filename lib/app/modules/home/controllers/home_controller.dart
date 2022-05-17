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
  var photoSize1 = 0.0.obs;
  var photoSize2 = 0.0.obs;
  var photoSize3 = 0.0.obs;
  var photoSize4 = 0.0.obs;
  var photoSize5 = 0.0.obs;
  var photoSize6 = 0.0.obs;
  var temppreis = "".obs;
  String dir = Directory.current.path;
  late final logo = pw.MemoryImage(
    File(dir + "/bild/logo.png").readAsBytesSync(),
  );
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
  late final image3 =
      pw.MemoryImage(File(dosyaAdresi2.value).readAsBytesSync());
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

  writeonPdf(double gelen, String name, adresse, telefon, abholdatum,
      lieferdatum, firmamaterial, bestellt, preis, wasmachen, notiz) async {
    final pdf = pw.Document();
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Image(logo, width: 50, height: 50)),
            pw.Header(
              level: 0,
              child: pw.Text(
                "Polsterhof Auftrag+ $actualDate - $actualTime",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            /* pw.Text(
                'Polsterhof-Auftragannahme ' + actualDate + "-" + actualTime,
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(
                  fontSize: 25,
                )), */
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
            pw.Text(temppreis.value.toString()),
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
                  pw.Image(image,
                      width: photoSize1.value, height: photoSize1.value),
                ]),
                pw.SizedBox(width: 30, height: 20),
                pw.Column(children: [
                  pw.Text("Objekt"),
                  pw.Image(image2,
                      width: photoSize2.value, height: photoSize2.value),
                ]),
              ]),
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Row(children: [
                      pw.Image(image3,
                          width: photoSize3.value, height: photoSize3.value),
                      pw.SizedBox(width: 30, height: 20),
                      pw.Image(image4,
                          width: photoSize4.value, height: photoSize4.value),
                    ]),
                    pw.Row(children: [
                      pw.Image(image5,
                          width: photoSize5.value, height: photoSize5.value),
                      pw.SizedBox(width: 30, height: 20),
                      pw.Image(image6,
                          width: photoSize6.value, height: photoSize6.value),
                    ])
                  ]),
            ]),
          ];
        }));

    return savePdf(pdf, gelen);
  }

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

  savePdf(dynamic pdf, double reciever) async {
    if (reciever == 1) {
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
          filename: "${namet.text + actualDate}-P_MitPreis.pdf");
      print("PDF shared");

      askPriceless();
    } else if (reciever == 0) {
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
      print("PDF saved mit Preis");
      await Printing.sharePdf(
          bytes: await pdf.save(),
          filename: "${namet.text + actualDate}-P_OhnePreis.pdf");
      photoSize1.value = 0;
      photoSize2.value = 0;
      photoSize3.value = 0;
      photoSize4.value = 0;
      photoSize5.value = 0;
      photoSize6.value = 0;
    }
  }

  askPriceless() {
    Get.defaultDialog(
        title: "Möchten Sie Ohne Preis auch Exportieren ?",
        content: Row(
          children: [
            ElevatedButton(
              child: const Text("Nein"),
              onPressed: () {
                namet.clear();
                adresset.clear();
                telefont.clear();
                abholdatumt.clear();
                lieferdatumt.clear();
                firmamaterialt.clear();
                bestelltt.clear();
                wasmachent.clear();
                notizt.clear();
                preist.val("");
                temppreis.value = "";
                Get.back();
              },
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text("Ja"),
              onPressed: () {
                temppreis.value = "";
                writeonPdf(
                    0,
                    namet.text,
                    adresset.text,
                    telefont.text,
                    abholdatumt.text,
                    lieferdatumt.text,
                    firmamaterialt.text,
                    bestelltt.text,
                    temppreis.value,
                    wasmachent.text,
                    notizt.text);
                Get.back();
              },
            ),
          ],
        ));
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
