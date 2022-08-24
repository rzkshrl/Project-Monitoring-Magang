import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_h_r_controller.dart';

class SettingHRView extends GetView<SettingHRController> {
  const SettingHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
