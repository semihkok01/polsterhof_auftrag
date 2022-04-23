import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getDirectory();

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
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.2,
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 40,
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
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.2,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                /*  Wrap(
                children: [
                  Positioned(
                    child: FloatingActionButton(
                        child: Icon(Icons.payment), onPressed: () {}),
                    bottom: 30,
                    right: 20,
                  ),
                ],
              ), */
                Column(
                  children: [
                    Text("Zielordner \n Ändern"),
                    IconButton(
                        onPressed: (() {
                          controller.editFileDirectory();
                        }),
                        icon: Icon(Icons.file_open_rounded)),
                  ],
                ),
              ],
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await controller.writeonPdf(
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

            Get.defaultDialog(
              title: "Ohne Preis Ausdrucken ? ",
              content: Container(
                child: Column(
                  children: [
                    Text("Möchten Sie auch ohne Preis Version Ausdrucken ?"),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.writeonPdfNull(
                          controller.namet.text,
                          controller.adresset.text,
                          controller.telefont.text,
                          controller.abholdatumt.text,
                          controller.lieferdatumt.text,
                          controller.firmamaterialt.text,
                          controller.stoffmetert.text,
                          controller.ledert.text,
                          controller.bestelltt.text,
                          controller.wasmachent.text,
                          controller.notizt.text,
                        );
                        Get.back();
                      },
                      child: Text("JA"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("NEIN"),
                    ),
                  ],
                ),
              ),
            );
          },

          child: Icon(Icons.save),
          //Test
        ));
  }
}
