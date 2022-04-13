import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

import 'package:get/get.dart';

import '../controllers/pdfviewer_controller.dart';

var gelen = Get.arguments;

class PdfviewerView extends GetView<PdfviewerController> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text('PdfviewerView'),
        centerTitle: true,
      ),
      path: gelen,
    );
  }
}
