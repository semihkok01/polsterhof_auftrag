import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polsterhof-PDF'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              /*  width: Get.width,
              height: Get.height, */
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Auftragsannahme",
                style: TextStyle(fontSize: 40),
              ),
              TextFormField(
                controller: controller.namet,
                decoration: InputDecoration(
                  labelText: "Name:",
                ),
              ),
              TextFormField(
                controller: controller.adresset,
                decoration: InputDecoration(
                  labelText: "Adresse:",
                ),
              ),
              TextFormField(
                controller: controller.telefont,
                decoration: InputDecoration(
                  labelText: "Telefon:",
                ),
              ),
              TextFormField(
                controller: controller.abholdatumt,
                decoration: InputDecoration(
                  labelText: "Abholdatum:",
                ),
              ),
              TextFormField(
                controller: controller.lieferdatumt,
                decoration: InputDecoration(
                  labelText: "Lieferdatum:",
                ),
              ),
              TextFormField(
                controller: controller.firmamaterialt,
                decoration: InputDecoration(
                  labelText: "Firma-Material:",
                ),
              ),
              TextFormField(
                controller: controller.stoffmetert,
                decoration: InputDecoration(
                  labelText: "Stoff-Meter:",
                ),
              ),
              TextFormField(
                controller: controller.ledert,
                decoration: InputDecoration(
                  labelText: "Leder:",
                ),
              ),
              TextFormField(
                controller: controller.bestelltt,
                decoration: InputDecoration(
                  labelText: "Bestellt am:",
                ),
              ),
              TextFormField(
                controller: controller.preist,
                decoration: InputDecoration(
                  labelText: "Preis:",
                ),
              ),
              TextFormField(
                controller: controller.wasmachent,
                decoration: InputDecoration(
                  labelText: "Was machen:",
                ),
              ),
              TextFormField(
                maxLines: 5,
                controller: controller.notizt,
                decoration: const InputDecoration(
                  labelText: "NOTIZ:",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.getFileAdress();
                      },
                      child: Obx(() => Column(
                            children: [
                              Text("Bild 1"),
                              Image.file(
                                File(controller.dosyaAdresi1.value),
                                height: 500.0,
                                width: 500.0,
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        controller.getFileAdress2();
                      },
                      child: Obx(() => Column(
                            children: [
                              Text("Bild 2"),
                              Image.file(
                                File(controller.dosyaAdresi2.value),
                                height: 500.0,
                                width: 500.0,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory documentDirectory =
              await getApplicationDocumentsDirectory();
          String documentPath = documentDirectory.path;

          controller.writeonPdf(
            controller.namet.text,
            controller.adresset.text,
            controller.telefont.text,
            controller.abholdatumt.text,
            controller.lieferdatumt.text,
            controller.firmamaterialt.text,
            controller.stoffmetert.text,
            controller.ledert.text,
            controller.bestelltt.text,
            controller.preist.text,
            controller.wasmachent.text,
            controller.notizt.text,
          );
        },
        child: Icon(Icons.save),
        //Test
      ),
    );
  }
}
