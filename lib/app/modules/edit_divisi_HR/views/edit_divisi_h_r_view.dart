import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_divisi_h_r_controller.dart';

class EditDivisiHRView extends GetView<EditDivisiHRController> {
  const EditDivisiHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditDivisiHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditDivisiHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
