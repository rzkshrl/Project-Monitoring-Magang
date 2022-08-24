import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_h_r_controller.dart';

class HomeHRView extends GetView<HomeHRController> {
  const HomeHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
