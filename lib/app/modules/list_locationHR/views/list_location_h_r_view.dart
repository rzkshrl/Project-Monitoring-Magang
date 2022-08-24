import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_location_h_r_controller.dart';

class ListLocationHRView extends GetView<ListLocationHRController> {
  const ListLocationHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListLocationHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListLocationHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
