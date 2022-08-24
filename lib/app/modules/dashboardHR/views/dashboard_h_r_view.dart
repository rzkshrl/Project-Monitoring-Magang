import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_h_r_controller.dart';

class DashboardHRView extends GetView<DashboardHRController> {
  const DashboardHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
