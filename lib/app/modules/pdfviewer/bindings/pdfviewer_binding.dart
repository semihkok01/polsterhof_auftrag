import 'package:get/get.dart';

import '../controllers/pdfviewer_controller.dart';

class PdfviewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfviewerController>(
      () => PdfviewerController(),
    );
  }
}
