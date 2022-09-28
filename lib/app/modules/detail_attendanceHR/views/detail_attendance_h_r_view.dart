import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_attendance_h_r_controller.dart';

class DetailAttendanceHRView extends GetView<DetailAttendanceHRController> {
  const DetailAttendanceHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailAttendanceHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailAttendanceHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
