import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polsterhof_auftrag/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Flutter'),
        centerTitle: true,
      ),
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("PDF TUTORIAL"),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory documentDirectory =
              await getApplicationDocumentsDirectory();
          String documentPath = documentDirectory.path;
          controller.writeonPdf();
          await controller.savePdf();
          String fullPath = "$documentPath/example.pdf";
          Get.toNamed(Routes.PDFVIEWER, arguments: fullPath);
        },
        child: Icon(Icons.save),
        //Test
      ),
    );
  }
}
