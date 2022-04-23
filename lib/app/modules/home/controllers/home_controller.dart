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
import 'package:printing/printing.dart';

var depo = GetStorage();

class HomeController extends GetxController {
  // sftp://root@82.165.160.241/var/www/vhosts/kkspro.de/httpdocs/license/license-erol1.json
  var now = DateTime.now();
  var formatterDate = DateFormat('dd/MM/yy');
  var formatterTime = DateFormat('kk:mm');

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

  writeonPdf(
      String name,
      adresse,
      telefon,
      abholdatum,
      lieferdatum,
      firmamaterial,
      stoffmeter,
      leder,
      bestellt,
      preis,
      wasmachen,
      notiz) async {
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(8),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text(
                'Polsterhof-Auftragannahme ' + actualDate + "-" + actualTime,
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
    String id = "-MitPreis-";
    await savePdf(id);
  }

  writeonPdfNull(String name, adresse, telefon, abholdatum, lieferdatum,
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
          ];
        }));
    String id = "OhnePreis";
    await savePdf(id);
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

  adressDegis(String gelen) {
    String giden = gelen.replaceAll(r"\", "/");
    print(giden);
    // ignore: avoid_print
  }

  savePdf(String fileid) async {
    var now = DateTime.now();
    var formatterDate = DateFormat('dd_MM_yy');
    var formatterTime = DateFormat('kk_mm');

    String actualDate = "_" + formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    String fileadress = depo.read("fileAdress") + "/";

    fileadress.replaceAll(r"\", "/");
    print(fileadress);
    File file = File(fileadress + "${namet.text + actualDate + fileid}.pdf");

    file.writeAsBytesSync(List.from(await pdf.save()));
    print("PDF saved");
    await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: "${namet.text + actualDate + fileid}-P_Auftrag.pdf");
  }

  

  /*  savePdf2() async {
    var now = DateTime.now();
    var formatterDate = DateFormat('dd_MM_yy');
    var formatterTime = DateFormat('kk_mm');

    String actualDate = "_" + formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    String fileadress = depo.read("fileAdress") + "/";
    fileadress.replaceAll(r"\", "/");
    print(fileadress);
    File file = File(fileadress +
        "${namet.text + actualTime + actualDate} -OhnePreis- .pdf");

    file.writeAsBytesSync(List.from(await pdf.save()));
    print("PDF saved");
    await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: "${namet.text + actualTime + actualDate}-P_Auftrag.pdf");
  } */

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
