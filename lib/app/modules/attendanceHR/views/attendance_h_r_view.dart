import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_h_r_controller.dart';

class AttendanceHRView extends GetView<AttendanceHRController> {
  const AttendanceHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AttendanceHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AttendanceHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
