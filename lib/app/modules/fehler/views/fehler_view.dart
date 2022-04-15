import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fehler_controller.dart';

class FehlerView extends GetView<FehlerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FehlerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FehlerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
