import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_attendance_h_r_controller.dart';

class ListAttendanceHRView extends GetView<ListAttendanceHRController> {
  const ListAttendanceHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListAttendanceHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListAttendanceHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
