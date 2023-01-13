import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polsterhof_auftrag/main.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getDirectory();

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                /*  width: Get.width,
              height: Get.height, */
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    /* Row(
                      children: [
                        TextButton(
                          child: Text("Briefkopf\n Vorlage"),
                          onPressed: () {},
                        ),
                      ],
                    ), */
                    Image.asset(
                      "assets/logo.png",
                      width: 100,
                      height: 100,
                      scale: 0.1,
                    ),
                    const Text(
                      "Auftragsannahme",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.namet,
                  decoration: const InputDecoration(
                    labelText: "Name:",
                  ),
                ),
                TextFormField(
                  controller: controller.adresset,
                  decoration: const InputDecoration(
                    labelText: "Adresse:",
                  ),
                ),
                TextFormField(
                  controller: controller.telefont,
                  decoration: const InputDecoration(
                    labelText: "Telefon:",
                  ),
                ),
                TextFormField(
                  controller: controller.abholdatumt,
                  decoration: const InputDecoration(
                    labelText: "Abholdatum:",
                  ),
                ),
                TextFormField(
                  controller: controller.lieferdatumt,
                  decoration: const InputDecoration(
                    labelText: "Lieferdatum:",
                  ),
                ),
                TextFormField(
                  controller: controller.firmamaterialt,
                  decoration: const InputDecoration(
                    labelText: "Material:",
                  ),
                ),
                TextFormField(
                  controller: controller.bestelltt,
                  decoration: const InputDecoration(
                    labelText: "Bestellt am:",
                  ),
                ),
                TextFormField(
                  controller: controller.preist,
                  decoration: const InputDecoration(
                    labelText: "Preis:",
                  ),
                ),
                TextFormField(
                  controller: controller.wasmachent,
                  decoration: const InputDecoration(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.photoSize1.value = 250;
                              controller.getFileAdress();
                              print(controller.dosyaAdresi1.value);
                              print(controller.photoSize1.value);
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Material"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.deleteFile(
                                              controller.dosyaAdresi1);
                                          controller.photoSize1 = 0.0.obs;
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                      File(controller.dosyaAdresi1.value),

                                      height: Get.height * 0.2,
                                      //height: Get.height * 0.2,
                                      width: Get.width * 0.2,
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              controller.photoSize2.value = 250;
                              controller.getFileAdress2();
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Objekt"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.photoSize2 = 0.0.obs;

                                          controller.deleteFile(
                                              controller.dosyaAdresi2);
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                        File(controller.dosyaAdresi2.value),
                                        height: Get.height * 0.2,
                                        width: Get.width * 0.2),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.photoSize3.value = 250;
                              controller.getFileAdress3();
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Bild 1"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.photoSize3 = 0.0.obs;
                                          controller.deleteFile(
                                              controller.dosyaAdresi3);
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                        File(controller.dosyaAdresi3.value),
                                        height: Get.height * 0.2,
                                        width: Get.width * 0.2),
                                    /* Image.file(
                                      File(controller.dosyaAdresi3.value),
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.2,
                                    ), */
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              controller.photoSize4.value = 250;
                              controller.getFileAdress4();
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Bild 2"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.photoSize4 = 0.0.obs;
                                          controller.deleteFile(
                                              controller.dosyaAdresi4);
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                      File(controller.dosyaAdresi4.value),
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.2,
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.photoSize5.value = 250;
                              controller.getFileAdress5();
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Bild 3"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.photoSize5 = 0.0.obs;
                                          controller.deleteFile(
                                              controller.dosyaAdresi5);
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                      File(controller.dosyaAdresi5.value),
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.2,
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              controller.photoSize6.value = 250;
                              controller.getFileAdress6();
                            },
                            child: Obx(() => Column(
                                  children: [
                                    const Text("Bild 4"),
                                    IconButton(
                                        onPressed: (() {
                                          controller.photoSize6 = 0.0.obs;
                                          controller.deleteFile(
                                              controller.dosyaAdresi6);
                                        }),
                                        icon: const Icon(Icons.delete)),
                                    Image.file(
                                      File(controller.dosyaAdresi6.value),
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.2,
                                    ),
                                  ],
                                )),
                          ),
                        ],
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
                    const Text("Zielordner \n Ändern"),
                    IconButton(
                        onPressed: (() {
                          controller.editFileDirectory();
                        }),
                        icon: const Icon(Icons.file_open_rounded)),
                  ],
                ),
              ],
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            controller.temppreis.value = controller.preist.text;
            await controller.writeonPdf(
              1,
              controller.namet.text,
              controller.adresset.text,
              controller.telefont.text,
              controller.abholdatumt.text,
              controller.lieferdatumt.text,
              controller.firmamaterialt.text,
              controller.bestelltt.text,
              controller.preist.text,
              controller.wasmachent.text,
              controller.notizt.text,
            );

            /* Get.defaultDialog(
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
            ); */
          },

          child: const Icon(Icons.save),
          //Test
        ));
  }
}
