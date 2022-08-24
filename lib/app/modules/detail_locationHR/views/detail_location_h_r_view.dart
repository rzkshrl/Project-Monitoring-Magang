import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_location_h_r_controller.dart';

class DetailLocationHRView extends GetView<DetailLocationHRController> {
  const DetailLocationHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailLocationHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailLocationHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
