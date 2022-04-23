import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

main() async {
   await GetStorage.init();
  try {
    var response = await Dio().get('http://kkspro.de/license/license');
    //print(response);
    print(response.data);
    String mesaj = response.toString();
    if (mesaj == "true") {
      runApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
      print("License Valid");
    } else {
      Get.offAllNamed(Routes.FEHLER);
      print("License Invalid");
    }
  } catch (e) {
    print(e);
  }
}
